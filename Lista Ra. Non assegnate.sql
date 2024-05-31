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
