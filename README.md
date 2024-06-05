# Laboratorio di Basi di Dati:  *Progetto "Market"*

**Gruppo di lavoro**:

| Matricola | Nome | Cognome | Contributo al progetto |
|:---------:|:----:|:-------:|:----------------------:|
|    285246 | Antonio     | sabatini        |      40%               |
|     285714      |    Mario  |      Ranalli   |      30%       |
|     265332     |    Marco  |      Nicolella   |        30%             |

**Data di consegna del progetto**: gg/mm/aaaa

## Analisi dei requisiti

- E' possibile riportare in questa sezione i **requisiti **copiati dal documento di specifica, oppure semplicemente riassumerne gli aspetti più importanti.
  Vanno quindi (eventualmente) discusse tutte le scelte progettuali relative al dominio, le ambiguità e il modo in cui sono state risolte.
  
- Definizione della richiesta di acquisto. L’ordinante dovrà selezionare una categoria (ad esempio PC Desktop, Notebook, Scrivania,...) che identifichi la tipologia di prodotto da acquistare tra quelle note al sistema (opzionalmente le categorie potranno avere una struttura ad albero, ad esempio Informatica > Computer > Notebook). Ogni categoria di prodotto avrà associate una serie di caratteristiche specifiche (ad esempio quantità di RAM e tipo di CPU per un PC, ecc.), sempre definite nel sistema ed eventualmente aggiornabili. L'ordinante, per completare la propria richiesta di acquisito, dovrà quindi inserire i valori di tutte le caratteristiche desiderate relative alla categoria di prodotto selezionata (per ogni caratteristica sarà comunque sempre prevista l'opzione indifferente). Sarà presente anche uno spazio note per aggiungere ogni caratteristica peculiare non annoverata tra quelle standard.

- Ricerca del prodotto da parte del personale tecnico. Un membro del personale sarà associato alla richiesta di acquisto definita al punto 1, diventandone il tecnico incaricato. Il tecnico incaricato potrà visionare la categoria e le caratteristiche richieste dall'ordinante, associerà, poi, un "prodotto candidato" alla richiesta d'acquisto.
  
- Revisione del prodotto candidato. L'ordinante prenderà visione del prodotto candidato e potrà approvarlo o respingerlo, fornendo in questo caso una motivazione. In caso di richiesta respinta, il processo riprenderà dal passo 2, considerando che il tecnico incaricato sarà sempre lo stesso. La motivazione del rifiuto sarà mostrata assieme alle informazioni della richiesta, e il tecnico incaricato potrà modificare il prodotto candidato e inoltrarlo nuovamente all'ordinante.

- Esecuzione dell'ordine. Nel caso in cui l'ordinante approvi la scelta del prodotto candidato  il personale tecnico procederà all'acquisto.

- Consegna e verifica del prodotto. Quando il prodotto sarà consegnato l'ordinante chiuderà la relativa richiesta di acquisto indicando se il prodotto ricevuto è stato accettato o respinto (perchè non conforme o non funzionante).

GLOSSARIO

Utente


- Entità che astrae il concetto di utente e associa ad ogni utnte (Tecnico, Compratore, Amministratore) oltre a Nome, Cognome ecc.. anche un ID_Utente, che è chiave primaria di quest'entità.




Amministratore


- E' l'unica entità che ha la proprietà di registrare alri utenti "ricorsivamente". Acquisisce gli attributi dell'entità utente.




Tecnico Incaricato


Sinonimi: Tecnico, Responsabile Tecnico
- Il membro del personale tecnico responsabile della ricerca e selezione del prodotto.
Attraverso "Tecnico" riusciamo a gestire la ricerca e la selezione del prodotto candidato che soddisfa le specifiche della richiesta di acquisto. Questo tecnico visualizza le richieste, seleziona i prodotti appropriati, e interagisce con l'ordinante durante il processo di approvazione del prodotto attraverso la richiesta d'acquisto.





Compratore


Sinonimi: Richiedente
- La persona che richiede l'acquisto di un prodotto.
L' "Ordinante" è l'utente che ha la necessità di un prodotto e formula unala Richiesta di Acquisto. L'ordinante attraverso la richiesta di acquisto puo' fornire le specifiche dettagliate e approvare o respingere il prodotto.





Richiesta di Acquisto


