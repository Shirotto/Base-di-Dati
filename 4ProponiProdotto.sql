DELIMITER //
CREATE PROCEDURE ProponiProdotto(
    IN id_richiesta INT,
    IN id_prodotto INT
)
BEGIN    
UPDATE richiesta_acquisto SET approvazione_prodotto_candidato = 'in valutazione' WHERE ID = id_richiesta;
 -- Aggiunge alla richiesta d'acquisto il prodotto candidato
UPDATE richiesta_acquisto SET ID_prodottoass = id_prodotto WHERE ID = id_richiesta;

-- Aggiunge alla richiesta d'acquisto il prezzo del prodotto candidato
SELECT prezzo INTO @prezzo FROM prodotto_candidato WHERE ID = id_prodotto;
UPDATE richiesta_acquisto SET totale = @prezzo WHERE ID = id_richiesta;

-- Aggiorna lo stato delle proposte di acquisto
INSERT INTO propone (ID_richiesta_acquisto, ID_prodotto_candidato)
VALUES (id_richiesta, id_prodotto);
    
END //

DELIMITER ;
CALL ProponiProdotto( 1000 , 2);
CALL ProponiProdotto( 1001 , 2);
select * FROM richiesta_acquisto;
SELECT * FROM prodotto_candidato;
SELECT * FROM propone;
SELECT * FROM associa;
