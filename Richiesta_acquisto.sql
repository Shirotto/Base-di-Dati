DELIMITER //
CREATE PROCEDURE CreareRichiesta(
 IN id_utente INT, categoria_selezionata VARCHAR(100)
 )
BEGIN 
-- Variabile per tener conto del numero di richieste
DECLARE max_numero_richiesta INT;
DECLARE id_richiesta_acquisto INT;

-- Trova il massimo numero di richieste e lo incrementa di 1
SELECT 
    IFNULL(MAX(numero_richiesta), 0) + 1
INTO max_numero_richiesta FROM
    richiesta_acquisto;

-- Trova l'ID della categoria "PERSONAL COMPUTER"
SELECT 
    ID
INTO @id_categoria FROM
    categoria
WHERE
    nome = categoria_selezionata;

-- Inserisci una nuova richiesta d'acquisto
INSERT INTO richiesta_acquisto (ID_utente, totale, `data`, numero_richiesta)
VALUES (id_utente, 250.00, NOW(), max_numero_richiesta);

-- Trova l'ID della nuova richiesta d'acquisto
SELECT 
    ID
INTO id_richiesta_acquisto FROM
    richiesta_acquisto
WHERE
    numero_richiesta = max_numero_richiesta;

-- Associa la categoria "PERSONAL COMPUTER" alla richiesta d'acquisto
INSERT INTO seleziona (ID_richiesta_acquisto, ID_categoria)
VALUES (id_richiesta_acquisto, @id_categoria);

-- Associa la categoria "PERSONAL COMPUTER" alla richiesta d'acquisto
INSERT INTO seleziona (ID_richiesta_acquisto, ID_categoria)
VALUES (id_richiesta_acquisto, @id_categoria);

 END //
        DELIMITER ;
