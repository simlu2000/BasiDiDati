-----------------------------------------------------------FILE SQL 3 PARTE--------------------------------------------------------------
/*
	TEAM 32:
		Simone Lutero 4801326
		Ilaria Bruzzone 4844842
		Debora Rustemaj 4684484

    
	
*/

set search_path to "socialm_Parte3";
----------------------------------------------------CARICO DI LAVORO / QUERY----------------------------------------------------
/*Progetto fisico e sua validazione, articolato in:
A)Descrizione in linguaggio naturale e il codice SQL sviluppato per implementare le interrogazioni del carico di lavoro */

    /*Query 1-> lista appuntamenti futuri della famiglia presso il social market*/
   SELECT fam.codfam, app.dataapp
   FROM cliente cli JOIN famiglia fam ON cli.codfam = fam.codfam 
                    JOIN appuntamento app ON fam.codfam= app.codfam
   WHERE app.dataapp > CURRENT_TIMESTAMP
   GROUP BY fam.codfam, app.dataapp
   ORDER BY app.dataapp, fam.codfam;

   
    /*Query 2-> Trova il numero di prodotti scaduti per ogni tipo di prodotto*/
    SELECT p.tipoProd, COUNT(*) AS numero_prodotti_scaduti
    FROM prodotto p
    WHERE p.scadenza < CURRENT_DATE
    GROUP BY p.tipoProd;

    /*Query 3-> Trova la somma dei saldi punti di tutte le famiglie che hanno effettuato almeno un appuntamento*/
    SELECT f.codfam, SUM(f.saldoPunti) AS saldo_punti_totale
    FROM famiglia f
    JOIN appuntamento a ON f.codfam = a.codfam
    GROUP BY f.codfam;

    /*Aggiungere prodotti con scadenza entro un mese*/

-------------------------------------------------SCHEMA FISICO------------------------------------------------
/*b) progetto fisico, contenente l’elenco degli indici che si intendono creare per le interrogazioni contenute
nel carico di lavoro (specificando relazione di riferimento e chiave di ricerca), il loro tipo (ordinato/hash,
clusterizzato/non clusterizzato) e la motivazione che ha portato alla loro creazione. */

CREATE INDEX Indice_OrariApp ON appuntamento(dataapp);
CLUSTER appuntamento USING Indice_OrariApp;

CREATE INDEX  Indice_Scadenza ON prodotto(scadenza);
CLUSTER prodotto USING Indice_Scadenza;

CREATE INDEX Indice_Punti ON famiglia(saldopunti);
CLUSTER famiglia USING Indice_Punti;


ANALYZE;



----------------------------------------------------TRANSAZIONE----------------------------------------------------
/*[D] Descrizione in linguaggio naturale e codice PL/pgSQL della transazione considerata e giustificazione per il
livello di isolamento prescelto.*/

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Interrogazione di lettura 1: Recupera il saldo punti di una famiglia
SELECT saldoPunti
FROM famiglia
WHERE codfam = 2222;

-- Interrogazione di scrittura: Aggiorna il saldo punti della famiglia
UPDATE famiglia
SET saldoPunti = saldoPunti + 50
WHERE codfam = 2222;

-- Interrogazione di lettura 2: Verifica il saldo punti aggiornato
SELECT saldoPunti
FROM famiglia
WHERE codfam = 2222;

COMMIT;


----------------------------------------------------CONTROLLO ACCESSO----------------------------------------------------
/*[S] Script SQL per l’implementazione della politica di controllo dell’accesso*/




/*DATI TABELLA DA INSERIRE*/
SELECT RelName AS Nome_Tabella, RelPages AS Num_Pagine
FROM pg_class
WHERE Nome_Tabella IN('cliente','famiglia','appuntamento','prodotto');
SELECT COUNT(*) FROM cliente/famiglia/appuntamento/prodotto;