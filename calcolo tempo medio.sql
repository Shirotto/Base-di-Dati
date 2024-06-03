DELIMITER //

CREATE PROCEDURE CalcolaTempoMedioEvasione()
BEGIN
    SELECT AVG(TIMESTAMPDIFF(SECOND, `data`, spedito_il)) AS tempo_medio_evasione_sec
    FROM richiesta_acquisto
    WHERE spedito_il IS NOT NULL;
END //

DELIMITER ;

call CalcolaTempoMedioEvasione();



select * FROM richiesta_acquisto;
