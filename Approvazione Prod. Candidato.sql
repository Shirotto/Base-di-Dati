DELIMITER //

CREATE PROCEDURE ApprovaProdottoCandidato(
    IN p_ID_richiesta_acquisto INT,
    IN p_ID_prodotto_candidato INT
)
BEGIN
    DECLARE v_count INT;

    -- Verifica se la combinazione di ID richiesta e ID prodotto candidato esiste
    SELECT COUNT(*) INTO v_count
    FROM prodotto_candidato
    WHERE ID = p_ID_prodotto_candidato AND ID_richiesta_acquisto = p_ID_richiesta_acquisto;

    -- se non esiste una combinazione allora genera un'eccezine personalizzata
    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La combinazione di richiesta d\'acquisto e prodotto candidato non esiste.;
    ELSE
        
        -- Aggiorna lo stato di approvazione del prodotto candidato
        UPDATE prodotto_candidato
        SET approvazione = TRUE
        WHERE ID = p_ID_prodotto_candidato AND ID_richiesta_acquisto = p_ID_richiesta_acquisto;
    END IF;
END //


DELIMITER ;
