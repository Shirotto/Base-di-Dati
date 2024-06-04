DELIMITER // 

CREATE PROCEDURE SpedisciProdotto(
   IN richiestaID INT
)
BEGIN
    
    UPDATE propone SET stato = 'ordinato' WHERE ID_richiesta_acquisto = richiestaID;
    UPDATE richiesta_acquisto SET spedito_il = NOW() WHERE ID = richiestaID;

END //

DELIMITER ;
CALL SpedisciProdotto(1000);
SELECT * FROM propone;
SELECT * FROM richiesta_acquisto;
