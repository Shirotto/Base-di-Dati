DROP DATABASE IF EXISTS market;
CREATE DATABASE market;
USE market;
DROP TABLE IF EXISTS utente;
DROP TABLE IF EXISTS richiesta_acquisto;
DROP TABLE IF EXISTS propone;
DROP TABLE IF EXISTS associa;
DROP TABLE IF EXISTS categoria;
DROP TABLE IF EXISTS specifica;
DROP TABLE IF EXISTS prodotto_candidato;


CREATE TABLE utente (
    ID INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(200) NOT NULL,
    cognome VARCHAR(200) NOT NULL,
    indirizzo VARCHAR(200),
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) NOT NULL,
    tipo ENUM('u', 'a','t') NOT NULL DEFAULT 'u'
);

CREATE TABLE richiesta_acquisto (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    ID_utente INTEGER UNSIGNED NOT NULL,
    totale FLOAT UNSIGNED NOT NULL,
    `data` DATETIME NOT NULL,
    numero_richiesta INTEGER UNSIGNED,
    CONSTRAINT utente_assegnato FOREIGN KEY (ID_utente)
        REFERENCES utente (ID)
        ON UPDATE CASCADE
);

CREATE TABLE prodotto_candidato (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome_prodotto VARCHAR(200) NOT NULL,
    nome_produttore VARCHAR(200) NOT NULL,
    ID_richiesta_acquisto INTEGER NOT NULL,
    codice_prodotto INTEGER UNSIGNED NOT NULL UNIQUE,
    URL_info VARCHAR(2083),
    note VARCHAR(500),
    prezzo FLOAT NOT NULL,
    approvazione BOOLEAN NOT NULL,
    CONSTRAINT prodotto_richiesta FOREIGN KEY (ID_richiesta_acquisto)
        REFERENCES richiesta_acquisto (ID)
        ON UPDATE CASCADE
);

CREATE TABLE categoria (
    ID INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE specifica (
    ID INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    quantità INTEGER NOT NULL
);

CREATE TABLE propone (
    stato VARCHAR(100) NOT NULL,
    ID_richiesta_acquisto INTEGER NOT NULL,
    ID_prodotto_candidato INTEGER NOT NULL,
    CONSTRAINT propone_prodotto FOREIGN KEY (ID_prodotto_candidato)
        REFERENCES prodotto_candidato (ID)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT associa_richiesta_acquisto FOREIGN KEY (ID_richiesta_acquisto)
        REFERENCES richiesta_acquisto (ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (ID_richiesta_acquisto , ID_prodotto_candidato)
);

CREATE TABLE seleziona (
    ID_richiesta_acquisto INTEGER UNSIGNED NOT NULL,
    ID_categoria INTEGER UNSIGNED NOT NULL,
    CONSTRAINT associa_categoria FOREIGN KEY (ID_categoria)
        REFERENCES categoria (ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT associa_richiesta FOREIGN KEY (ID_richiesta_acquisto)
        REFERENCES richiesta_acquisto (ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (ID_richiesta_acquisto , ID_categoria)
);

CREATE TABLE associa (
    valore INTEGER UNSIGNED NOT NULL,
    ID_categoria INTEGER UNSIGNED NOT NULL,
    ID_specifica INTEGER UNSIGNED NOT NULL,
    CONSTRAINT associa_categoria FOREIGN KEY (ID_categoria)
        REFERENCES categoria (ID)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT associa_specifica FOREIGN KEY (ID_specifica)
        REFERENCES specifica (ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    PRIMARY KEY (ID_categoria , ID_specifica)
);

INSERT INTO categoria(nome) VALUES ('PERSONAL COMPUTER');
INSERT INTO categoria(nome) VALUES ('COMPUTER FISSI');
INSERT INTO categoria(nome) VALUES ('COMPUTER DA GAMING');
INSERT INTO categoria(nome) VALUES ('TABLET');
INSERT INTO categoria(nome) VALUES ('IBRIDO');
INSERT INTO categoria(nome) VALUES ('MONITORS');
INSERT INTO categoria(nome) VALUES ('TASTIERE');
INSERT INTO categoria(nome) VALUES ('MOUSE');
INSERT INTO categoria(nome) VALUES ('SCHEDE VIDEO');
INSERT INTO categoria(nome) VALUES ('SCHEDE MADRE');


INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Mario','Ranalli','via dei piedini anime','Marialliramario@mario.com','1043223232','u');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Marco','Nicolella','via qua sotto','Marconico@marco.com','0032323235','t');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Antonio','sabatini','via lontanissimo','Antonioercriminale67@antonio.com','1458436984','a');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Gianfranco','Bulgigatti','Via Pantano','Bulgipazzi@dfddfd.it','2121261627','t');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Sandro','Di Biase','via Di Bitonto','Sandrinotp@fdffdf.com','1445118646','u');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Mario','Mariottide','Piazza Dei Poracci','Mariottide@ffdfdf.it','1848698184','u');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Fernandello','Mariottide','Dove Capita','Ferndy@dsdsd.com','3589147614','u');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Paolo','Cannone','Via Milano','Baolo@fdfd.it','4819813714','u');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Zeb','Ottantanove','Malta','Zebbone@emdem.com','1763489654','u');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Pietro','Smusi','Via dello sdunzo','Pietrosmusi@fdfdfd.it','947921314','t');
