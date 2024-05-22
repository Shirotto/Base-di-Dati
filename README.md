# Laboratorio di Basi di Dati:  *Progetto "Market"*

**Gruppo di lavoro**:

| Matricola | Nome | Cognome | Contributo al progetto |
|:---------:|:----:|:-------:|:----------------------:|
|    285246 | Antonio     | sabatini        |                        |
|     285714      |    Mario  |      Ranalli   |        Mascotte   / Filantropo      |
|     265332     |    Marco  |      Nicolella   |                        |

**Data di consegna del progetto**: gg/mm/aaaa

## Analisi dei requisiti

- E' possibile riportare in questa sezione i **requisiti **copiati dal documento di specifica, oppure semplicemente riassumerne gli aspetti più importanti.
  Vanno quindi (eventualmente) discusse tutte le scelte progettuali relative al dominio, le ambiguità e il modo in cui sono state risolte.
  
- Definizione della richiesta di acquisto. L’ordinante dovrà selezionare una categoria (ad esempio PC Desktop, Notebook, Scrivania,...) che identifichi la tipologia di prodotto da acquistare tra quelle note al sistema (opzionalmente le categorie potranno avere una struttura ad albero, ad esempio Informatica > Computer > Notebook). Ogni categoria di prodotto avrà associate una serie di caratteristiche specifiche (ad esempio quantità di RAM e tipo di CPU per un PC, ecc.), sempre definite nel sistema ed eventualmente aggiornabili. L'ordinante, per completare la propria richiesta di acquisito, dovrà quindi inserire i valori di tutte le caratteristiche desiderate relative alla categoria di prodotto selezionata (per ogni caratteristica sarà comunque sempre prevista l'opzione indifferente). Sarà presente anche uno spazio note per aggiungere ogni caratteristica peculiare non annoverata tra quelle standard.

- Ricerca del prodotto da parte del personale tecnico. Un membro del personale sarà associato alla richiesta di acquisto definita al punto 1, diventandone il tecnico incaricato. Il tecnico incaricato potrà visionare la categoria e le caratteristiche richieste dall'ordinante, associerà, poi, un "prodotto candidato" alla richiesta d'acquisto.
  
- Revisione del prodotto candidato. L'ordinante prenderà visione del prodotto candidato e potrà approvarlo o respingerlo, fornendo in questo caso una motivazione. In caso di richiesta respinta, il processo riprenderà dal passo 2, considerando che il tecnico incaricato sarà sempre lo stesso. La motivazione del rifiuto sarà mostrata assieme alle informazioni della richiesta, e il tecnico incaricato potrà modificare il prodotto candidato e inoltrarlo nuovamente all'ordinante.

- Esecuzione dell'ordine. Nel caso in cui l'ordinante approvi la scelta del prodotto candidato  il personale tecnico procederà all'acquisto.

- Consegna e verifica del prodotto. Quando il prodotto sarà consegnato l'ordinante chiuderà la relativa richiesta di acquisto indicando se il prodotto ricevuto è stato accettato o respinto (perchè non conforme o non funzionante).

GLOSSARIO

Utente


- Entità che astrae il concetto di utente e associa ad ogni utnte (Tecnico, Compratore, Amministratore) oltre a Nome, Cognome ecc.. anche un ID_Utente, che è chiave primaria di quest'entità.




Amministratore


- E' l'unica entità che ha la proprietà di registrare alri utenti "ricorsivamente". Acquisisce gli attributi dell'entità utente.




Tecnico Incaricato


Sinonimi: Tecnico, Responsabile Tecnico
- Il membro del personale tecnico responsabile della ricerca e selezione del prodotto.
Attraverso "Tecnico" riusciamo a gestire la ricerca e la selezione del prodotto candidato che soddisfa le specifiche della richiesta di acquisto. Questo tecnico visualizza le richieste, seleziona i prodotti appropriati, e interagisce con l'ordinante durante il processo di approvazione del prodotto attraverso la richiesta d'acquisto.





Compratore


