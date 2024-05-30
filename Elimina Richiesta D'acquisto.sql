DELIMITER //
CREATE PROCEDURE EliminaRichiestaAcquisto(
IN id_richiesta INT
)
BEGIN 


DELETE FROM propone WHERE ID_richiesta_acquisto = id_richiesta;


DELETE FROM seleziona WHERE ID_richiesta_acquisto = id_richiesta;


DELETE FROM richiesta_acquisto WHERE ID = id_richiesta;

SELECT 'Richiesta eliminata' AS risultato;

END //
DELIMITER ;
        
CALL EliminaRichiestaAcquisto(1);
