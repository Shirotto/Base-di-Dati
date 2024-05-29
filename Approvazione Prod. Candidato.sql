DELIMITER //

CREATE PROCEDURE ApprovaProdottoCandidato(
    IN AP_ID_richiesta_acquisto INT,
    IN AP_ID_prodotto_candidato INT
)
BEGIN
    DECLARE ver_count INT;

    -- Verifica se la combinazione di ID richiesta e ID prodotto candidato esiste
    SELECT COUNT(*) INTO ver_count
    FROM prodotto_candidato
    WHERE ID = AP_ID_prodotto_candidato AND ID_richiesta_acquisto = AP_ID_richiesta_acquisto;

    -- se non esiste una combinazione allora genera un'eccezine personalizzata
    IF ver_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La combinazione di richiesta d\'acquisto e prodotto candidato non esiste.;
    ELSE
        
        -- Aggiorna lo stato di approvazione del prodotto candidato
        UPDATE prodotto_candidato
        SET approvazione = TRUE
        WHERE ID = AP_ID_prodotto_candidato AND ID_richiesta_acquisto = AP_ID_richiesta_acquisto;
    END IF;
END //


DELIMITER ;
