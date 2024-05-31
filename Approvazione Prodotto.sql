DELIMITER // 

CREATE PROCEDURE ApprovaProdottoCandidato(
   IN richiestaID INT,
   IN prodottoID INT
)
BEGIN
    DECLARE prod_ass INT;

    -- Verifica se la combinazione di ID richiesta e ID prodotto candidato esiste
SELECT 
    COUNT(*)
INTO prod_ass FROM
    propone
WHERE
    ID_richiesta_acquisto = richiestaID
        AND ID_prodotto_candidato = prodottoID;

   /* IF prod_ass = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La combinazione di richiesta d\'acquisto e prodotto candidato non esiste.';
    ELSE*/
UPDATE prodotto_candidato 
SET 
    approvazione_prodotto_candidato = 'approvato'
WHERE
    ID = prodottoID; 

END IF;
END //

DELIMITER ;
CALL ApprovaProdottoCandidato(1,2);
SELECT * FROM prodotto_candidato;
