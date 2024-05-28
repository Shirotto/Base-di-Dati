-- Trova l'ID dell'utente "Mario Ranalli"
SELECT ID INTO @id_utente FROM utente WHERE nome = 'Paolo' AND cognome = 'Cannone';

-- Trova l'ID della categoria "PERSONAL COMPUTER"
SELECT ID INTO @id_categoria FROM categoria WHERE nome = 'PERSONAL COMPUTER';

-- Inserisce una nuova richiesta d'acquisto
INSERT INTO richiesta_acquisto (ID_utente, totale, `data`, numero_richiesta)
VALUES (@id_utente, 250.00, NOW(), 1);

-- Trova l'ID della nuova richiesta d'acquisto
SELECT ID INTO @id_richiesta_acquisto FROM richiesta_acquisto WHERE numero_richiesta = 1;

-- Associa la categoria "PERSONAL COMPUTER" alla richiesta d'acquisto
INSERT INTO seleziona (ID_richiesta_acquisto, ID_categoria)
VALUES (@id_richiesta_acquisto, @id_categoria);


-- Inserisce un prodotto candidato associato alla richiesta di acquisto
INSERT INTO prodotto_candidato (nome_prodotto, nome_produttore, ID_richiesta_acquisto, codice_prodotto, URL_info, note, prezzo, approvazione)
VALUES ('Laptop', 'Produttore', @id_richiesta_acquisto, 12345, 'link', 'Note', 100.50, FALSE);

-- Trova l'ID del prodotto candidato appena inserito
SELECT ID INTO @id_prodotto FROM prodotto_candidato WHERE codice_prodotto = 12345;

-- Aggiorna lo stato delle proposte di acquisto
INSERT INTO propone (stato, ID_richiesta_acquisto, ID_prodotto_candidato)
VALUES ('In attesa', @id_richiesta_acquisto, @id_prodotto);

SELECT * FROM richiesta_acquisto WHERE numero_richiesta = 1;
SELECT * FROM seleziona WHERE ID_richiesta_acquisto = @id_richiesta_acquisto;
SELECT * FROM prodotto_candidato WHERE ID = @id_prodotto;
SELECT * FROM propone WHERE ID_richiesta_acquisto = @id_richiesta_acquisto AND ID_prodotto_candidato = @id_prodotto;
       
       
