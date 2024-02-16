-----------DEFINITIVO----

--!!!!!!!CONTROLLARE ULTIMO TRIGGER !!!!!!-------

-----------------------------------------------------------FILE SQL 2 PARTE--------------------------------------------------------------
/*
	TEAM 32:
		Simone Lutero 4801326
		Ilaria Bruzzone 4844842
		Debora Rustemaj 4684484

	File con Diagramma generato da DataGrip in file a parte datagrip.png
	Popolamento base di dati in popolamentobd.sql
*/


DROP SCHEMA IF EXISTS SM CASCADE;
CREATE SCHEMA "SM";

SET search_path to "SM";
SET datestyle to "MDY";

CREATE DOMAIN orario VARCHAR(10)
     CHECK (VALUE IN ('Mattina', 'Pomeriggio')
);
CREATE TABLE famiglia(
		cf varchar(16)  UNIQUE NOT NULL,
		codfam numeric primary key,
		ncomp numeric NOT NULL,
		nome varchar(40) NOT NULL,
		cognome varchar(40) NOT NULL,
		datanasc date NOT NULL,
		saldoPunti decimal(4,2) NOT NULL,
		puntiMensili decimal(4,2),
		CHECK(puntiMensili BETWEEN 30 AND 60)
		
		
);

CREATE TABLE prodotto(
	idProd numeric PRIMARY KEY,
	nome VARCHAR(30) NOT  NULL,
	tipoProd VARCHAR(30) NOT NULL,
    vendibile BOOLEAN,
	deperibile BOOLEAN,
    quantità numeric,
	dataMassima DATE,
	scadenza DATE CHECK (dataMassima > Scadenza), /*V2*/
	dataRacc DATE,
	dataAcquisto DATE,
	importo decimal(4,2),
	nPunti decimal(4,2) NOT NULL CHECK (nPunti >= 0), /*V5*/
	CHECK (dataAcquisto >= dataRacc), /*V10*/--ù
	CHECK (dataRacc <= dataMassima) /*V11*/
);

CREATE TABLE donatore(

	cf VARCHAR(16) PRIMARY KEY,
	piva VARCHAR(11),
	email VARCHAR(40) ,
	tel VARCHAR(40),
	tipo VARCHAR(50),
	indirizzo VARCHAR(100)
);

CREATE TABLE importo(
	idoperaz numeric PRIMARY KEY,
	cifra FLOAT NOT NULL
);

CREATE TABLE volontario(
	cf VARCHAR(16) PRIMARY KEY,
	veicolo VARCHAR(40),
	tel VARCHAR(40) ,
	nome varchar(40),
	cognome varchar(40),
	email varchar(50),
	servizio VARCHAR(50),
	dataNasc DATE,
	disponibilita varchar(30),
	associazione VARCHAR(40)
);

CREATE TABLE appuntamento(
	idapp int PRIMARY KEY,
	dataApp date,
	codfam numeric NOT NULL references famiglia on update cascade,
	spesa numeric DEFAULT '0',
	puntiInizio decimal(4,2) ,
	puntiFine decimal(4,2) ,
	cfvol VARCHAR(16) NOT NULL REFERENCES volontario on update cascade,
	CHECK(puntiInizio >= puntiFine), /*V8*/
	CHECK(puntiInizio >= 0) /*V9*/
	
);

CREATE TABLE turno(
	--introduco iduturno come chiave primaria
    idturno numeric primary key,
	volontario VARCHAR(16) REFERENCES volontario on update CASCADE,
	orario varchar(10),
	data date,
	tipoServizio VARCHAR(50)
	
    

);

CREATE TABLE trasporto(
	idTrasp numeric PRIMARY KEY,
	sedeRitiro VARCHAR(50),
	dataOra TIMESTAMP,
	nCestelli numeric CHECK(nCestelli>0) /*V12*/
);

CREATE TABLE inventario(
	idinv numeric UNIQUE,
	qta numeric,
	prodotto numeric REFERENCES Prodotto(idprod) ON UPDATE CASCADE PRIMARY KEY
);


CREATE TABLE cliente(
	cf VARCHAR(16) UNIQUE NOT NULL,
	cod numeric (20) PRIMARY KEY,
    tel varchar(40) ,
	email varchar(40) ,
	dataAut TIMESTAMP,
	codfam numeric NOT NULL references famiglia on update CASCADE,
	nome VARCHAR(40),
	cognome VARCHAR(40),
	dataNasc date NOT NULL,
	nomeEnte VARCHAR(40),
	reddito numeric,
	CHECK(dataAut < CURRENT_DATE - INTERVAL '6 months'),/*V1*/
	CHECK(dataNasc < CURRENT_DATE - INTERVAL '16 years') /*V6*/
	
);


----------------------VISTE---------------


