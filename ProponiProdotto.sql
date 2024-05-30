DELIMITER //
CREATE PROCEDURE ProponiProdotto(
    IN id_richiesta INT,
    IN id_prodotto INT
)
BEGIN  

UPDATE richiesta_acquisto 
SET 
    ID_prodottoass = id_prodotto
WHERE
    ID = id_richiesta;

INSERT INTO propone (stato, ID_richiesta_acquisto, ID_prodotto_candidato)
VALUES ('In attesa', id_richiesta, id_prodotto);

    
END //

DELIMITER ;
