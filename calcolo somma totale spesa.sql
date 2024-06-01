DELIMITER //
CREATE PROCEDURE CalcoloSommaOrdinante(
IN id_utente INT
)
BEGIN 

SELECT 
u.ID,
u.nome,
u.cognome,
SUM(ra.totale) AS totale_richieste
 FROM 
        richiesta_acquisto ra
    JOIN utente u ON ra.ID_utente = u.ID
    JOIN propone p ON ra.ID = p.ID_richiesta_acquisto
    JOIN prodotto_candidato pc ON p.ID_prodotto_candidato = pc.ID
    WHERE 
        ra.ID_utente = id_utente
        AND ra.stato_richiesta = 'chiusa'
        AND p.stato = 'ordinato'
        AND pc.stato_ordine_spedizione = 'ordine accettato'
        AND pc.approvazione_prodotto_candidato = 'approvato'
        
        GROUP BY
    u.ID, u.nome, u.cognome;


END //
DELIMITER ;

CALL CalcoloSommaOrdinante(1);