Sinonimi: Ordine di Acquisto, Ordine
- Richiesta formale per acquistare un prodotto o un insieme di prodotti.
Una volta che il tecnico incaricato prende in carico la richiesta, quest'entità ci permette di selezionare la categoria del prodotto da acquistare. 






Prodotto Candidato


Sinonimi: Proposta di Prodotto, Prodotto Selezionato
- Il prodotto selezionato dal tecnico incaricato che risponde alle caratteristiche richieste.
Quest'entità descrive il prodotto scelto dal tecnico incaricato che meglio corrisponde alle caratteristiche richieste dall'ordinante.Questo prodotto viene presentato all'ordinante per l'approvazione o il rifiuto. 





Categoria


Sinonimi: Classe di Prodotto
- La "Categoria di Prodotto" definisce il tipo di prodotto che il compratore desidera acquistare. Ha un attributo che funge da chiave primaria e può contenere tutte le sotto categorie. Inoltre, associa un valore univoco all'entità "Specifica".




Specifica


- Prodotto vero e proprio.
La "Specifica" rappresenta le caratteristiche dei prodotti. Attraverso la "Specifica" è possibile risalire al prodotto e alla quantità necessaria.



## Progettazione concettuale

![Diagramma ER](https://github.com/Shirotto/Base-di-Dati/assets/127602582/d0a40361-c8a9-4242-af0f-43292b388f70)



- Commentate gli elementi non visibili nella figura (ad esempio il contenuto degli attributi composti) nonché le scelte/assunzioni che vi hanno portato a creare determinate strutture, se lo ritenete opportuno.
- RICHIESTA D'ACQUISTO: Presumiamo che la richiesta d'acquisto possa contenere la richiesta di un singolo prodotto.
- PRODOTTO CANDIDATO: Il prodotto candidato per una richiesta d'acquisto sarà uno solo, ma riteniamo utile tenere conto di tutte le proposte rifiutate per quella richiesta d'acquisto. Per questo "prodottto candidato" tiene conto del fatto di essere stato rifiutato o meno. I prodotti rifiutati verranno registrati in una lista apposita e poi rimossi una volta chiusa la richiesta a cui sono associati.
- CATEGORIA: Le categorie presentano una struttura ad albero.


### Formalizzazione dei vincoli non esprimibili nel modello ER

- Elencate gli altri **vincoli** sui dati che avete individuato e che non possono essere espressi nel diagramma ER.
- VINCOLO DI ACCESSO E MODIFICA "RICHIESTA D'ACQUISTO"--> Il sistema prevede che un utente sia direttamente collegato ad una o più richieste d'acquisto, ma non tutti gli utenti ne hanno accesso allo stesso modo. Distinguiamo tre tipi di utente: tecnico, compratore e amministratore. Il "tecnico" avrà visione completa della "richiesta d'acquisto" ma potrà modificare solo il "prodotto candidato" presente in essa, aggiungendo un nuovo prodotto candidato o sostituendo quello vecchio in caso di necessità. Il "compratore", invece, avrà completo accesso alla r.a. e potra modificare i parametri a proprio piacimento in qualsiasi momento, non avrà ovviamente accesso al "prodotto candidato". Potrà, infine, chiudere la r.a. al termine del processo di acquisto o in qualsiasi momento lo desideri.


## Progettazione logica

### Ristrutturazione ed ottimizzazione del modello ER

- Riportate qui il modello **ER ristrutturato** ed eventualmente ottimizzato.
![Diagramma Er Ristrutturato](https://github.com/Shirotto/Base-di-Dati/assets/127602582/fd28f30e-de0a-4b7c-aebc-b0aea08d7c29)


- Discutete le scelte effettuate, ad esempio nell'eliminare una generalizzazione o nello scindere un'entità.
- RIMOZIONE GENERALIZZAZIONE UTENTE: Considerando che tutti gli utenti condividono gli stessi attributi, abbiamo deciso di consolidarli in un'unica entità per semplificare la gestione. Per distinguere i vari tipi di utenti all'interno di questa entità consolidata, abbiamo introdotto un nuovo attributo denominato "Tipo". Questo attributo ci permette di identificare e differenziare chiaramente i diversi tipi di utenti, garantendo al contempo una struttura dati più efficiente e organizzata.

### Traduzione del modello ER nel modello relazionale

- Riportate qui il **modello relazionale** finale, derivato dal modello ER ristrutturato della sezione precedente e che verrà implementato in SQL in quella successiva. 

- Nel modello evidenziate le chiavi primarie e le chiavi esterne.
![Modello relazionale](https://github.com/Shirotto/Base-di-Dati/assets/127602582/c9ec5a9e-f47c-4d89-948e-0454c9184de7)


## Progettazione fisica

### Implementazione del modello relazionale

- Inserite qui lo *script SQL* con cui **creare il database** il cui modello relazionale è stato illustrato nella sezione precedente. Ricordate di includere nel codice tutti
  i vincoli che possono essere espressi nel DDL. 

- Potete opzionalmente fornire anche uno script separato di popolamento (INSERT) del database su cui basare i test delle query descritte nella sezione successiva.

### Implementazione dei vincoli

- Nel caso abbiate individuato dei **vincoli ulteriori** che non sono esprimibili nel DDL, potrete usare questa sezione per discuterne l'implementazione effettiva, ad esempio riportando il codice di procedure o trigger, o dichiarando che dovranno essere implementati all'esterno del DBMS.

### Implementazione funzionalità richieste

- Riportate qui il **codice che implementa tutte le funzionalità richieste**, che si tratti di SQL o di pseudocodice o di entrambi. *Il codice di ciascuna funzionalità dovrà essere preceduto dal suo numero identificativo e dal testo della sua definizione*, come riportato nella specifica.

- Se necessario, riportate anche il codice delle procedure e/o viste di supporto.

#### BASE DI DATI

> Query di generazione tabelle

```sql
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
    stato_ordine_spedizione ENUM('ordine accettato','ordine rifutato','ordine in sospeso') NOT NULL DEFAULT 'ordine in sospeso'
);

CREATE TABLE richiesta_acquisto (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    ID_utente INTEGER UNSIGNED NOT NULL,
    ID_prodottoass INTEGER UNSIGNED NULL,
    totale FLOAT UNSIGNED DEFAULT 0,
    `data` DATETIME NOT NULL,
    spedito_il DATETIME DEFAULT NULL,
    note VARCHAR(500) DEFAULT '',
    tecnico_assegnato INTEGER UNSIGNED DEFAULT NULL,
    stato_richiesta ENUM('aperta', 'chiusa') NOT NULL DEFAULT 'aperta',
	approvazione_prodotto_candidato ENUM('approvato','rifiutato','in valutazione') DEFAULT NULL,
    CONSTRAINT tecnico_assegnato FOREIGN KEY (ID_utente)
        REFERENCES utente (ID)
        ON UPDATE CASCADE,
    CONSTRAINT utente_assegnato FOREIGN KEY (ID_utente)
        REFERENCES utente (ID)
        ON UPDATE CASCADE,
    CONSTRAINT prodotto_assegnato FOREIGN KEY (ID_prodottoass)
        REFERENCES prodotto_candidato (ID)
        ON UPDATE CASCADE
)AUTO_INCREMENT = 1000;

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
```

#### Funzionalità 1 RICHIESTA 1

> Creazione richiesta d'acquisto

```sql
DELIMITER //
CREATE PROCEDURE CreareRichiesta(
 IN id_utente INT, categoria_selezionata VARCHAR(100), note_cliente VARCHAR(500), specifica_selezionata VARCHAR(500), quantità_specifica INT
 )
BEGIN 

SELECT tipo INTO @tipoutente FROM utente WHERE ID = id_utente;

IF @tipoutente = 'utente' THEN 

-- Metodo per trovare ID della categoria 
SELECT ID INTO @id_categoria FROM categoria WHERE nome = categoria_selezionata;

SELECT 
    ID
INTO @id_specifica FROM
    specifica
WHERE
    nome = specifica_selezionata;

-- Metodo per inserire la rischiera con i valori
INSERT INTO richiesta_acquisto (ID_utente, `data`,note)
VALUES (id_utente, NOW(),note_cliente);

-- Metodo per trovare ID della richista d'acquisto
SET @ID_richiesta = LAST_INSERT_ID();

-- Metodo per associare l' ID della richiesta all' ID della categoria
INSERT INTO seleziona (ID_richiesta_acquisto, ID_categoria)
VALUES (@ID_richiesta, @id_categoria);


INSERT INTO associa (ID_categoria, ID_specifica,ID_richiesta_acquisto,quantità)
VALUES (@id_categoria, @id_specifica,@ID_richiesta,quantità_specifica);

 SELECT 
    a.ID_richiesta_acquisto AS Richiesta_ID,
    c.nome AS Categoria,
    s.nome AS Specifica,
    a.quantità AS Quantità
FROM
    associa a
        JOIN
    categoria c ON a.ID_categoria = c.ID
        JOIN
    specifica s ON a.ID_specifica = s.ID
WHERE
    a.ID_richiesta_acquisto = @ID_richiesta;

 END IF;


 END //
        DELIMITER ;
```

#### Funzionalità 2 RICHIESTA 2

> assegna tecnico

```sql
create view Tecnici as    
select ID, num_richieste_associate
from utente
where tipo = 'tecnico';


delimiter \\

CREATE PROCEDURE assegna_ra(IN ra_ID INTEGER)


begin

DECLARE tecnico INTEGER;

SELECT 
    ID
INTO tecnico FROM
    Tecnici
GROUP BY Tecnici.ID
ORDER BY Tecnici.num_richieste_associate ASC
LIMIT 1;


UPDATE richiesta_acquisto 
SET 
    tecnico_assegnato = tecnico
WHERE
    richiesta_acquisto.ID = ra_ID;
UPDATE utente 
SET 
    num_richieste_associate = num_richieste_associate + 1
WHERE
    utente.ID = tecnico;
end \\

delimiter ;

CALL assegna_RA (1000);
SELECT * FROM richiesta_acquisto;

```

#### Funzionalità 3 EXTRA

> inserisci prodotto

```sql
-- Procedura usata dall tecnico per inserire il prodotto trovato nel sistema
DELIMITER //
CREATE PROCEDURE CercaProdotto(
IN nome_prodotto VARCHAR(100),
IN nome_produttore VARCHAR(100), 
IN codice_prodotto INT, 
IN url_prodotto VARCHAR(100),
IN note VARCHAR(100),
IN prezzo INT
)
BEGIN 

INSERT INTO prodotto_candidato(nome_prodotto,nome_produttore,codice_prodotto,URL_info,note,prezzo) VALUES (nome_prodotto,nome_produttore,codice_prodotto,url_prodotto,note,prezzo);

END //
DELIMITER ;

CALL CercaProdotto('asis notebook','asis company',1,'www.asis','tastiera colorata',1080);
CALL CercaProdotto('applo notebook','applo company',2,'www.indirizzo','telecamera',2000);
CALL CercaProdotto('pera phone','pera inc',3,'www.pera','dedica',750);
SELECT * FROM prodotto_candidato;
```

#### Funzionalità 4 EXTRA

> proponi prodotto

```sql
DELIMITER //
CREATE PROCEDURE ProponiProdotto(
    IN id_richiesta INT,
    IN id_prodotto INT
)
BEGIN    
UPDATE richiesta_acquisto SET approvazione_prodotto_candidato = 'in valutazione' WHERE ID = id_richiesta;
 -- Aggiunge alla richiesta d'acquisto il prodotto candidato
UPDATE richiesta_acquisto SET ID_prodottoass = id_prodotto WHERE ID = id_richiesta;

-- Aggiunge alla richiesta d'acquisto il prezzo del prodotto candidato
SELECT prezzo INTO @prezzo FROM prodotto_candidato WHERE ID = id_prodotto;
UPDATE richiesta_acquisto SET totale = @prezzo WHERE ID = id_richiesta;

-- Aggiorna lo stato delle proposte di acquisto
INSERT INTO propone (ID_richiesta_acquisto, ID_prodotto_candidato)
VALUES (id_richiesta, id_prodotto);
    
END //

DELIMITER ;
CALL ProponiProdotto( 1000 , 2);
CALL ProponiProdotto( 1001 , 2);
select * FROM richiesta_acquisto;
SELECT * FROM prodotto_candidato;
SELECT * FROM propone;
SELECT * FROM associa;
```
#### Funzionalità 5 RICHIESTA 3

> approva prodotto

```sql
DELIMITER // 

CREATE PROCEDURE ApprovaProdottoCandidato(
   IN richiestaID INT
)
BEGIN
    
    UPDATE richiesta_acquisto SET approvazione_prodotto_candidato = 'approvato' WHERE richiesta_acquisto.ID = richiestaID;

END //

DELIMITER ;
CALL ApprovaProdottoCandidato(1000);
SELECT * FROM prodotto_candidato;
SELECT * FROM richiesta_acquisto;
```

#### Funzionalità 6 EXTRA

> spedisci prodotto

```sql
DELIMITER // 

CREATE PROCEDURE SpedisciProdotto(
   IN richiestaID INT
)
BEGIN
    
    UPDATE propone SET stato = 'ordinato' WHERE ID_richiesta_acquisto = richiestaID;
    UPDATE richiesta_acquisto SET spedito_il = NOW() WHERE ID = richiestaID;

END //

DELIMITER ;
CALL SpedisciProdotto(1000);
SELECT * FROM propone;
SELECT * FROM richiesta_acquisto;
```

#### Funzionalità 7 EXTRA

> rifiuta prodotto

```sql
DELIMITER //

CREATE PROCEDURE ProdottoRifiutato (
    IN ID_richiesta INTEGER,IN note VARCHAR(500)
)
BEGIN

UPDATE richiesta_acquisto SET approvazione_prodotto_candidato = 'rifiutato' WHERE ID = ID_richiesta;
UPDATE richiesta_acquisto SET note = note WHERE ID = ID_richiesta;


END //

DELIMITER ;

CALL ProdottoRifiutato(1000,'ho rifiutato perche la tastiera è brutta');
SELECT * FROM richiesta_acquisto;
```

#### Funzionalità 8 RICHIESTA 4

> elimina richiesta d'acquisto

```sql
SET SQL_SAFE_UPDATES = 0;

-- Procedura usate per eliminare la richiesta d'acquisto nella sua tabella e anche nelle tabelle in cui appare
DELIMITER //
CREATE PROCEDURE EliminaRichiestaAcquisto(
IN id_richiesta INT
)
BEGIN 

DELETE FROM propone WHERE ID_richiesta_acquisto = id_richiesta;

DELETE FROM seleziona WHERE ID_richiesta_acquisto = id_richiesta;

DELETE FROM associa WHERE ID_richiesta_acquisto = id_richiesta;

DELETE FROM richiesta_acquisto WHERE ID = id_richiesta;

SELECT 'Richiesta eliminata' AS risultato;

END //
DELIMITER ;
        
CALL EliminaRichiestaAcquisto(1);


SELECT * FROM richiesta_acquisto;
SELECT * FROM propone;
SELECT * FROM seleziona;
SELECT * FROM associa;


SET SQL_SAFE_UPDATES = 1;
```

#### Funzionalità 9 RICHIESTA 7

> lista richieste acquisto approvate ma non ancora spedite associate ad un tecnico

```sql
DELIMITER //
CREATE PROCEDURE RichiestaAcquistoNonSpedito(
IN id_tecnico INT
)
BEGIN 

SELECT 
ra.ID AS ID_richiesta,
ra.ID_utente,
ra.ID_prodottoass,
ra.tecnico_assegnato,
ra.`data`,
ra.note,
ra.stato_richiesta,
pc.nome_prodotto,
pc.codice_prodotto,
ra.approvazione_prodotto_candidato,
pc.stato_ordine_spedizione

 FROM 
        richiesta_acquisto ra
        JOIN propone p ON ra.ID = p.ID_richiesta_acquisto
        JOIN prodotto_candidato pc ON p.ID_prodotto_candidato = pc.ID
    WHERE 
        ra.tecnico_assegnato = id_tecnico
        AND ra.approvazione_prodotto_candidato = 'approvato'
        AND pc.stato_ordine_spedizione = 'ordine in sospeso';


END //
DELIMITER ;

CALL RichiestaAcquistoNonSpedito(2);
```
#### Funzionalità 10 RICHIESTA 8

> dettagli richiesta

```sql
DELIMITER //

CREATE PROCEDURE DettagliRichiestaAcquisto (
    IN p_ID_richiesta INTEGER
)
BEGIN
    SELECT 
        ra.ID AS ID_richiesta,
        ra.ID_utente,
        u.nome AS nome_utente,
        u.cognome AS cognome_utente,
        ra.ID_prodottoass,
        pc.nome_prodotto,
        pc.nome_produttore,
        pc.codice_prodotto,
        pc.URL_info,
        pc.note AS note_prodotto,
        pc.prezzo,
        ra.approvazione_prodotto_candidato,
        pc.stato_ordine_spedizione,
        ra.totale,
        ra.`data`,
        ra.note AS note_richiesta,
        ra.tecnico_assegnato,
        ra.stato_richiesta,
        p.stato
    FROM richiesta_acquisto ra
    LEFT JOIN utente u ON ra.ID_utente = u.ID
    LEFT JOIN prodotto_candidato pc ON ra.ID_prodottoass = pc.ID
    LEFT JOIN propone p ON ra.ID = p.ID_richiesta_acquisto
    WHERE ra.ID = p_ID_richiesta ;
END //

DELIMITER ;

call DettagliRichiestaAcquisto(1000);
```
#### Funzionalità 11 RICHIESTA 10

> calcolo somma totale della spesa effettuata da un ordinante in un anno solare

```sql
DELIMITER //
CREATE PROCEDURE CalcoloSommaOrdinante(
IN id_utente INT
)
BEGIN 

SELECT 
u.ID,
u.nome,
u.cognome,
SUM(ra.totale) AS totale_richieste
 FROM 
        richiesta_acquisto ra
    JOIN utente u ON ra.ID_utente = u.ID
    JOIN propone p ON ra.ID = p.ID_richiesta_acquisto
    JOIN prodotto_candidato pc ON p.ID_prodotto_candidato = pc.ID
    WHERE 
        ra.ID_utente = id_utente
        AND ra.stato_richiesta = 'chiusa'
        AND p.stato = 'ordinato'
        AND pc.stato_ordine_spedizione = 'ordine accettato'
        AND pc.approvazione_prodotto_candidato = 'approvato'
         AND ra.data >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
        
        GROUP BY
    u.ID, u.nome, u.cognome;


END //
DELIMITER ;

CALL CalcoloSommaOrdinante(1);
```
#### Funzionalità 12 RICHIESTA 6

> lista richieste d'acquisto non ancora associate ad un tecnico

```sql
-- Estrazione lista richiesta acquisto non ancora ssegate ad un tecnico
DELIMITER //

CREATE PROCEDURE RichiesteAqNonAss( 

)

BEGIN

SELECT  u.nome, u.cognome, ra.ID, ra.ID_utente, ra.ID_prodottoass, ra.totale, ra.`data`,ra.note, ra.tecnico_assegnato, ra.stato_richiesta
FROM richiesta_acquisto ra
JOIN utente u ON ra.ID_utente = u.ID
WHERE ra.tecnico_assegnato IS NULL;

END //

DELIMITER ;

CALL RichiesteAqNonAss();
```
#### Funzionalità 13 RICHIESTA 9

> conteggio richieste d'acquisto gestite globalmente da un tecnico

```sql
-- Conteggio richieste acquisto gestite globalmente da un determinato tecnico
DELIMITER //

CREATE PROCEDURE NRGTecnico(

IN tecnicoID INTEGER 

)

BEGIN

SELECT u.nome, u.cognome,

COUNT(ra.ID) AS Numero_Richieste

FROM richiesta_acquisto ra
JOIN utente u ON ra.tecnico_assegnato = u.ID
WHERE ra.tecnico_assegnato = tecnicoID

GROUP BY u.nome, u.cognome;


END //



DELIMITER ;
CALL NRGTecnico(2);
```
#### Funzionalità 14 RICHIESTA 5

> richieste di un ordinante in sospeso

```sql
DELIMITER //

CREATE PROCEDURE RANC_Ordinante (IN ID_Ordinante INTEGER UNSIGNED)
BEGIN
    SELECT * FROM richiesta_acquisto WHERE richiesta_acquisto.ID_utente = ID_Ordinante
      AND stato_richiesta = 'aperta'
      AND approvazione_prodotto_candidato = 'in valutazione';
END //

DELIMITER ;


CALL RANC_Ordinante(6);
```
#### Funzionalità 15 RICHIESTA 11

> calcolo tempo medio evasione ordine

```sql
DELIMITER //

CREATE PROCEDURE CalcolaTempoMedioEvasione()
BEGIN
    SELECT AVG(TIMESTAMPDIFF(SECOND, `data`, spedito_il)) AS tempo_medio_evasione_sec
    FROM richiesta_acquisto
    WHERE spedito_il IS NOT NULL;
END //

DELIMITER ;

call CalcolaTempoMedioEvasione();



select * FROM richiesta_acquisto;
```


