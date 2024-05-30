DELIMITER //
CREATE PROCEDURE CreareRichiesta(
 IN id_utente INT, categoria_selezionata VARCHAR(100)
 )
BEGIN 
-- Variabili usate per tener conto del numero delle richieste di acquisto da utilizzare localmente per il funzionamento di metodi nella procedura
DECLARE max_numero_richiesta INT;
DECLARE id_richiesta_acquisto INT;

-- Metodo per trovare il massimo numero delle richieste d'acquisto e lo incementa di 1
SELECT 
    IFNULL(MAX(ID), 0) + 1
INTO max_numero_richiesta FROM
    richiesta_acquisto;

-- Metodo per trovare ID della categoria 
SELECT 
    ID
INTO @id_categoria FROM
    categoria
WHERE
    nome = categoria_selezionata;

-- Metodo per inserire la rischiera con i valori
INSERT INTO richiesta_acquisto (ID_utente, totale, `data`)
VALUES (id_utente, 250.00, NOW());

-- Metodo per trovare ID della richista d'acquisto
SELECT 
    ID
INTO id_richiesta_acquisto FROM
    richiesta_acquisto
WHERE
    ID = max_numero_richiesta;

-- Metodo per associare l' ID della richiesta all' ID della categoria
INSERT INTO seleziona (ID_richiesta_acquisto, ID_categoria)
VALUES (id_richiesta_acquisto, @id_categoria);

 END //
        DELIMITER ;
        
CALL CreareRichiesta( 3 , 'PERSONAL COMPUTER');
CALL CreareRichiesta( 1 , 'PERSONAL COMPUTER');
select * FROM richiesta_acquisto;
        
CALL CreareRichiesta( 3 , 'PERSONAL COMPUTER');
CALL CreareRichiesta( 1 , 'PERSONAL COMPUTER');
select * FROM richiesta_acquisto;
