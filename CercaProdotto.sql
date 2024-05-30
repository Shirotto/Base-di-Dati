-- Procedura usata dal tecnico per inserire il prodotto trovato nel sistema
DELIMITER //
CREATE PROCEDURE CercaProdotto(
IN nome_prodotto VARCHAR(100),
IN nome_produttore VARCHAR(100), 
IN codice_prodotto INT, 
IN url_prodotto VARCHAR(100),
IN prezzo INT,
IN approvazione BOOLEAN)
BEGIN 

INSERT INTO prodotto_candidato(nome_prodotto,nome_produttore,codice_prodotto,URL_info,prezzo,approvazione) VALUES (nome_prodotto,nome_produttore,codice_prodotto,url_prodotto,prezzo,approvazione);

END //
DELIMITER ;

CALL CercaProdotto('asis notebook','asis company',1,'www.asis',1080,FALSE);
CALL CercaProdotto('applo notebook','applo company',2,'www.indirizzo',2000,FALSE);
CALL CercaProdotto('pera phone','pera inc',3,'www.pera',750,FALSE);
SELECT * FROM prodotto_candidato;
