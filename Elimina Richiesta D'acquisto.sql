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
