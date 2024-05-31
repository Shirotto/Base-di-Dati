-- Utente (Aggiungi utente)

DELIMITER //

CREATE PROCEDURE AggiungiUtente(
    IN U_nome VARCHAR(200),
    IN U_cognome VARCHAR(200),
    IN U_indirizzo VARCHAR(200),
    IN U_email VARCHAR(100),
    IN U_telefono INT UNSIGNED ,
    IN U_tipo ENUM('utente', 'amministratore', 'tecnico'),
    IN U_admin_id INT UNSIGNED
)
BEGIN
    DECLARE utente_tipo ENUM('utente', 'amministratore', 'tecnico');
    
    

    -- Verifica se l'utente che sta chiamando la procedura è un amministratore
    SELECT tipo INTO utente_tipo
    FROM utente
    WHERE ID = U_admin_id;
    
    
    IF utente_tipo != 'amministratore' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Solo gli amministratori possono aggiungere nuovi utenti e tecnici.';
    
    
    ELSE 
    
    INSERT INTO utente(nome, cognome, indirizzo, email, telefono, tipo)
    VALUES(U_nome, U_cognome,U_indirizzo, U_email, U_telefono, U_tipo);
    
	END IF;
    END //
    
    
DELIMITER ;
CALL AggiungiUtente('Nuovo','Tecnico aggiunto', 'via da qui', 'nuovo@gmail.omc', 456123,'tecnico',3);
SELECT * FROM utente;