Sinonimi: Richiedente
- La persona che richiede l'acquisto di un prodotto.
L' "Ordinante" è l'utente che ha la necessità di un prodotto e formula unala Richiesta di Acquisto. L'ordinante attraverso la richiesta di acquisto puo' fornire le specifiche dettagliate e approvare o respingere il prodotto.





Richiesta di Acquisto


Sinonimi: Ordine di Acquisto, Ordine
- Richiesta formale per acquistare un prodotto o un insieme di prodotti.
Una volta che il tecnico incaricato prende in carico la richiesta, quest'entità ci permette di selezionare la categoria del prodotto da acquistare. 





Tecnico Incaricato


Sinonimi: Tecnico, Responsabile Tecnico
- Il membro del personale tecnico responsabile della ricerca e selezione del prodotto.
Il "Tecnico Incaricato" è la persona designata a gestire la ricerca e la selezione del prodotto candidato che soddisfa le specifiche della richiesta di acquisto. Questo tecnico visualizza le richieste, seleziona i prodotti appropriati, e interagisce con l'ordinante durante il processo di approvazione del prodotto.





Prodotto Candidato


Sinonimi: Proposta di Prodotto, Prodotto Selezionato
- Il prodotto selezionato dal tecnico incaricato che risponde alle caratteristiche richieste.
Quest'entità descrive il prodotto scelto dal tecnico incaricato che meglio corrisponde alle caratteristiche richieste dall'ordinante.Questo prodotto viene presentato all'ordinante per l'approvazione o il rifiuto. 





Categoria


Sinonimi: Classe di Prodotto
- La "Categoria di Prodotto" definisce il tipo di prodotto che il compratore desidera acquistare. Ha un attributo che funge da chiave primaria e può contenere tutte le sotto categorie. Inoltre, associa un valore univoco all'entità "Specifica".




Specifica


- Prodotto vero e proprio.
La "Specifica" rappresenta il prodotto vero e proprio. Attraverso la "Specifica" è possibile risalire al prodotto effettivamente selezionato e alla quantità necessaria.



## Progettazione concettuale

