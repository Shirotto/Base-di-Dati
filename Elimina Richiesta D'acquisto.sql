DELIMITER //
CREATE PROCEDURE EliminaRichiestaAcquisto(
IN id_richiesta INT
)
BEGIN 
-- Elimina la riga relativa all'id inserito nella tabella propone
DELETE FROM propone WHERE ID_richiesta_acquisto = id_richiesta;
-- Elimina la riga relativa all'id inserito nella tabella seleziona
DELETE FROM seleziona WHERE ID_richiesta_acquisto = id_richiesta;
-- Elimina la riga relativa all'id inserito nella tabella richista d'acquisto
DELETE FROM richiesta_acquisto WHERE ID = id_richiesta;

SELECT 'Richiesta eliminata' AS risultato;

END //
DELIMITER ;
        
CALL EliminaRichiestaAcquisto(1);
