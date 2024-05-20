# Laboratorio di Basi di Dati:  *Progetto "Market"*

**Gruppo di lavoro**:

| Matricola | Nome | Cognome | Contributo al progetto |
|:---------:|:----:|:-------:|:----------------------:|
|    285246 | Antonio     | sabatini        |                        |
|     285714      |    Mario  |      Ranalli   |                        |
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
  
- E' possibile infine inserire qui un glossario che riporta tutti gli oggetti di dominio individuati, con la loro semantica, i loro eventuali sinonimi e le loro proprietà. !!!!!!!!!!!!!!!!!!!!!!!!

## Progettazione concettuale

- Riportate qui il **modello ER iniziale**. Cercate di renderlo *leggibile*, altrimenti correggerlo diventerà impossibile. Se è troppo piccolo, dividetelo in parti e/o allegate anche un'immagine ad alta risoluzione alla relazione.

- Commentate gli elementi non visibili nella figura (ad esempio il contenuto degli attributi composti) nonché le scelte/assunzioni che vi hanno portato a creare determinate strutture, se lo ritenete opportuno.

### Formalizzazione dei vincoli non esprimibili nel modello ER

- Elencate gli altri **vincoli** sui dati che avete individuato e che non possono essere espressi nel diagramma ER.

## Progettazione logica

### Ristrutturazione ed ottimizzazione del modello ER

- Riportate qui il modello **ER ristrutturato** ed eventualmente ottimizzato. 

- Discutete le scelte effettuate, ad esempio nell'eliminare una generalizzazione o nello scindere un'entità.

### Traduzione del modello ER nel modello relazionale

- Riportate qui il **modello relazionale** finale, derivato dal modello ER ristrutturato della sezione precedente e che verrà implementato in SQL in quella successiva. 

- Nel modello evidenziate le chiavi primarie e le chiavi esterne.

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