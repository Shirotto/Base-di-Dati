-- Inserire Richiesta D'acquisto
INSERT IGNORE INTO richiesta_acquisto ( totale, `data`, numero_richiesta)
 VALUES (250, now(), 1);
-- Inserire Categoria
INSERT IGNORE INTO categoria (nome)
VALUES ('Elettronica');
-- Inserire Specifica 
INSERT INTO specifica (nome, quantità)
VALUES ('RAM', 16),
       ('Storage', 512);
-- Trovare l'ID della categoria 'Elettronica'
SELECT ID INTO @id_categoria FROM categoria WHERE nome = 'Elettronica';

-- Trovare gli ID delle specifiche
SELECT ID INTO @id_specifica1 FROM specifica WHERE nome = 'RAM';
SELECT ID INTO @id_specifica2 FROM specifica WHERE nome = 'Storage';

-- Trovare valore nella specifica
SELECT quantità INTO @valore1 FROM specifica WHERE quantità = 16;
SELECT quantità INTO @valore2 FROM specifica WHERE quantità = 512;

-- Associare le specifiche alla categoria
INSERT INTO associa (valore, ID_categoria, ID_specifica)
VALUES (@valore1, @id_categoria,@id_specifica1),
       (@valore2, @id_categoria,@id_specifica2);

-- Trovare l'ID della richiesta di acquisto
SELECT ID INTO @id_richiesta FROM richiesta_acquisto WHERE numero_richiesta = 1;

-- Inserire un prodotto candidato associato alla richiesta di acquisto
INSERT INTO prodotto_candidato (nome_prodotto, nome_produttore, ID_richiesta_acquisto, codice_prodotto, URL_info, note, prezzo, approvazione)
VALUES ('Laptop X', 'Produttore Y', @id_richiesta, 12345, 'link', 'Note', 100.50, FALSE);

-- Trovare l'ID del prodotto candidato appena inserito
SELECT ID INTO @id_prodotto FROM prodotto_candidato WHERE codice_prodotto = 12345;

-- Aggiornare lo stato delle proposte di acquisto
INSERT INTO propone (stato, ID_richiesta_acquisto, ID_prodotto_candidato)
VALUES ('In attesa', @id_richiesta, @id_prodotto);

-- Verificare il contenuto delle tabelle
SELECT * FROM richiesta_acquisto;
SELECT * FROM categoria;
SELECT * FROM specifica;
SELECT * FROM associa;
SELECT * FROM prodotto_candidato;
SELECT * FROM propone;
       
