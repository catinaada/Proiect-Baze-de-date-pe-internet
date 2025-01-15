-- Tabela pentru carti
CREATE TABLE Carti (
    idCarte INT IDENTITY(1,1) PRIMARY KEY,
    titlu VARCHAR(100) NOT NULL,
    autor VARCHAR(30)NOT NULL,
    gen VARCHAR(20)NOT NULL,
	pret INT not null,
    anPublicare INT NOT NULL);
    
INSERT INTO Carti VALUES ( '12 reguli de viata. Un antidot la haosul din jurul nostru', 'Jordan B. Peterson', 'Motivationale',50, 2018);
INSERT INTO Carti VALUES ( 'Terapie 1 la 1 cu sinele tau', 'Raluca Anton', 'Motivationale',45, 2022);
INSERT INTO Carti VALUES ( 'Fetita din scrisoare', 'Emily Gunnis', 'Fantezie',80, 2019);
INSERT INTO Carti VALUES ( 'Diana. Povestea unei printese spusa de ea insasi', 'Andrew Morton', 'Istorie',75, 2021);

CREATE TABLE Utilizatori (
    idUser INT IDENTITY(1,1) PRIMARY KEY,
    numeUser VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    parola VARCHAR(255) NOT NULL
);


INSERT INTO Utilizatori VALUES ( 'Adela Popescu', 'ap@gmail.com', '1234'); 
INSERT INTO Utilizatori VALUES ( 'Stefan Ionescu', 'si@gmail.com', '1121'); 
INSERT INTO Utilizatori VALUES ( 'Mihai Eminescu', 'em@gmail.com', '2222'); 



CREATE TABLE Reviews (
    idReviews INT IDENTITY(1,1) PRIMARY KEY ,
    idCarte INT,
	idUser INT,
    rating INT,
    comentariu VARCHAR(100),
    FOREIGN KEY (idCarte) REFERENCES Carti(idCarte),
	FOREIGN KEY (idUser) REFERENCES Utilizatori(idUser));

INSERT INTO Reviews VALUES ( 1, 1, 5, 'This book is amazing!') ;
  
INSERT INTO Reviews VALUES ( 2, 2, 4, 'Very interesting');
  
INSERT INTO Reviews VALUES ( 3, 2, 3, 'An interesting read');
INSERT INTO Reviews VALUES ( 4, 3, 3, 'Exceptional');

--proceduri
CREATE PROCEDURE [dbo].[AdaugaCarte]
(
    @titlu VARCHAR(100),
    @autor VARCHAR(30),
    @gen VARCHAR(20),
    @pret INT, -- Modificare tip de date
    @anPublicare INT -- Modificare tip de date
)
AS
BEGIN
    INSERT INTO Carti ( titlu, autor, gen, pret, anPublicare)
    VALUES ( @titlu, @autor, @gen, @pret, @anPublicare)
END

CREATE PROCEDURE [dbo].[AfisareReviewsRating]
	@prating INT
AS
	BEGIN
	SELECT  idCarte, rating,comentariu
	FROM Reviews
	WHERE rating=@prating;
END;

