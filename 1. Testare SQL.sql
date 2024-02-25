/*
Toate rezolvările se vor face sub forma de cod T-SQL (script T-SQL).

	 Se dă baza de date Universitate :
Orase
	- Id
	- Denumire
Grupa
	- Id
	- Denumire
Student
	- Id
	- Grupa la care aparține
	- Orașul de resedință
	- Nume
	- Prenume
Materie
	- Id
	- Nume
Note
	- Id
	- Student
	- Materia
	- Nota obținută

Coloanele Id sunt de tip identity, încep de la 1 și pasul este de 1.
Coloanele de tip string trebuie să suporte stocarea datelor cu caractere speciale.

*/

-- 1. Să se creeze baza de date "Universitate" cu collate-ul SQL_Romanian_CP1250_CS_AS

	CREATE DATABASE Universitate COLLATE SQL_Romanian_CP1250_CS_AS;

-- 2. Să se creeze tabelele din baza "Universitate".

	CREATE TABLE Orase (
		Id INT IDENTITY(1,1) PRIMARY KEY,
		Denumire NVARCHAR(MAX) COLLATE SQL_Romanian_CP1250_CS_AS
	);
	CREATE TABLE Grupa (
   		 Id INT IDENTITY(1,1) PRIMARY KEY,
  		 Denumire NVARCHAR(MAX) COLLATE SQL_Romanian_CP1250_CS_AS
	);
	CREATE TABLE Student (
   		Id INT IDENTITY(1,1) PRIMARY KEY,
    		GrupaId INT,
    		OrasId INT,
   		Nume NVARCHAR(MAX) COLLATE SQL_Romanian_CP1250_CS_AS,
    		Prenume NVARCHAR(MAX) COLLATE SQL_Romanian_CP1250_CS_AS,
    		FOREIGN KEY (GrupaId) REFERENCES Grupa(Id),
    		FOREIGN KEY (OrasId) REFERENCES Orase(Id)
	);
	CREATE TABLE Materie (
    		Id INT IDENTITY(1,1) PRIMARY KEY,
    		Nume NVARCHAR(MAX) COLLATE SQL_Romanian_CP1250_CS_AS
	);
	CREATE TABLE Note (
    		Id INT IDENTITY(1,1) PRIMARY KEY,
    		StudentId INT,
    		MaterieId INT,
    		Nota INT,
    		FOREIGN KEY (StudentId) REFERENCES Student(Id),
    		FOREIGN KEY (MaterieId) REFERENCES Materie(Id)
	);

-- 3. Să se realizeze integritatea bazei de date prin crearea de constrângeri pentru cele 4 relații prezentate.
		

-- 4. Să se introducă în baza de date următoarele informații:

