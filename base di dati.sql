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
    totale FLOAT UNSIGNED NOT NULL,
    `data` DATETIME NOT NULL,
    numero_richiesta INTEGER UNSIGNED
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

INSERT INTO categoria(nome) VALUES ('ciao');
INSERT INTO categoria(nome) VALUES ('ciao1');
INSERT INTO categoria(nome) VALUES ('ciao2');
SELECT * FROM categoria;
