create view Tecnici as    
select ID, num_richieste_associate
from utente
where tipo = 'tecnico';


delimiter \\

CREATE PROCEDURE assegna_ra(IN ra_ID INTEGER,id_richiesta INTEGER)


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
    richiesta_acquisto.ID = id_richiesta;
UPDATE utente 
SET 
    num_richieste_associate = num_richieste_associate + 1
WHERE
    utente.ID = tecnico;
end \\

delimiter ;

CALL assegna_RA (2,1);
SELECT * FROM richiesta_acquisto;