/*
Orașe:
Ploiești 
Pitești 
Constanța
București
Călărași 
Iași 
Slobozia 
Sibiu 
Cluj-Napoca 
Brașov 
Fetești 
Satu-Mare 
Oradea 
Cernavodă 

Grupe:
A
B
C
D


Materii:
Geometrie 
Algebră 
Statistică 
Trigonometrie 
Muzică 
Desen 
Sport 
Filozofie 
Literatură 
Engleză 
Fizică 
Franceză


Studenți și note:
Numele + prenumele, grupa la care aparține, orașul de resedință

		Student															Note								|				
																											|
Popescu	Mihai, grupa A, Ploiești					Chimie	 7			Fizică		4		Franceză	7	|	Fizică 6
Ionescu	Andrei, grupa A, București					Algebră	 5			Statistică	9		Muzică		6	|	Fizică 9, Chimie 10, Sport 8
Ionescu	Andreea, grupa A, Constanța					Sport	 1			Literatură	2		Franceză	9	|	Sport 5, Literatură 4, Literatură 7
Dinu Nicolae, grupa A, Călărași						Chimie	 8			Algebră		9		Statistică	10	|

															 												|
Constantin Ionuț, grupa B, Cernavodă					Algebră	 10			Sport		10		Fizică		8	|
Simion Mihai, grupa B, Iași						Fizică	 8			Algebră		8		Sport		3	|	Sport 3, Sport 1, Sport 1
Constantinescu Ana-Maria, grupa B, Cernavodă				Sport	 5			Fizică		8		Algebră		2	|	Algebră 5
Amăriuței Eugen, grupa B, Iași						Algebră	 6			Sport		10		Franceză	7	|	
Știrbei	Alexandru, grupa B, Sibiu					Chimie	 9			Fizică		2		Sport		1	|	Fizică 2, Fizică 5, Sport 6
															 												|
Dumitru	Angela, grupa C, Brașov						Desen	 9			Filozofie	7		Engleză		9	|
Dumitrache Ion, grupa C, Oradea						Desen	 8			Statistică	2		Filozofie	7	|	Statistică 6
Șerban Maria-Magdalena, grupa C, Oradea					Engleză	 7			Filozofie	4		Desen		8	|	Filozofie 4, Filozofie 4
Chelaru	Violeta, grupa C, Cluj-Napoca 					Franceză 1			Desen		3		Engleză		10	|	Franceză 6, Desen 1
Sandu Daniel, grupa C, Cluj-Napoca 					Desen	 3			Filozofie	9		Franceză	4	|	Desen 8, Franceză 5
															 												|
Marinache Alin, grupa D, Satu-Mare					Desen	 7			Fizică		8		Engleză		5	|
Panait Vasile, grupa D, Satu-Mare 					Sport	 5			Desen		7		Statistică	10	|	Fizică 8, Literatură 6, Filozofie 9
Popa Mirela, grupa D, Fetești						Engleză	 3			Filozofie	6		Desen		6	|	Engleză	6
Dascălu Daniel Ștefan, grupa D, Fetești					Fizică	 4			Franceză	9		Statistică	10	|	Fizică 2, Fizică 1, Fizică 3, Fizică 5
Georgescu Marian, grupa D, Fetești					Franceză 10			Engleză		10		Fizică		8	|
Dumitrașcu Marius, grupa D, Ploiești					Sport	 5			Algebră		6		Chimie		2	|	Chimie 2, Chimie 5	
Dinu Ionela, grupa D, București						Muzică	 9			Literatură	8		Sport		8	|

 ** Notele se introduc în ordinea din listă, ultima înregistrare reprezentând situația curentă la materia respectivă.

*/
	INSERT INTO Orase (Denumire) VALUES
		(N'Ploiești'),
		(N'Pitești'),
		(N'Constanța'),
		(N'București'),
		(N'Călărași'),
		(N'Iași'),
		(N'Slobozia'),
		(N'Sibiu'),
		(N'Cluj-Napoca'),
		(N'Brașov'),
		(N'Fetești'),
		(N'Satu-Mare'),
		(N'Oradea'),
		(N'Cernavodă');



	INSERT INTO Grupa (Denumire) VALUES
		('A'),
		('B'),
		('C'),
		('D');


	INSERT INTO Materie (Nume) VALUES
		(N'Geometrie'),
		(N'Algebră'),
		(N'Statistică'),
		(N'Trigonometrie'),
		(N'Muzică'),
		(N'Desen'),
		(N'Sport'),
		(N'Filozofie'),
		(N'Literatură'),
		(N'Engleză'),
		(N'Fizică'),
		(N'Franceză');

	INSERT INTO Student (GrupaId, OrasId, Nume, Prenume) VALUES
		((SELECT Id FROM Grupa WHERE Denumire = 'A'), (SELECT Id FROM Orase WHERE Denumire = N'Ploiești'), N'Popescu', N'Mihai'),
		((SELECT Id FROM Grupa WHERE Denumire = 'A'), (SELECT Id FROM Orase WHERE Denumire = N'București'), N'Ionescu', N'Andrei'),
		((SELECT Id FROM Grupa WHERE Denumire = 'A'), (SELECT Id FROM Orase WHERE Denumire = N'Constanța'), N'Ionescu', N'Andreea'),
		((SELECT Id FROM Grupa WHERE Denumire = 'A'), (SELECT Id FROM Orase WHERE Denumire = N'Călărași'), N'Dinu', N'Nicolae'),
		((SELECT Id FROM Grupa WHERE Denumire = 'B'), (SELECT Id FROM Orase WHERE Denumire = N'Cernavodă'), N'Constantin', N'Ionuț'),
		((SELECT Id FROM Grupa WHERE Denumire = 'B'), (SELECT Id FROM Orase WHERE Denumire = N'Iași'), N'Simion', N'Mihai'),
		((SELECT Id FROM Grupa WHERE Denumire = 'B'), (SELECT Id FROM Orase WHERE Denumire = N'Cernavodă'), N'Constantinescu', N'Ana-Maria'),
		((SELECT Id FROM Grupa WHERE Denumire = 'B'), (SELECT Id FROM Orase WHERE Denumire = N'Iași'), N'Amăriuței', N'Eugen'),
		((SELECT Id FROM Grupa WHERE Denumire = 'B'), (SELECT Id FROM Orase WHERE Denumire = N'Sibiu'), N'Știrbei', N'Alexandru'),
		((SELECT Id FROM Grupa WHERE Denumire = 'C'), (SELECT Id FROM Orase WHERE Denumire = N'Brașov'), N'Dumitru', N'Angela'),
		((SELECT Id FROM Grupa WHERE Denumire = 'C'), (SELECT Id FROM Orase WHERE Denumire = N'Oradea'), N'Dumitrache', N'Ion'),
		((SELECT Id FROM Grupa WHERE Denumire = 'C'), (SELECT Id FROM Orase WHERE Denumire = N'Oradea'), N'Șerban', N'Maria-Magdalena'),
		((SELECT Id FROM Grupa WHERE Denumire = 'C'), (SELECT Id FROM Orase WHERE Denumire = N'Cluj-Napoca'), N'Chelaru', N'Violeta'),
		((SELECT Id FROM Grupa WHERE Denumire = 'C'), (SELECT Id FROM Orase WHERE Denumire = N'Cluj-Napoca'), N'Sandu', N'Daniel'),
		((SELECT Id FROM Grupa WHERE Denumire = 'D'), (SELECT Id FROM Orase WHERE Denumire = N'Satu-Mare'), N'Marinache', N'Alin'),
		((SELECT Id FROM Grupa WHERE Denumire = 'D'), (SELECT Id FROM Orase WHERE Denumire = N'Satu-Mare'), N'Panait', N'Vasile'),
		((SELECT Id FROM Grupa WHERE Denumire = 'D'), (SELECT Id FROM Orase WHERE Denumire = N'Fetești'), N'Popa', N'Mirela'),
		((SELECT Id FROM Grupa WHERE Denumire = 'D'), (SELECT Id FROM Orase WHERE Denumire = N'Fetești'), N'Dascălu', N'Daniel Ștefan'),
		((SELECT Id FROM Grupa WHERE Denumire = 'D'), (SELECT Id FROM Orase WHERE Denumire = N'Fetești'), N'Georgescu', N'Marian'),
		((SELECT Id FROM Grupa WHERE Denumire = 'D'), (SELECT Id FROM Orase WHERE Denumire = N'Ploiești'), N'Dumitrașcu', N'Marius'),
		((SELECT Id FROM Grupa WHERE Denumire = 'D'), (SELECT Id FROM Orase WHERE Denumire = N'București'), N'Dinu', N'Ionela');

	DECLARE @NumeMaterie NVARCHAR(100);
	DECLARE @Nume NVARCHAR(100);
	DECLARE @Prenume NVARCHAR(100);
	DECLARE @Nota INT;

	SET @Nume = N'Popescu';
	SET @Prenume = N'Mihai';
	SET @NumeMaterie = N'Chimie';
	SET @Nota = 7;


	IF NOT EXISTS (SELECT 1 FROM Materie WHERE Nume = @NumeMaterie)
	BEGIN
  		INSERT INTO Materie (Nume) VALUES (@NumeMaterie);
	END

	DECLARE @StudentId INT;
	DECLARE @MaterieId INT;

	SET @StudentId = (SELECT Id FROM Student WHERE Nume = @Nume AND Prenume = @Prenume);
	SET @MaterieId = (SELECT Id FROM Materie WHERE Nume = @NumeMaterie);

		
	INSERT INTO Note (StudentId, MaterieId, Nota)
	VALUES (@StudentId, @MaterieId, @Nota);


	INSERT INTO Note (StudentId, MaterieId, Nota) VALUES

		((SELECT Id FROM Student WHERE Nume = N'Popescu' AND Prenume = N'Mihai'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 4),
		((SELECT Id FROM Student WHERE Nume = N'Popescu' AND Prenume = N'Mihai'), (SELECT Id FROM Materie WHERE Nume = N'Franceză'), 7),
		((SELECT Id FROM Student WHERE Nume = N'Popescu' AND Prenume = N'Mihai'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 6),

		((SELECT Id FROM Student WHERE Nume = N'Ionescu' AND Prenume = N'Andrei'), (SELECT Id FROM Materie WHERE Nume = N'Algebră'), 5),
		((SELECT Id FROM Student WHERE Nume = N'Ionescu' AND Prenume = N'Andrei'), (SELECT Id FROM Materie WHERE Nume = N'Statistică'), 9),
		((SELECT Id FROM Student WHERE Nume = N'Ionescu' AND Prenume = N'Andrei'), (SELECT Id FROM Materie WHERE Nume = N'Muzică'), 6),
		((SELECT Id FROM Student WHERE Nume = N'Ionescu' AND Prenume = N'Andrei'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 9),
		((SELECT Id FROM Student WHERE Nume = N'Ionescu' AND Prenume = N'Andrei'), (SELECT Id FROM Materie WHERE Nume = N'Chimie'), 10),
		((SELECT Id FROM Student WHERE Nume = N'Ionescu' AND Prenume = N'Andrei'), (SELECT Id FROM Materie WHERE Nume = N'Sport'), 8),

		((SELECT Id FROM Student WHERE Nume = N'Ionescu' AND Prenume = N'Andreea'), (SELECT Id FROM Materie WHERE Nume = N'Sport'), 1),
		((SELECT Id FROM Student WHERE Nume = N'Ionescu' AND Prenume = N'Andreea'), (SELECT Id FROM Materie WHERE Nume = N'Literatură'), 2),
		((SELECT Id FROM Student WHERE Nume = N'Ionescu' AND Prenume = N'Andreea'), (SELECT Id FROM Materie WHERE Nume = N'Franceză'), 9),
		((SELECT Id FROM Student WHERE Nume = N'Ionescu' AND Prenume = N'Andreea'), (SELECT Id FROM Materie WHERE Nume = N'Sport'), 5),
		((SELECT Id FROM Student WHERE Nume = N'Ionescu' AND Prenume = N'Andreea'), (SELECT Id FROM Materie WHERE Nume = N'Literatură'), 4),
		((SELECT Id FROM Student WHERE Nume = N'Ionescu' AND Prenume = N'Andreea'), (SELECT Id FROM Materie WHERE Nume = N'Literatură'), 7),

		((SELECT Id FROM Student WHERE Nume = N'Dinu' AND Prenume = N'Nicolae'), (SELECT Id FROM Materie WHERE Nume = N'Chimie'), 8),
		((SELECT Id FROM Student WHERE Nume = N'Dinu' AND Prenume = N'Nicolae'), (SELECT Id FROM Materie WHERE Nume = N'Algebră'), 9),
		((SELECT Id FROM Student WHERE Nume = N'Dinu' AND Prenume = N'Nicolae'), (SELECT Id FROM Materie WHERE Nume = N'Statistică'), 10),

		((SELECT Id FROM Student WHERE Nume = N'Constantin' AND Prenume = N'Ionuț'), (SELECT Id FROM Materie WHERE Nume = N'Algebră'), 10),
		((SELECT Id FROM Student WHERE Nume = N'Constantin' AND Prenume = N'Ionuț'), (SELECT Id FROM Materie WHERE Nume = N'Sport'), 10),
		((SELECT Id FROM Student WHERE Nume = N'Constantin' AND Prenume = N'Ionuț'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 8),

		((SELECT Id FROM Student WHERE Nume = N'Simion' AND Prenume = N'Mihai'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 8),
		((SELECT Id FROM Student WHERE Nume = N'Simion' AND Prenume = N'Mihai'), (SELECT Id FROM Materie WHERE Nume = N'Algebră'), 8),
		((SELECT Id FROM Student WHERE Nume = N'Simion' AND Prenume = N'Mihai'), (SELECT Id FROM Materie WHERE Nume = N'Sport'), 3),
		((SELECT Id FROM Student WHERE Nume = N'Simion' AND Prenume = N'Mihai'), (SELECT Id FROM Materie WHERE Nume = N'Sport'), 3),
		((SELECT Id FROM Student WHERE Nume = N'Simion' AND Prenume = N'Mihai'), (SELECT Id FROM Materie WHERE Nume = N'Sport'), 1),
		((SELECT Id FROM Student WHERE Nume = N'Simion' AND Prenume = N'Mihai'), (SELECT Id FROM Materie WHERE Nume = N'Sport'), 1),

		((SELECT Id FROM Student WHERE Nume = N'Constantinescu' AND Prenume = N'Ana-Maria'), (SELECT Id FROM Materie WHERE Nume = N'Sport'), 5),
		((SELECT Id FROM Student WHERE Nume = N'Constantinescu' AND Prenume = N'Ana-Maria'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 8),
		((SELECT Id FROM Student WHERE Nume = N'Constantinescu' AND Prenume = N'Ana-Maria'), (SELECT Id FROM Materie WHERE Nume = N'Algebră'), 2),
		((SELECT Id FROM Student WHERE Nume = N'Constantinescu' AND Prenume = N'Ana-Maria'), (SELECT Id FROM Materie WHERE Nume = N'Algebră'), 5),

		((SELECT Id FROM Student WHERE Nume = N'Amăriuței' AND Prenume = N'Eugen'), (SELECT Id FROM Materie WHERE Nume = N'Algebră'), 6),
		((SELECT Id FROM Student WHERE Nume = N'Amăriuței' AND Prenume = N'Eugen'), (SELECT Id FROM Materie WHERE Nume = N'Sport'), 10),
		((SELECT Id FROM Student WHERE Nume = N'Amăriuței' AND Prenume = N'Eugen'), (SELECT Id FROM Materie WHERE Nume = N'Franceză'), 7),

		((SELECT Id FROM Student WHERE Nume = N'Știrbei' AND Prenume = N'Alexandru'), (SELECT Id FROM Materie WHERE Nume = N'Chimie'), 9),
		((SELECT Id FROM Student WHERE Nume = N'Știrbei' AND Prenume = N'Alexandru'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 2),
		((SELECT Id FROM Student WHERE Nume = N'Știrbei' AND Prenume = N'Alexandru'), (SELECT Id FROM Materie WHERE Nume = N'Sport'), 1),
		((SELECT Id FROM Student WHERE Nume = N'Știrbei' AND Prenume = N'Alexandru'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 2),
		((SELECT Id FROM Student WHERE Nume = N'Știrbei' AND Prenume = N'Alexandru'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 5),
		((SELECT Id FROM Student WHERE Nume = N'Știrbei' AND Prenume = N'Alexandru'), (SELECT Id FROM Materie WHERE Nume = N'Sport'), 6),

		((SELECT Id FROM Student WHERE Nume = N'Dumitru' AND Prenume = N'Angela'), (SELECT Id FROM Materie WHERE Nume = N'Desen'), 9),
		((SELECT Id FROM Student WHERE Nume = N'Dumitru' AND Prenume = N'Angela'), (SELECT Id FROM Materie WHERE Nume = N'Filozofie'), 7),
		((SELECT Id FROM Student WHERE Nume = N'Dumitru' AND Prenume = N'Angela'), (SELECT Id FROM Materie WHERE Nume = N'Engleză'), 9),

		((SELECT Id FROM Student WHERE Nume = N'Dumitrache' AND Prenume = N'Ion'), (SELECT Id FROM Materie WHERE Nume = N'Desen'), 8),
		((SELECT Id FROM Student WHERE Nume = N'Dumitrache' AND Prenume = N'Ion'), (SELECT Id FROM Materie WHERE Nume = N'Statistică'), 2),
		((SELECT Id FROM Student WHERE Nume = N'Dumitrache' AND Prenume = N'Ion'), (SELECT Id FROM Materie WHERE Nume = N'Filozofie'), 7),
		((SELECT Id FROM Student WHERE Nume = N'Dumitrache' AND Prenume = N'Ion'), (SELECT Id FROM Materie WHERE Nume = N'Statistică'), 6),

		((SELECT Id FROM Student WHERE Nume = N'Șerban' AND Prenume = N'Maria-Magdalena'), (SELECT Id FROM Materie WHERE Nume = N'Engleză'), 7),
		((SELECT Id FROM Student WHERE Nume = N'Șerban' AND Prenume = N'Maria-Magdalena'), (SELECT Id FROM Materie WHERE Nume = N'Filozofie'), 4),
		((SELECT Id FROM Student WHERE Nume = N'Șerban' AND Prenume = N'Maria-Magdalena'), (SELECT Id FROM Materie WHERE Nume = N'Desen'), 8),
		((SELECT Id FROM Student WHERE Nume = N'Șerban' AND Prenume = N'Maria-Magdalena'), (SELECT Id FROM Materie WHERE Nume = N'Filozofie'), 4),
		((SELECT Id FROM Student WHERE Nume = N'Șerban' AND Prenume = N'Maria-Magdalena'), (SELECT Id FROM Materie WHERE Nume = N'Filozofie'), 4),

		((SELECT Id FROM Student WHERE Nume = N'Chelaru' AND Prenume = N'Violeta'), (SELECT Id FROM Materie WHERE Nume = N'Franceză'), 1),
		((SELECT Id FROM Student WHERE Nume = N'Chelaru' AND Prenume = N'Violeta'), (SELECT Id FROM Materie WHERE Nume = N'Desen'), 3),
		((SELECT Id FROM Student WHERE Nume = N'Chelaru' AND Prenume = N'Violeta'), (SELECT Id FROM Materie WHERE Nume = N'Engleză'), 10),
		((SELECT Id FROM Student WHERE Nume = N'Chelaru' AND Prenume = N'Violeta'), (SELECT Id FROM Materie WHERE Nume = N'Franceză'), 6),
		((SELECT Id FROM Student WHERE Nume = N'Chelaru' AND Prenume = N'Violeta'), (SELECT Id FROM Materie WHERE Nume = N'Desen'), 1),

		((SELECT Id FROM Student WHERE Nume = N'Sandu' AND Prenume = N'Daniel'), (SELECT Id FROM Materie WHERE Nume = N'Desen'), 3),
		((SELECT Id FROM Student WHERE Nume = N'Sandu' AND Prenume = N'Daniel'), (SELECT Id FROM Materie WHERE Nume = N'Filozofie'), 9),
		((SELECT Id FROM Student WHERE Nume = N'Sandu' AND Prenume = N'Daniel'), (SELECT Id FROM Materie WHERE Nume = N'Franceză'), 4),
		((SELECT Id FROM Student WHERE Nume = N'Sandu' AND Prenume = N'Daniel'), (SELECT Id FROM Materie WHERE Nume = N'Desen'), 8),
		((SELECT Id FROM Student WHERE Nume = N'Sandu' AND Prenume = N'Daniel'), (SELECT Id FROM Materie WHERE Nume = N'Franceză'), 5),

		((SELECT Id FROM Student WHERE Nume = N'Marinache' AND Prenume = N'Alin'), (SELECT Id FROM Materie WHERE Nume = N'Desen'), 7),
		((SELECT Id FROM Student WHERE Nume = N'Marinache' AND Prenume = N'Alin'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 8),
		((SELECT Id FROM Student WHERE Nume = N'Marinache' AND Prenume = N'Alin'), (SELECT Id FROM Materie WHERE Nume = N'Engleză'), 5),

		((SELECT Id FROM Student WHERE Nume = N'Panait' AND Prenume = N'Vasile'), (SELECT Id FROM Materie WHERE Nume = N'Sport'), 5),
		((SELECT Id FROM Student WHERE Nume = N'Panait' AND Prenume = N'Vasile'), (SELECT Id FROM Materie WHERE Nume = N'Desen'), 7),
		((SELECT Id FROM Student WHERE Nume = N'Panait' AND Prenume = N'Vasile'), (SELECT Id FROM Materie WHERE Nume = N'Statistică'), 10),
		((SELECT Id FROM Student WHERE Nume = N'Panait' AND Prenume = N'Vasile'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 8),
		((SELECT Id FROM Student WHERE Nume = N'Panait' AND Prenume = N'Vasile'), (SELECT Id FROM Materie WHERE Nume = N'Literatură'), 6),
		((SELECT Id FROM Student WHERE Nume = N'Panait' AND Prenume = N'Vasile'), (SELECT Id FROM Materie WHERE Nume = N'Filozofie'), 9),

		((SELECT Id FROM Student WHERE Nume = N'Popa' AND Prenume = N'Mirela'), (SELECT Id FROM Materie WHERE Nume = N'Engleză'), 3),
		((SELECT Id FROM Student WHERE Nume = N'Popa' AND Prenume = N'Mirela'), (SELECT Id FROM Materie WHERE Nume = N'Filozofie'), 6),
		((SELECT Id FROM Student WHERE Nume = N'Popa' AND Prenume = N'Mirela'), (SELECT Id FROM Materie WHERE Nume = N'Desen'), 6),
		((SELECT Id FROM Student WHERE Nume = N'Popa' AND Prenume = N'Mirela'), (SELECT Id FROM Materie WHERE Nume = N'Engleză'), 6),

		((SELECT Id FROM Student WHERE Nume = N'Dascălu' AND Prenume = N'Daniel Ștefan'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 4),
		((SELECT Id FROM Student WHERE Nume = N'Dascălu' AND Prenume = N'Daniel Ștefan'), (SELECT Id FROM Materie WHERE Nume = N'Franceză'), 9),
		((SELECT Id FROM Student WHERE Nume = N'Dascălu' AND Prenume = N'Daniel Ștefan'), (SELECT Id FROM Materie WHERE Nume = N'Statistică'), 10),
		((SELECT Id FROM Student WHERE Nume = N'Dascălu' AND Prenume = N'Daniel Ștefan'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 2),
		((SELECT Id FROM Student WHERE Nume = N'Dascălu' AND Prenume = N'Daniel Ștefan'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 1),
		((SELECT Id FROM Student WHERE Nume = N'Dascălu' AND Prenume = N'Daniel Ștefan'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 3),
		((SELECT Id FROM Student WHERE Nume = N'Dascălu' AND Prenume = N'Daniel Ștefan'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 5),

		((SELECT Id FROM Student WHERE Nume = N'Georgescu' AND Prenume = N'Marian'), (SELECT Id FROM Materie WHERE Nume = N'Franceză'), 10),
		((SELECT Id FROM Student WHERE Nume = N'Georgescu' AND Prenume = N'Marian'), (SELECT Id FROM Materie WHERE Nume = N'Engleză'), 10),
		((SELECT Id FROM Student WHERE Nume = N'Georgescu' AND Prenume = N'Marian'), (SELECT Id FROM Materie WHERE Nume = N'Fizică'), 8),

		((SELECT Id FROM Student WHERE Nume = N'Dumitrașcu' AND Prenume = N'Marius'), (SELECT Id FROM Materie WHERE Nume = N'Sport'), 5),
		((SELECT Id FROM Student WHERE Nume = N'Dumitrașcu' AND Prenume = N'Marius'), (SELECT Id FROM Materie WHERE Nume = N'Algebră'), 6),
		((SELECT Id FROM Student WHERE Nume = N'Dumitrașcu' AND Prenume = N'Marius'), (SELECT Id FROM Materie WHERE Nume = N'Chimie'), 2),
		((SELECT Id FROM Student WHERE Nume = N'Dumitrașcu' AND Prenume = N'Marius'), (SELECT Id FROM Materie WHERE Nume = N'Chimie'), 2),
		((SELECT Id FROM Student WHERE Nume = N'Dumitrașcu' AND Prenume = N'Marius'), (SELECT Id FROM Materie WHERE Nume = N'Chimie'), 5),

		((SELECT Id FROM Student WHERE Nume = N'Dinu' AND Prenume = N'Ionela'), (SELECT Id FROM Materie WHERE Nume = N'Muzică'), 9),
		((SELECT Id FROM Student WHERE Nume = N'Dinu' AND Prenume = N'Ionela'), (SELECT Id FROM Materie WHERE Nume = N'Literatură'), 8),
		((SELECT Id FROM Student WHERE Nume = N'Dinu' AND Prenume = N'Ionela'), (SELECT Id FROM Materie WHERE Nume = N'Sport'), 8);
	

-- 5. Să se afișeze numărul de orașe din provincie.

		SELECT 
			COUNT(*) AS NumarOrașe 
		FROM 
			Orase 
		WHERE 
			Denumire != N'București';

-- 6. Să se afișeze numărul de materii la care s-au susținut examene.

		SELECT
			COUNT(DISTINCT MaterieId) AS NumarMateriiCuNote 
		FROM 
			Note;

-- 7. Să se afișeze studenții în ordine alfabetică.

		SELECT 
			Nume,
			Prenume 
		FROM 
			Student 
		ORDER BY 
			Nume ASC,
			Prenume ASC;

-- 8. Să se afișeze studenții cu 2 prenume (prenumele conține caracterul blanc sau - ( liniuță) ).

		SELECT 
			Nume,
			Prenume 
		FROM 
			Student 
		WHERE 
			CHARINDEX(' ', Prenume) > 0 
			OR
			CHARINDEX('-', Prenume) > 0;

-- 9. Să se afișeze studenții din provincie.

		SELECT 
			S.Nume, 
			S.Prenume,
			O.Denumire
		FROM 
			Student S 
		JOIN 
			Orase O ON S.OrasId = O.Id 
		WHERE 
			O.Denumire IS NOT NULL 
			AND O.Denumire != N'București';

-- 10. Să se afișeze orașele care nu au nici un student încris.

		SELECT 
			O.Denumire
		FROM 
			Orase O 
		LEFT JOIN 
			Student S ON O.Id = S.OrasId
		WHERE 
			S.Id IS NULL;

-- 11. Să se afișeze grupele care au cel puțin 5 studenți.

		SELECT 
			G.Denumire 
		FROM 
			Grupa G 
		JOIN 
			Student S ON G.Id = S.GrupaId
		GROUP BY 	
			G.Denumire 
		HAVING 
			COUNT(S.Id) >=5;

-- 12. Să se afișeze numele grupei care are cei mai mulți studenți.

		SELECT TOP 1 
			G.Denumire 
		FROM
			Grupa G
		JOIN 
			Student S ON G.Id = S.GrupaId
		GROUP BY 
			G.Denumire
		ORDER BY 
			COUNT(S.Id) DESC;
	
-- 13. Să se afișeze materiile la care nu s-a dat niciodată examen.

		SELECT 
			M.Nume AS Materie
		FROM 
			Materie M
		LEFT JOIN 
			Note N ON M.Id = N.MaterieId
		WHERE 
			N.Id is NULL;

-- 14. Să se afișeze studenții care au urmat și cursuri opționale ( au notă la mai mult de 3 materii ).

		SELECT
    			S.Nume,
   			S.Prenume
		FROM
  			Student S
		JOIN
 			Note N ON S.Id = N.StudentId
		GROUP BY
    			S.Id, S.Nume, S.Prenume
		HAVING
   			COUNT(DISTINCT N.MaterieId) > 3;

-- 15. Să se calculeze media generală a fiecărui student ( vezi ** ).

		WITH UltimaNota AS (
  		  SELECT
       			StudentId,
        		MaterieId,
        		Nota,
        		ROW_NUMBER() OVER (PARTITION BY StudentId, MaterieId ORDER BY Id DESC) AS Rang
    		FROM
        		Note
		)
		SELECT
   			S.Nume,
			S.Prenume, 
    			AVG(CAST(UN.Nota AS FLOAT)) AS MedieGenerală
		FROM
    			Student S
		JOIN
    			UltimaNota UN ON S.Id = UN.StudentId
		WHERE
   			UN.Rang = 1
		GROUP BY
   			S.Nume,
			S.Prenume;

-- 16. Să se afișeze grupa care are media generală cea mai mare.

		WITH MediiGenerale AS (
    			SELECT
        			G.Denumire,
				S.Id,
				AVG(CAST(N.Nota AS FLOAT)) AS MedieGenerala,
        			ROW_NUMBER() OVER (PARTITION BY G.Denumire ORDER BY AVG(CAST(N.Nota AS FLOAT)) DESC) AS Rang
    			FROM
        			Grupa G
			JOIN
				Student S ON G.Id = S.GrupaId
			JOIN 
				Note N ON S.Id = N.StudentId
			GROUP BY
				G.Denumire,
				S.Id
		)
		SELECT TOP 1
    			Denumire,
    			AVG(MedieGenerala) AS MedieGeneralăGrupa
		FROM
   			MediiGenerale
		WHERE
    			Rang = 1
		GROUP BY
  			Denumire;

-- 17. Să se afișeze studenții bursieri ( care au media generală cel puțin 8,50 ).

		SELECT
    			S.Nume,
    			S.Prenume,
    			AVG(CAST(N.Nota AS FLOAT))
		FROM
  			Student S
		JOIN
   			Note N ON S.Id = N.StudentId
		GROUP BY
   			S.Id,
			S.Nume, 
			S.Prenume
		HAVING
   			 AVG(CAST(N.Nota AS FLOAT)) >= 8.50;

-- 18. Să se afișeze studenții care nu au promovat materia "Chimie" de la prima examinare, dar au promovat ulterior.
		
		WITH NoteChimie AS (
    			SELECT
       				StudentId,
       				MIN(Id) AS PrimaExaminareId
   			FROM
        			Note
    			WHERE
       				MaterieId = (SELECT Id FROM Materie WHERE Nume = 'Chimie')
    			GROUP BY
        			StudentId
		)

		SELECT DISTINCT
    			S.Nume,
    			S.Prenume
		FROM
    			Student S
		JOIN
   			Note N ON S.Id = N.StudentId
		JOIN
    			NoteChimie NC ON S.Id = NC.StudentId
		WHERE
    			N.MaterieId = (SELECT Id FROM Materie WHERE Nume = 'Chimie')
    		AND 
			N.Id > NC.PrimaExaminareId;

-- 19. Să se afișeze studentul care a susținut cele mai multe examinări la aceeași materie.

		WITH ExameneDate AS (
    			SELECT
       				N.StudentId,
        			N.MaterieId,
        			COUNT(*) AS NumarExaminari
    			FROM
        			Note N
    			GROUP BY
       				N.StudentId,
				 N.MaterieId
		)

		SELECT TOP 1
    			S.Nume,
    			S.Prenume,
    			M.Nume AS Materie,
    			EC.NumarExaminari
		FROM
    			ExameneDate EC
		JOIN
    			Student S ON EC.StudentId = S.Id
		JOIN
    			Materie M ON EC.MaterieId = M.Id
		ORDER BY
    			EC.NumarExaminari DESC;

-- 20. Să se afișeze studenții și numărul de examinări la fiecare materie în parte.

		SELECT
    			S.Nume,
   			S.Prenume,
   			M.Nume AS Materie,
    			COUNT(N.Id) AS NumarExaminari
		FROM
    			Student S
		JOIN
    			Note N ON S.Id = N.StudentId
		JOIN
    			Materie M ON N.MaterieId = M.Id
		GROUP BY
    			S.Id,
			S.Nume, 
			S.Prenume, 
			M.Id,
			M.Nume
		ORDER BY
    			S.Nume, 
			S.Prenume, 
			M.Nume;

-- 21. Să se afișeze studenții repetenți (au picat cel puțin o materie ).

		WITH UltimaNotaPeMaterie AS (
    			SELECT
       			 	StudentId,
        			MaterieId,
        			Nota,
        			ROW_NUMBER() OVER (PARTITION BY StudentId, MaterieId ORDER BY Id DESC) AS Rang
    			FROM
        			Note
		)

		SELECT
    			S.Nume,
   			S.Prenume
		FROM
    			Student S
		WHERE
    			EXISTS (
        			SELECT 1
        			FROM
            				UltimaNotaPeMaterie UNM
        			WHERE
            				UNM.StudentId = S.Id
            				AND UNM.Rang = 1
            				AND UNM.Nota < 5
   			 );

-- 22. Să se mute toți repetenții într-o grupă nouă, grupa E. ( vezi pct. anterior)

		IF NOT EXISTS (SELECT 1 FROM Grupa WHERE Denumire = 'E')
			BEGIN
  				INSERT INTO Grupa (Denumire) VALUES ('E');
			END

		UPDATE S
		SET S.GrupaId = (SELECT Id FROM Grupa WHERE Denumire = 'E')
		FROM Student S
		JOIN (
    			SELECT
      				N.StudentId,
        			N.MaterieId,
        			N.Nota,
        			ROW_NUMBER() OVER (PARTITION BY N.StudentId, N.MaterieId ORDER BY N.Id DESC) AS Rang
    			FROM
       				Note N
		) AS UNM ON S.Id = UNM.StudentId
		WHERE 	
			UNM.Rang = 1 AND UNM.Nota < 5;

-- 23. Cel mai slab student este exmatriculat. Să se șteargă studentul din baza de date.

		WITH MediiGenerale AS (
    			SELECT
        			S.Id AS StudentId,
        			AVG(CAST(N.Nota AS FLOAT)) AS MedieGenerală
    			FROM
        			Student S
    			JOIN
        			Note N ON S.Id = N.StudentId
    			GROUP BY
        			S.Id
		)

		, CelMaiSlabStudent AS (
   			SELECT TOP 1
        			StudentId
    			FROM
        			MediiGenerale
    			ORDER BY
        			MedieGenerală
		),

		NoteStudent AS (
    			SELECT
        			Id AS NotaId
    			FROM
        			Note
    			WHERE
        			StudentId = (SELECT StudentId FROM CelMaiSlabStudent)
		)

		DELETE FROM
    			Note
		WHERE
    			Id IN (SELECT NotaId FROM NoteStudent);

		DELETE FROM
    			Student
		WHERE
    			Id = (SELECT StudentId FROM CelMaiSlabStudent);


-- 24. Să se afișeze toți studenții care fac parte din aceeași familie ( au același nume de familie ), după modelul:
/*
	Nume		Prenume
	Ionescu		Andrei
	Ionescu		Andreea

	Rezultat afișat:

	Familia		Frații
	Ionescu		Andrei, Andreea
*/

		
		CREATE TABLE #Fratii (
    			Familia NVARCHAR(100),
   			Fratii NVARCHAR(MAX)
		);


		INSERT INTO #Fratii (Familia, Fratii)
		SELECT
    			Nume AS Familia,
    		STRING_AGG(Prenume, ', ') AS Fratii
		FROM
    			Student
		GROUP BY
   			Nume
		HAVING
    			COUNT(*) > 1; 


		SELECT
    			Familia,
    			Fratii
		FROM
    			#Fratii;

		DROP TABLE #Fratii;
