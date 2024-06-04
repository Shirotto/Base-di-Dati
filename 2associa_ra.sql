create view Tecnici as    
select ID, num_richieste_associate
from utente
where tipo = 'tecnico';


delimiter \\

CREATE PROCEDURE assegna_ra(IN ra_ID INTEGER)


begin

DECLARE tecnico INTEGER;

SELECT 
    ID
INTO tecnico FROM
    Tecnici
GROUP BY Tecnici.ID
ORDER BY Tecnici.num_richieste_associate ASC
LIMIT 1;


UPDATE richiesta_acquisto 
SET 
    tecnico_assegnato = tecnico
WHERE
    richiesta_acquisto.ID = ra_ID;
UPDATE utente 
SET 
    num_richieste_associate = num_richieste_associate + 1
WHERE
    utente.ID = tecnico;
end \\

delimiter ;

CALL assegna_RA (1000);
SELECT * FROM richiesta_acquisto;
