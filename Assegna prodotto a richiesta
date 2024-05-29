-- Inserire un prodotto candidato associato alla richiesta di acquisto
INSERT INTO prodotto_candidato (nome_prodotto, nome_produttore, ID_richiesta_acquisto, codice_prodotto, URL_info, note, prezzo, approvazione)
VALUES ('Laptop X', 'Produttore Y', id_richiesta_acquisto, 12345, 'link', 'Note', 100.50, FALSE);

-- Trovare l'ID del prodotto candidato appena inserito
SELECT ID INTO @id_prodotto FROM prodotto_candidato WHERE codice_prodotto = 12345;

-- Aggiornare lo stato delle proposte di acquisto
INSERT INTO propone (stato, ID_richiesta_acquisto, ID_prodotto_candidato)
VALUES ('In attesa', id_richiesta_acquisto, @id_prodotto);

-- Verifica i risultati
CALL CreareRichiesta( 7 , 'PERSONAL COMPUTER');
CALL CreareRichiesta( 6 , 'PERSONAL COMPUTER');
SELECT * FROM richiesta_acquisto;
SELECT * FROM seleziona WHERE ID_richiesta_acquisto = id_richiesta_acquisto;
SELECT * FROM prodotto_candidato WHERE ID = @id_prodotto;
SELECT * FROM propone WHERE ID_richiesta_acquisto = id_richiesta_acquisto AND ID_prodotto_candidato = @id_prodotto;