--1 punti mensili e punti residui 
    CREATE OR REPLACE VIEW vista1 AS
		SELECT famiglia.codfam AS Famiglia,famiglia.puntimensili AS Punti_Mensili, famiglia.saldopunti AS Punti_Residui 
		FROM famiglia GROUP BY Famiglia, Punti_Mensili, Punti_Residui;



--2 numero persone autorizzate (per l'eta è presente un vincolo check in cliente)
    CREATE OR REPLACE VIEW vista2 AS
		SELECT cliente.codfam, COUNT(cliente.codfam) AS Num_Aut FROM cliente
		GROUP BY cliente.codfam; 



--3 numero componenti totali
    CREATE OR REPLACE VIEW vista3 AS
		SELECT famiglia.codfam AS Codice_Famiglia, famiglia.ncomp AS Numero_Componenti 
		FROM famiglia
		GROUP BY famiglia.codfam,famiglia.ncomp;


--4 appartenenti a fascia età più bassa
        --come fascia più bassa abbiamo ipotizzato fossero le persone di età < 16 anni

CREATE OR REPLACE VIEW vista4 AS
	SELECT f.codfam,count(f.cf) as numerogiovani from famiglia f
	WHERE (f.DataNasc > CURRENT_DATE - INTERVAL '16 years')
	GROUP BY f.codfam,f.cf
	ORDER BY f.codfam;


--5 numero spese nell'ultimo anno 
    CREATE OR REPLACE VIEW vista5 AS
		SELECT appuntamento.codfam AS Famiglia, SUM(appuntamento.spesa) AS NumeroSpese
		FROM appuntamento 
		WHERE dataApp >= CURRENT_DATE - INTERVAL '1 year'
		GROUP BY Famiglia,appuntamento.spesa;


--6 punti eventualmente non utilizzati
--calcolo il numero di mesi da quando ha l'autorizzazione e ne faccio il minimo tra il valore e 6 in quanto
--l'autorizzazione è valida solo per 6 mesi, moltiplico per il numero di punti mensili,
--e sottraggo il saldo dei punti rimanenti dell'ultimo appuntamento di ogni mese

CREATE OR REPLACE VIEW vista6 AS
	SELECT f.codfam, (f.puntimensili * 12) - sum(a.puntiinizio - a.puntifine) as puntinonutilizzati 
	FROM famiglia f JOIN appuntamento a on a.codfam=f.codfam
	WHERE dataApp >= CURRENT_DATE - INTERVAL '1 year'
	GROUP BY f.codfam,a.codfam,f.puntimensili,a.puntiinizio,a.puntifine


--7) percentuale di punti usata per prodotti deperibili e non deperibili nell'ultimo anno 
CREATE OR REPLACE VIEW vista7 AS
	SELECT calcolo1.codfam, round(COALESCE(((Punti_Deperibili_Utilizzati*100)/Tot_Punti_Utilizzati),0)) as Punti_Dep_Perc, round(100-COALESCE(((Punti_Deperibili_Utilizzati*100)/Tot_Punti_Utilizzati),0)) as Punti_NonDep_Perc
	FROM
		(SELECT cliente.codfam, SUM(npunti) as Tot_Punti_Utilizzati 
		FROM prodotto JOIN appuntamento ON prodotto.dataacquisto = appuntamento.dataapp JOIN cliente ON appuntamento.codfam = cliente.codfam
		GROUP BY cliente.codfam)as calcolo1
	FULL OUTER JOIN
		(SELECT cliente.codfam, SUM(npunti) as Punti_Deperibili_Utilizzati 
		FROM prodotto JOIN appuntamento ON prodotto.dataacquisto = appuntamento.dataapp JOIN cliente ON appuntamento.codfam = cliente.codfam
		WHERE prodotto.deperibile IS true AND dataacquisto BETWEEN CURRENT_DATE - INTERVAL '1 year' AND CURRENT_DATE
		GROUP BY cliente.codfam)as calcolo2
	ON calcolo1.codfam = calcolo2.codfam;


--vista totale


CREATE OR REPLACE VIEW VTOT AS
	SELECT vista1.Famiglia, vista1.Punti_Mensili, vista1.Punti_Residui, vista2.Num_Aut, vista3.Numero_Componenti, vista4.numerogiovani,
	vista5.NumeroSpese, vista6.puntinonutilizzati, vista7.Punti_Dep_Perc, vista7.Punti_NonDep_Perc
	FROM vista1
	FULL OUTER JOIN vista2 ON vista1.Famiglia = vista2.codfam
	FULL OUTER JOIN vista3 ON vista1.Famiglia = vista3.Codice_Famiglia
	FULL OUTER JOIN vista4 ON vista1.famiglia=  vista4.codfam
	FULL OUTER JOIN vista5 ON vista1.Famiglia = vista5.Famiglia
	FULL OUTER JOIN vista6 ON vista1.Famiglia = vista6.codfam
	FULL OUTER JOIN vista7 ON vista1.Famiglia = vista7.codfam;






