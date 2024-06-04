DELIMITER //

CREATE PROCEDURE RANC_Ordinante (IN ID_Ordinante INTEGER UNSIGNED)
BEGIN
    SELECT * FROM richiesta_acquisto WHERE richiesta_acquisto.ID_utente = ID_Ordinante
      AND stato_richiesta = 'aperta'
      AND approvazione_prodotto_candidato = 'in valutazione';
END //

DELIMITER ;


CALL RANC_Ordinante(6);
