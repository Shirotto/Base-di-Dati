DELIMITER //

CREATE PROCEDURE ProdottoRifiutato (
    IN ID_richiesta INTEGER,IN note VARCHAR(500)
)
BEGIN

UPDATE richiesta_acquisto SET approvazione_prodotto_candidato = 'rifiutato' WHERE ID = ID_richiesta;
UPDATE richiesta_acquisto SET note = note WHERE ID = ID_richiesta;


END //

DELIMITER ;

CALL ProdottoRifiutato(1000,'ho rifiutato perche la tastiera è brutta');
SELECT * FROM richiesta_acquisto;
