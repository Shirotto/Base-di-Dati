DELIMITER //
CREATE PROCEDURE CreareRichiesta(
 IN id_utente INT, categoria_selezionata VARCHAR(100), note_cliente VARCHAR(500), specifica_selezionata VARCHAR(500), quantità_specifica INT
 )
BEGIN 

SELECT tipo INTO @tipoutente FROM utente WHERE ID = id_utente;

IF @tipoutente = 'utente' THEN 

-- Metodo per trovare ID della categoria 
SELECT ID INTO @id_categoria FROM categoria WHERE nome = categoria_selezionata;

SELECT ID INTO @id_specifica FROM specifica WHERE nome = specifica_selezionata;

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
        
CALL CreareRichiesta( 10 , 'PERSONAL COMPUTER','','RAM',16);
CALL CreareRichiesta( 5 , 'PERSONAL COMPUTER','','MEMORIA',32);
CALL CreareRichiesta( 6 , 'COMPUTER FISSI','no','HERTZ',60);
SELECT * FROM richiesta_acquisto;
SELECT * FROM categoria;
SELECT * FROM seleziona;
SELECT * FROM associa;
