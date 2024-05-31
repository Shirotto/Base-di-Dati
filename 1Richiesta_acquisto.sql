DELIMITER //
CREATE PROCEDURE CreareRichiesta(
 IN id_utente INT, categoria_selezionata VARCHAR(100), note_cliente VARCHAR(500), specifica_selezionata VARCHAR(500), quantità_specifica INT
 )
BEGIN 
-- Metodo per trovare ID della categoria 
SELECT ID INTO @id_categoria FROM categoria WHERE nome = categoria_selezionata;

SELECT ID INTO @id_specifica FROM specifica WHERE nome = specifica_selezionata;

-- Metodo per inserire la rischiera con i valori
INSERT INTO richiesta_acquisto (ID_utente, `data`)
VALUES (id_utente, NOW());

-- Metodo per trovare ID della richista d'acquisto
SET @ID_richiesta = LAST_INSERT_ID();

--
IF note_cliente IS NULL AND note_cliente = '' THEN
UPDATE richiesta_acquisto SET note = NULL WHERE ID = @ID_richiesta;
ELSE
UPDATE richiesta_acquisto SET note = note_cliente WHERE ID = @ID_richiesta;
END IF;

-- Metodo per associare l' ID della richiesta all' ID della categoria
INSERT INTO seleziona (ID_richiesta_acquisto, ID_categoria)
VALUES (@ID_richiesta, @id_categoria);

INSERT INTO associa (ID_categoria, ID_specifica,ID_richiesta,quantità)
VALUES (@id_categoria, @id_specifica,@ID_richiesta,quantità_specifica);


 END //
        DELIMITER ;
        
CALL CreareRichiesta( 3 , 'PERSONAL COMPUTER','','RAM',16);
CALL CreareRichiesta( 1 , 'PERSONAL COMPUTER','','MEMORIA',32);
CALL CreareRichiesta( 2 , 'COMPUTER FISSI','no','HERTZ',60);
SELECT * FROM richiesta_acquisto;
SELECT * FROM categoria;
SELECT * FROM seleziona;
SELECT * FROM associa;
