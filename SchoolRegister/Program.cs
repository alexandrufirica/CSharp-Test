using Microsoft.EntityFrameworkCore;
using SchoolRecord.Data;

var builder = WebApplication.CreateBuilder(args);


builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<SchoolRecordDbContext>(options =>
   options.UseSqlServer("Server=localhost;Database=Universitate;Trusted_Connection=True;TrustServerCertificate=true"));

builder.Services.AddMvc(options =>
{
    options.Filters.Add(new BasicAuthenticationAttribute());
});

var app = builder.Build();


if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.MapGet("/student/{id}", async (SchoolRecordDbContext db, int id) =>
{
    var result = from note in db.Note
                 join student in db.Student on note.StudentId equals student.Id
                 join materie in db.Materie on note.MaterieId equals materie.Id
                 where student.Id == id
                 select new
                 {
                   
                     Nume = student.Nume,
                     Prenume = student.Prenume,
                     Materie = materie.Nume,
                     Nota = note.Nota
                 
                 };
    
    return result;
});

app.MapGet("/medie/{id}", async(SchoolRecordDbContext db, int id)  =>
{
    var students = await db.Student
       .Where(s => s.Id == id)
       .ToListAsync();

    var ultimaNota = await (from note in db.Note
                            where note.StudentId == id
                            group note by new { note.StudentId, note.MaterieId } into grouped
                            select grouped.OrderByDescending(n => n.Id).FirstOrDefault())
                            .ToListAsync();

    // Switch to client-side evaluation for the join
    var result = students
        .Join(ultimaNota, student => student.Id, un => un.StudentId,
              (student, un) => new
              {
                  StudentId = student.Id,
                  Nume = student.Nume,
                  Prenume = student.Prenume,
                  Materie = un.MaterieId,
                  Nota = un.Nota
              })
        .GroupBy(n => new { n.StudentId, n.Nume, n.Prenume })
        .Select(group => new
        {
            
            Nume = group.Key.Nume,
            Prenume = group.Key.Prenume,
            OverallAverage = group.Average(g => (double)g.Nota)
        })
        .FirstOrDefault();

    return result;
});


app.Run();

