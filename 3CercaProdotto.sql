-- Procedura usata dall tecnico per inserire il prodotto trovato nel sistema
DELIMITER //
CREATE PROCEDURE CercaProdotto(
IN nome_prodotto VARCHAR(100),
IN nome_produttore VARCHAR(100), 
IN codice_prodotto INT, 
IN url_prodotto VARCHAR(100),
IN note VARCHAR(100),
IN prezzo INT
)
BEGIN 

INSERT INTO prodotto_candidato(nome_prodotto,nome_produttore,codice_prodotto,URL_info,note,prezzo) VALUES (nome_prodotto,nome_produttore,codice_prodotto,url_prodotto,note,prezzo);

END //
DELIMITER ;

CALL CercaProdotto('asis notebook','asis company',1,'www.asis','tastiera colorata',1080);
CALL CercaProdotto('applo notebook','applo company',2,'www.indirizzo','telecamera',2000);
CALL CercaProdotto('pera phone','pera inc',3,'www.pera','dedica',750);
SELECT * FROM prodotto_candidato;
