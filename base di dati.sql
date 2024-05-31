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
    tipo ENUM('utente', 'amministratore','tecnico') NOT NULL DEFAULT 'utente',
    num_richieste_associate INTEGER UNSIGNED not null default 0
);

CREATE TABLE prodotto_candidato (
    ID INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome_prodotto VARCHAR(200) NOT NULL,
    nome_produttore VARCHAR(200) NOT NULL,
    codice_prodotto INTEGER UNSIGNED NOT NULL UNIQUE,
    URL_info VARCHAR(2083),
    note VARCHAR(500),
    prezzo FLOAT UNSIGNED NOT NULL,
    approvazione_prodotto_candidato ENUM('approvato','rifiutato','in valutazione')  NOT NULL DEFAULT 'in valutazione',
    stato_ordine_spedizione ENUM('ordine accettato','ordine rifutato','ordine in sospeso') NOT NULL DEFAULT 'ordine in sospeso'
);

CREATE TABLE richiesta_acquisto (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    ID_utente INTEGER UNSIGNED NOT NULL,
    ID_prodottoass INTEGER UNSIGNED NULL,
    totale FLOAT UNSIGNED DEFAULT NULL,
    `data` DATETIME NOT NULL,
    note VARCHAR(500) DEFAULT NULL,
    tecnico_assegnato INTEGER UNSIGNED DEFAULT NULL,
    stato_richiesta ENUM('aperta', 'chiusa') NOT NULL DEFAULT 'aperta',
    CONSTRAINT tecnico_assegnato FOREIGN KEY (ID_utente)
        REFERENCES utente (ID)
        ON UPDATE CASCADE,
    CONSTRAINT utente_assegnato FOREIGN KEY (ID_utente)
        REFERENCES utente (ID)
        ON UPDATE CASCADE,
    CONSTRAINT prodotto_assegnato FOREIGN KEY (ID_prodottoass)
        REFERENCES prodotto_candidato (ID)
        ON UPDATE CASCADE
);

CREATE TABLE categoria (
    ID INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE specifica (
    ID INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL
);

CREATE TABLE propone (
    stato ENUM('non ordinato','ordinato')  NOT NULL DEFAULT 'non ordinato',
    ID_richiesta_acquisto INTEGER NOT NULL,
    ID_prodotto_candidato INTEGER UNSIGNED NOT NULL,
    CONSTRAINT propone_prodotto FOREIGN KEY (ID_prodotto_candidato)
        REFERENCES prodotto_candidato (ID)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT associa_richiesta_acquisto FOREIGN KEY (ID_richiesta_acquisto)
        REFERENCES richiesta_acquisto (ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (ID_richiesta_acquisto , ID_prodotto_candidato)
);

CREATE TABLE seleziona (
    ID_richiesta_acquisto INTEGER NOT NULL,
    ID_categoria INTEGER UNSIGNED NOT NULL,
    CONSTRAINT associa_categoria1 FOREIGN KEY (ID_categoria)
        REFERENCES categoria (ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT associa_richiesta FOREIGN KEY (ID_richiesta_acquisto)
        REFERENCES richiesta_acquisto (ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (ID_richiesta_acquisto , ID_categoria)
);

CREATE TABLE associa (
    ID_categoria INTEGER UNSIGNED NOT NULL,
    ID_richiesta_acquisto INTEGER NOT NULL,
    ID_specifica INTEGER UNSIGNED NOT NULL,
    quantità INT UNSIGNED NOT NULL,
    CONSTRAINT richiesta_associata FOREIGN KEY (ID_richiesta_acquisto)
    REFERENCES richiesta_acquisto (ID)
    ON UPDATE CASCADE,
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

INSERT INTO specifica(nome) VALUES ('RAM');
INSERT INTO specifica(nome) VALUES ('MEMORIA');
INSERT INTO specifica(nome) VALUES ('HERTZ');


INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Mario','Ranalli','via dei piedini anime','Marialliramario@mario.com','1043223232','utente');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Marco','Nicolella','via qua sotto','Marconico@marco.com','0032323235','tecnico');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Antonio','sabatini','via lontanissimo','Antonioercriminale67@antonio.com','1458436984','amministratore');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Gianfranco','Bulgigatti','Via Pantano','Bulgipazzi@dfddfd.it','2121261627','tecnico');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Sandro','Di Biase','via Di Bitonto','Sandrinotp@fdffdf.com','1445118646','utente');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Mario','Mariottide','Piazza Dei Poracci','Mariottide@ffdfdf.it','1848698184','utente');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Fernandello','Mariottide','Dove Capita','Ferndy@dsdsd.com','3589147614','utente');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Paolo','Cannone','Via Milano','Baolo@fdfd.it','4819813714','utente');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Zeb','Ottantanove','Malta','Zebbone@emdem.com','1763489654','utente');
INSERT INTO utente(nome,cognome,indirizzo,email,telefono,tipo) VALUES ('Pietro','Smusi','Via dello sdunzo','Pietrosmusi@fdfdfd.it','947921314','tecnico');
