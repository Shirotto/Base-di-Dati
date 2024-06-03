DELIMITER //

CREATE PROCEDURE RANC_Ordinante (IN ID_Ordinante INTEGER UNSIGNED)
BEGIN
    SELECT *
    FROM richiesta_acquisto ra
    JOIN prodotto_candidato pc ON ra.ID_prodottoass = pc.ID
    WHERE ra.ID_utente = ID_Ordinante
      AND ra.stato_richiesta = 'aperta'
      AND pc.approvazione_prodotto_candidato = 'in valutazione';
END //

DELIMITER ;


CALL RANC_Ordinante(5);