- Riportate qui il **modello ER iniziale**. Cercate di renderlo *leggibile*, altrimenti correggerlo diventerà impossibile. Se è troppo piccolo, dividetelo in parti e/o allegate anche un'immagine ad alta risoluzione alla relazione.
![Diagramma ER](https://github.com/Shirotto/Base-di-Dati/assets/127602582/265452c9-b150-465b-838a-ea248d618d8b)


- Commentate gli elementi non visibili nella figura (ad esempio il contenuto degli attributi composti) nonché le scelte/assunzioni che vi hanno portato a creare determinate strutture, se lo ritenete opportuno.
- RICHIESTA D'ACQUISTO: Presumiamo che la richiesta d'acquisto possa contenere la richiesta di un singolo prodotto.
- PRODOTTO CANDIDATO: Il prodotto candidato per una richiesta d'acquisto sarà uno solo, ma riteniamo utile tenere conto di tutte le proposte rifiutate per quella richiesta d'acquisto. Per questo "prodottto candidato" tiene conto del fatto di essere stato rifiutato o meno. I prodotti rifiutati verranno registrati in una lista apposita e poi rimossi una volta chiusa la richiesta a cui sono associati.
- CATEGORIA: Le categorie presentano una struttura ad albero.


### Formalizzazione dei vincoli non esprimibili nel modello ER

- Elencate gli altri **vincoli** sui dati che avete individuato e che non possono essere espressi nel diagramma ER.
- VINCOLO DI ACCESSO E MODIFICA "RICHIESTA D'ACQUISTO"--> Il sistema prevede che un utente sia direttamente collegato ad una o più richieste d'acquisto, ma non tutti gli utenti ne hanno accesso allo stesso modo. Distinguiamo tre tipi di utente: tecnico, compratore e amministratore. Il "tecnico" avrà visione completa della "richiesta d'acquisto" ma potrà modificare solo il "prodotto candidato" presente in essa, aggiungendo un nuovo prodotto candidato o sostituendo quello vecchio in caso di necessità. Il "compratore", invece, avrà completo accesso alla r.a. e potra modificare i parametri a proprio piacimento in qualsiasi momento, non avrà ovviamente accesso al "prodotto candidato". Potrà, infine, chiudere la r.a. al termine del processo di acquisto o in qualsiasi momento lo desideri.


## Progettazione logica

### Ristrutturazione ed ottimizzazione del modello ER

- Riportate qui il modello **ER ristrutturato** ed eventualmente ottimizzato.
 ![image](https://github.com/Shirotto/Base-di-Dati/assets/127602582/eb6b4f3e-2e72-47a4-9770-924f22bfff26)


- Discutete le scelte effettuate, ad esempio nell'eliminare una generalizzazione o nello scindere un'entità.
- RIMOZIONE GENERALIZZAZIONE UTENTE: Considerando che tutti gli utenti condividono gli stessi attributi, abbiamo deciso di consolidarli in un'unica entità per semplificare la gestione. Per distinguere i vari tipi di utenti all'interno di questa entità consolidata, abbiamo introdotto un nuovo attributo denominato "Tipo". Questo attributo ci permette di identificare e differenziare chiaramente i diversi tipi di utenti, garantendo al contempo una struttura dati più efficiente e organizzata.

### Traduzione del modello ER nel modello relazionale

- Riportate qui il **modello relazionale** finale, derivato dal modello ER ristrutturato della sezione precedente e che verrà implementato in SQL in quella successiva. 

- Nel modello evidenziate le chiavi primarie e le chiavi esterne.
![Modello relazionale](https://github.com/Shirotto/Base-di-Dati/assets/127602582/5c587f0b-323c-44e1-82f7-832f197f80ce)

## Progettazione fisica

### Implementazione del modello relazionale

- Inserite qui lo *script SQL* con cui **creare il database** il cui modello relazionale è stato illustrato nella sezione precedente. Ricordate di includere nel codice tutti
  i vincoli che possono essere espressi nel DDL. 

- Potete opzionalmente fornire anche uno script separato di popolamento (INSERT) del database su cui basare i test delle query descritte nella sezione successiva.

### Implementazione dei vincoli

- Nel caso abbiate individuato dei **vincoli ulteriori** che non sono esprimibili nel DDL, potrete usare questa sezione per discuterne l'implementazione effettiva, ad esempio riportando il codice di procedure o trigger, o dichiarando che dovranno essere implementati all'esterno del DBMS.

### Implementazione funzionalità richieste

- Riportate qui il **codice che implementa tutte le funzionalità richieste**, che si tratti di SQL o di pseudocodice o di entrambi. *Il codice di ciascuna funzionalità dovrà essere preceduto dal suo numero identificativo e dal testo della sua definizione*, come riportato nella specifica.

- Se necessario, riportate anche il codice delle procedure e/o viste di supporto.

#### Funzionalità 1

> Definizione come da specifica

```sql
CODICE
```

#### Funzionalità 2

> Definizione come da specifica

```sql
CODICE
```

## Interfaccia verso il database

- Opzionalmente, se avete deciso di realizzare anche una **(semplice) interfaccia** (a linea di comando o grafica) in un linguaggio di programmazione a voi noto (Java, PHP, ...) che manipoli il vostro database , dichiaratelo in questa sezione, elencando
  le tecnologie utilizzate e le funzionalità invocabili dall'interfaccia. 

- Il relativo codice sorgente dovrà essere *allegato *alla presente relazione.

-----

**Raccomandazioni finali**

- Questo documento è un modello che spero possa esservi utile per scrivere la documentazione finale del vostro progetto di Laboratorio di Basi di Dati.

- Cercate di includere tutto il codice SQL nella documentazione, come indicato in questo modello, per facilitarne la correzione. Potete comunque allegare alla documentazione anche il *dump* del vostro database o qualsiasi altro elemento che ritenete utile ai fini della valutazione.

- Ricordate che la documentazione deve essere consegnata, anche per email, almeno *una settimana prima* della data prevista per l'appello d'esame. Eventuali eccezioni a questa regola potranno essere concordate col docente.
