DELIMITER //
-- Creo una procedura che elimina la richiesta d'acquisto data in input
CREATE PROCEDURE EliminaRichiestaAcquisto(
IN richiesta_id INT
)
BEGIN 

-- Rimuove le informazione della richiesta selezionata dalla tabella propone
DELETE FROM propone WHERE ID_richiesta_acquisto = richiesta_id;

-- Rimuove le informazione della richiesta selezionata dalla tabella seleziona
DELETE FROM seleziona WHERE ID_richiesta_acquisto = richiesta_id;

-- Rimuove i prodotti candidati associati alla richiesta d'acquisto
DELETE FROM prodotto_candidato WHERE ID_richiesta_acquisto = richiesta_id;

-- Rimuove la richiesta d'acquisto dalla tabella "richiesta_acquisto"
DELETE FROM richiesta_acquisto WHERE ID = richiesta_id;

SELECT 'Richiesta eliminata' AS risultato;
        END //
        DELIMITER ;
