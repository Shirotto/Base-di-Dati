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
