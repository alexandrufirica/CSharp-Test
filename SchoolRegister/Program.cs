using Microsoft.EntityFrameworkCore;
using SchoolRecord.Data;

var builder = WebApplication.CreateBuilder(args);


builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<SchoolRecordDbContext>(options =>
   options.UseSqlServer("Server=localhost;Database=Universitate;Trusted_Connection=True;TrustServerCertificate=true"));

var app = builder.Build();


if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.MapGet("/oras", async (SchoolRecordDbContext db) =>
{
   return await db.Orase.ToListAsync();

});

app.MapPost("/oras", async (SchoolRecordDbContext db, Orase oras) =>
{
    db.Orase.Add(oras);
    await db.SaveChangesAsync();

    return Results.Created($"/oras{oras.Id}", oras);

});

app.MapGet("/oras{id}", async (SchoolRecordDbContext db, int id) =>
{
    return db.Orase.Find(id);
});

app.MapGet("/student{id}", async (SchoolRecordDbContext db, int id) =>
{
    var result = from note in db.Note
                 join student in db.Student on note.StudentId equals student.Id
                 join materie in db.Materie on note.MaterieId equals materie.Id
                 where student.Id == id
                 select new
                 {
                     StudentId = student.Id,
                     Nume = student.Nume,
                     Prenume = student.Prenume,
                     Materie = materie.Nume,
                     Nota = note.Nota
                 
                 };
    
    return result;
});


app.Run();

