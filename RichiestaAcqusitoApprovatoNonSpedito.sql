DELIMITER //
CREATE PROCEDURE RichiestaAcquistoNonSpedito(
IN id_tecnico INT
)
BEGIN 

SELECT 
ra.ID AS ID_richiesta,
ra.ID_utente,
ra.ID_prodottoass,
ra.tecnico_assegnato,
ra.`data`,
ra.note,
ra.stato_richiesta,
pc.nome_prodotto,
pc.codice_prodotto,
pc.approvazione_prodotto_candidato,
pc.stato_ordine_spedizione

 FROM 
        richiesta_acquisto ra
        JOIN propone p ON ra.ID = p.ID_richiesta_acquisto
        JOIN prodotto_candidato pc ON p.ID_prodotto_candidato = pc.ID
    WHERE 
        ra.tecnico_assegnato = tecnico_id
        AND pc.approvazione_prodotto_candidato = 'approvato'
        AND pc.stato_ordine_spedizione = 'ordine in sospeso';


END //
DELIMITER ;

CALL RichiestaAcquistoNonSpedito(2);