----------------------INTERROGAZIONI--------------

/*a) determinare i nuclei familiari che, pur avendo punti assegnati, non hanno effettuato spese nell’ul-
timo mese;  -> OK, vengono restituite i codici familiari delle famiglie che non hanno effettuato spese nell'ultimo mese
(essendo andati agli appuntamenti), sia delle famiglie che non hanno ancora avuto app*/
SELECT DISTINCT famiglia.codfam FROM famiglia
WHERE famiglia.codfam NOT IN (SELECT DISTINCT famiglia.codfam FROM famiglia 
							  JOIN appuntamento ON famiglia.codfam = appuntamento.codfam
						      JOIN Prodotto ON appuntamento.dataapp = prodotto.dataacquisto
                              JOIN Cliente ON famiglia.codfam = cliente.codfam
					 	      WHERE prodotto.dataacquisto BETWEEN CURRENT_DATE - 30 AND CURRENT_DATE
                              AND famiglia.saldopunti > 0);


/*b) determinare le tipologie di prodotti acquistate nell’ultimo anno da tutte le famiglie (cioè ogni fa-
miglia ha acquistato almeno un prodotto di tale tipologia nell’ultimo anno); */
SELECT famiglia.codfam AS Famiglia, COUNT (*) AS Qta_Prod_Acquistati, tipoprod AS Tipo_Prodotto, dataacquisto AS In_Data
FROM famiglia JOIN appuntamento ON famiglia.codfam=appuntamento.codfam
	JOIN prodotto ON appuntamento.dataapp=prodotto.dataacquisto
WHERE prodotto.dataacquisto BETWEEN CURRENT_DATE - 365 AND CURRENT_DATE
GROUP BY Famiglia, Tipo_Prodotto, In_Data
HAVING COUNT(*) > 0



/*c) determinare i prodotti che vengono scaricati (cioè non riescono ad essere distribuiti alle famiglie)
in quantitativo maggiore rispetto al quantitativo medio scaricato per prodotti della loro tipologia
(es. di tipologia: pasta/riso, tonno sottolio, olio, caffè, ecc.).*/


SELECT DISTINCT nome,tipoprod FROM prodotto p1
WHERE scadenza < CURRENT_DATE and dataacquisto is NULL
GROUP BY tipoprod, nome
HAVING COUNT(*) >= ((SELECT AVG(n_scaduti) FROM (SELECT COUNT(*) as n_scaduti FROM prodotto p2
				   WHERE scadenza < CURRENT_DATE and dataacquisto is NULL and p1.tipoprod = p2.tipoprod
				   GROUP BY nome) AS prodotti_scaduti));


----------------------------FUNZIONI E PROCEDURE------------

/*Codice PL/SQL per:*/ 
/*a. funzione che realizza lo scarico dall’inventario dei prodotti scaduti;*/


CREATE OR REPLACE FUNCTION Scarico_Prod_Scaduti () /*scaricare -> rimuovere prodotti invendibili (oltre data di oltre scadenza), ovvero vendibili=false*/
RETURNS void AS
$$
    DECLARE
    acquistabile BOOLEAN;
    datamax DATE;
    idprodotto INTEGER;
    cursoreprod CURSOR FOR SELECT vendibile,datamassima,idprod
                           FROM prodotto
                           WHERE vendibile = true;
    BEGIN
    OPEN cursoreprod;
        FETCH cursoreprod INTO acquistabile, datamax, idprodotto;
        WHILE FOUND LOOP
            BEGIN
                IF (datamax < CURRENT_DATE)
                THEN
                    UPDATE prodotto SET vendibile = false WHERE idprod = idprodotto;
                END IF;
                FETCH cursoreprod INTO acquistabile, datamax, idprodotto;
            END;
        END LOOP;
    CLOSE cursoreprod;
    END;
$$ LANGUAGE plpgsql;


--Provare la funzione -> impostare la data oltrescadenza di qualche prodotto ad un giorno passato
--e il bool vendibile a false (perchè la data oltrescadenza è passata).
--La funzione setterà vendibile a false.


--aggiorno prodotto--
UPDATE prodotto
SET scadenza = CURRENT_DATE - 2, datamassima = CURRENT_DATE - 1, vendibile = true
WHERE nome = 'Penne';

--visualizzo prodotto
SELECT idprod, vendibile, datamassima FROM prodotto WHERE nome = 'Penne';

--richiamo funzione--
SELECT Scarico_Prod_Scaduti();


--visualizzo prodotto con valori aggiornati--
SELECT idprod, vendibile, datamassima FROM prodotto WHERE nome = 'Penne';



