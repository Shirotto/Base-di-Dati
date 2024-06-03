DELIMITER //

CREATE PROCEDURE DettagliRichiestaAcquisto (
    IN p_ID_richiesta INTEGER
)
BEGIN
    SELECT 
        ra.ID AS ID_richiesta,
        ra.ID_utente,
        u.nome AS nome_utente,
        u.cognome AS cognome_utente,
        ra.ID_prodottoass,
        pc.nome_prodotto,
        pc.nome_produttore,
        pc.codice_prodotto,
        pc.URL_info,
        pc.note AS note_prodotto,
        pc.prezzo,
        pc.approvazione_prodotto_candidato,
        pc.stato_ordine_spedizione,
        ra.totale,
        ra.`data`,
        ra.note AS note_richiesta,
        ra.tecnico_assegnato,
        ra.stato_richiesta
    FROM richiesta_acquisto ra
    LEFT JOIN utente u ON ra.ID_utente = u.ID
    LEFT JOIN prodotto_candidato pc ON ra.ID_prodottoass = pc.ID
    WHERE ra.ID = p_ID_richiesta ;
END //

DELIMITER ;

call DettagliRichiestaAcquisto(1);
