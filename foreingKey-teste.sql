CREATE DATABASE bdSptech;
USE bdSptech;

-- Vamos criar a tabela curso primeiro, porque quando criarmos a tabela aluno, já vamos criar no create table Aluni a coluna que será uma FK para a tabela Curso
CREATE TABLE tbCurso(
	idCurso INT PRIMARY KEY AUTO_INCREMENT,
    siglaCurso CHAR(3),
    coordenador VARCHAR(30)
)AUTO_INCREMENT = 100;

CREATE TABLE tbAluno (
	raAluno INT PRIMARY KEY AUTO_INCREMENT,
    nomeAluno VARCHAR (50),
    bairroAluno VARCHAR(50),
    fkCurso INT,
    FOREIGN KEY(fkCurso) REFERENCES tbCurso(idCurso)
)AUTO_INCREMENT = 5000;

INSERT INTO tbCurso VALUES (NULL, 'ADS','Gerson'),
						   (NULL, 'CCO','Marise'),
                           (NULL, 'SIS','Alex');
                           
SELECT * FROM tbCurso;

INSERT INTO tbAluno VALUES (NULL, 'Maria','Saúde ',100),
							(NULL, 'José','Tatuapé', 100),
                            (NULL, 'Pedro','Consolação',101),
                            (NULL, 'Ana','Janaquara',102),
                            (NULL, 'Paulo', 'Conceição',101);
                            
SELECT * FROM tbAluno;
CREATE TABLE tbGrupo(
	idGrupo INT PRIMARY KEY AUTO_INCREMENT,
    nomeGrupo VARCHAR(20),
    tipoSensor VARCHAR(20)
);
INSERT INTO tbGrupo VALUES (NULL, 'grupo 01', 'umidade'),
							(NULL, 'grupo 02', 'Temperatura'),
							(NULL, 'grupo 03', 'Bloqueio'),
                            (NULL, 'grupo 04', 'Luminosidade');
                            
SELECT * FROM tbGrupo;
SELECT * FROM  tbAluno;
desc tbAluno;
ALTER TABLE tbAluno ADD fkGrupo INT;
ALTER TABLE tbAluno ADD FOREIGN KEY (fkGrupo) REFERENCES tbGrupo(idGrupo);

UPDATE tbAluno SET fkGrupo = 1 WHERE raAluno <= 5001;
UPDATE tbAluno SET fkGrupo = 2 WHERE raAluno IN (5002, 5004);
UPDATE tbAluno SET fkGrupo = 3 WHERE raAluno = 5003