/*b. funzione che corrisponde alla seguente query parametrica: dato un volontario e due date, deter-
minare i turni assegnati al volontario nel periodo compreso tra le due date*/

CREATE OR REPLACE FUNCTION Turni_vol(IN CodVol varchar(16), IN DataInizio date, IN DataFine date)
RETURNS TABLE (codvolontario varchar(16), data date) 
AS $$
DECLARE
BEGIN
	RETURN QUERY SELECT turno.volontario, turno.data
	             FROM turno  
                     WHERE turno.volontario = CodVol AND turno.data > DataInizio AND turno.Data < DataFine;
END;
$$
LANGUAGE plpgsql;

/*Provare funzione:*/

--inserisco volontario
INSERT INTO "SM"."volontario" ("cf","veicolo","tel","nome","cognome","email","servizio","datanasc","disponibilita","associazione") VALUES ('trt4ek','Furgone','3458767665','luca','Zarr','luca.dr@live.no','Appuntamenti','03/06/1970','Mattino e pomeriggio','itaiuta');

--inserisco turni


INSERT INTO turno (idturno,volontario, orario, data, tipoServizio) values (100,'trt4ek','mattina','2023-05-05 17:00:00','accoglienza');
INSERT INTO turno (idturno,volontario, orario, data, tipoServizio) values (34,'trt4ek','pomeriggio','2023-05-03 17:00:00','accoglienza');


--verifico funzione--


SELECT * FROM Turni_vol('trt4ek', '11.08.2010 08:00:00', '11.08.2050 08:00:00');



-----------------------------------------------------------------TRIGGER------------------

/*a. verifica del vincolo che nessun volontario possa essere assegnato a più attività contemporanee
(suggerimento: utilizzare il predicato OVERLAPS);*/ --> 
CREATE OR REPLACE FUNCTION Errore_Attivita()
RETURNS trigger AS 
$$
BEGIN
IF NEW.volontario IN (SELECT volontario FROM turno WHERE data=new.data and orario=new.orario and volontario=new.volontario) THEN
	RAISE EXCEPTION 'Non puoi gestire più di un attività da volontario contemporaneamente.';
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER controlllo_volontario_attiivita
BEFORE INSERT OR UPDATE on turno FOR EACH ROW
EXECUTE PROCEDURE Errore_Attivita();

--test--

/* inserisco un volontario del db */

INSERT INTO "SM"."volontario" ("cf","veicolo","tel","nome","cognome","email","servizio","datanasc","disponibilita","associazione") VALUES ('trtfghk','Furgone','3458767665','Simone','Zarr','simone.zardr@live.no','Appuntamenti','03/06/1970','Mattino e pomeriggio','itaiuta');

/* inserisco i due turni uguali */

INSERT INTO turno (idturno,volontario, orario, data, tipoServizio) values (96,'trtfghk','mattina','2023-05-03 17:00:00','accoglienza');
INSERT INTO turno (idturno,volontario, orario, data, tipoServizio) values (100,'trtfghk','mattina','2023-05-05 17:00:00','accoglienza');


/*b. mantenimento della disponibilità corrente dei prodotti.*/
/*Quando si inserisce un nuovo prodotto nella tabella prodotto, il 
trigger controlla se il nome del prodotto esiste già nella tabella. 
Se esiste, aggiorna la qta del prodotto aumentandola di 2.*/
-- Creazione del trigger
CREATE OR REPLACE FUNCTION aggiorna_disponibilita()
    RETURNS TRIGGER AS
    $$
    BEGIN
        IF TG_OP = 'INSERT' THEN
            -- Aggiorna la quantità disponibile se il prodotto viene inserito
            UPDATE prodotto
            SET quantità = quantità + 1
            WHERE idProd = NEW.idProd;
        ELSIF TG_OP = 'DELETE' THEN
            -- Ripristina la quantità disponibile se il prodotto viene eliminato
            UPDATE prodotto
            SET quantità = quantità - 1
            WHERE idProd = OLD.idProd;
        END IF;
        RETURN NEW;
    END;
    $$
    LANGUAGE plpgsql;

CREATE TRIGGER trigger_aggiorna_disponibilita
    AFTER INSERT OR DELETE ON inventario
    FOR EACH ROW
    EXECUTE FUNCTION aggiorna_disponibilita();

/*Provare trigger -> inserisco ed elimino un prodotto dall'inventario per verificare che la quantità in prodotto venga aggiornata*/


INSERT INTO inventario (idinv, qta, prodotto) VALUES (1, 10, 5);
SELECT * FROM prodotto WHERE idprod = 5;

DELETE FROM inventario WHERE prodotto=5;
SELECT * FROM prodotto WHERE idprod = 5;

