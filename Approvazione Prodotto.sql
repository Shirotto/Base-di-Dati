DELIMITER // 

CREATE PROCEDURE ApprovaProdottoCandidato(
   IN richiestaID INT
)
BEGIN
    
    UPDATE richiesta_acquisto SET approvazione_prodotto_candidato = 'approvato' WHERE richiesta_acquisto.ID = richiestaID;

END //

DELIMITER ;
CALL ApprovaProdottoCandidato(1000);
SELECT * FROM prodotto_candidato;
SELECT * FROM richiesta_acquisto;
