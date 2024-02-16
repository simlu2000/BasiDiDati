---------------definitivo------------------ popolamento--------------------------
SET search_path to 'SM';
SET datestyle to 'MDY';


INSERT INTO "SM"."famiglia" ("cf","codfam","ncomp","nome","cognome","datanasc","saldopunti","puntimensili") VALUES ('wxikmPVuFxSjgm8M',2222,3,'samuele','rossi','07/21/2009',10,40);
INSERT INTO "SM"."famiglia" ("cf","codfam","ncomp","nome","cognome","datanasc","saldopunti","puntimensili") VALUES ('rxkmPVuFxSjgm8M',3333,3,'simona','rossi','07/21/1980',10,40);
INSERT INTO "SM"."famiglia"("cf","codfam","ncomp","nome","cognome","datanasc","saldopunti","puntimensili") VALUES ('PxkkmPVTFxSjirmS',4444,3,'Pino','rossi','09/21/2013',10,40);
INSERT INTO "SM"."famiglia" ("cf","codfam","ncomp","nome","cognome","datanasc","saldopunti","puntimensili") VALUES ('wxlkmPVuFxSjim8M',5555,5,'Mirco','Bianchi','05/21/1960',20.5,45);
INSERT INTO "SM"."famiglia" ("cf","codfam","ncomp","nome","cognome","datanasc","saldopunti","puntimensili") VALUES ('wtinPVuFxSjtm8M',6666,5,'samanta','Bianchi','03/21/1965',20.5,45);
INSERT INTO "SM"."famiglia" ("cf","codfam","ncomp","nome","cognome","datanasc","saldopunti","puntimensili") VALUES ('eergvjhygyuhj',7777,5,'matteo','Bianchi','09/21/2010',20.5,45);
INSERT INTO "SM"."famiglia"("cf","codfam","ncomp","nome","cognome","datanasc","saldopunti","puntimensili") VALUES ('wxkkmPnjFxSjirmd',8888,5,'Marco','Bianchi','09/21/2010',20.5,45);
INSERT INTO "SM"."famiglia"("cf","codfam","ncomp","nome","cognome","datanasc","saldopunti","puntimensili") VALUES ('rxpkmPVuFxmjirmo',9999,5,'Giulietta','Bianchi','09/21/2013',20.5,45);
INSERT INTO "SM"."famiglia"("cf","codfam","ncomp","nome","cognome","datanasc","saldopunti","puntimensili") VALUES ('PZpkmPVuFxmjirmo',1010,2,'Mario','Verdi','07/15/1980',25.5,50);
INSERT INTO "SM"."famiglia"("cf","codfam","ncomp","nome","cognome","datanasc","saldopunti","puntimensili") VALUES ('QZpkmPVuFxmjirmo',1111,2,'Giulio','Verdi','09/21/2017',25.5,50);

INSERT INTO "SM"."volontario" ("cf","veicolo","tel","nome","cognome","email","servizio","datanasc","disponibilita","associazione") VALUES ('hhnn56uy','Auto','3494488231','Lucia','Rossi','lucia.rossi@live.no','Appuntamenti','07/12/1980','Mattino','Aiutatutti');
INSERT INTO "SM"."volontario" ("cf","veicolo","tel","nome","cognome","email","servizio","datanasc","disponibilita","associazione") VALUES ('6rytfghg','Auto','3429876544','Maria','Bianchi','bianchi.maria@live.no','Accoglimento clienti','07/11/1985','Pomeriggio','socialita');
INSERT INTO "SM"."volontario" ("cf","veicolo","tel","nome","cognome","email","servizio","datanasc","disponibilita","associazione") VALUES ('876trtfghk','Furgone','3458677665','Simone','Zarr','simone.zarr@live.no','Appuntamenti','03/06/1970','Mattino e pomeriggio','itaiuta');

INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (1,'07/21/2009',2222,384563,4.98,4.20,'hhnn56uy');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (2,'07/21/2022',3333,384560,5.0,2.0,'6rytfghg');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (3,'04/12/2003',4444,384550,3.98,2.20,'876trtfghk');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (4,'03/12/2023',2222,384550,3.98,2.20,'hhnn56uy');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (5,'02/12/2023',3333,384550,3.98,2.20,'6rytfghg');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (6,'01/12/2023',2222,384550,4.98,1.20,'6rytfghg');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (7,'03/12/2023',5555,384550,3.98,2.20,'hhnn56uy');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (8,'02/12/2023',3333,384550,3.98,2.20,'876trtfghk');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (9,'01/12/2023',9999,384550,4.98,1.20,'hhnn56uy');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (10,'07/21/2023',2222,null,null,null,'hhnn56uy');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (11,'06/25/2023',3333,null,null,null,'6rytfghg');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (12,'05/19/2023',4444,null,null,null,'876trtfghk');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (13,'08/12/2023',2222,null,null,null,'hhnn56uy');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (14,'09/12/2023',3333,null,null,null,'6rytfghg');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (15,'06/11/2023',2222,null,null,null,'6rytfghg');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (16,'10/12/2023',5555,null,null,null,'hhnn56uy');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (17,'12/12/2023',3333,null,null,null,'876trtfghk');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (18,'11/10/2023',9999,null,null,null,'hhnn56uy');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (76,'09/12/2023',3333,null,null,null,'6rytfghg');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (47,'06/11/2023',2222,null,null,null,'6rytfghg');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (66,'10/12/2023',5555,null,null,null,'hhnn56uy');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (77,'12/12/2023',3333,null,null,null,'876trtfghk');
INSERT INTO "SM"."appuntamento" ("idapp","dataapp","codfam","spesa","puntiinizio","puntifine","cfvol") VALUES (88,'11/10/2023',9999,null,null,null,'hhnn56uy');

INSERT INTO "SM"."cliente" ("cf","cod","tel","email","dataaut","codfam","nome","cognome","datanasc","nomeente","reddito") VALUES ('yr28rh289',32,8743277,'shfw.juew@gmail.com','02/18/2016 03:34:00',2222,'Samanta','Bianchi','03/21/1965',NULL,7000);
INSERT INTO "SM"."cliente" ("cf","cod","tel","email","dataaut","codfam","nome","cognome","datanasc","nomeente","reddito") VALUES ('wxlkmPVuFxSjim8M',3,4542928847,'jedjwh-fjf@gmail.com','02/18/2016 03:34:00',3333,'Mirco','Bianchi','05/21/1960',NULL,7000);
INSERT INTO "SM"."cliente" ("cf","cod","tel","email","dataaut","codfam","nome","cognome","datanasc","nomeente","reddito") VALUES ('efjiodwjkVuFm8M',31,457352928,'jjfds.rjds@gmail.com','02/20/2017 03:34:00',3333,'luca','Bianchi','05/21/2006',NULL,7000);
INSERT INTO "SM"."cliente" ("cf","cod","tel","email","dataaut","codfam","nome","cognome","datanasc","nomeente","reddito") VALUES ('wxikmPVuFxSjgm8M',39,472894829,'dhuiew.jww@gmail.com','02/18/2016 03:34:00',4444,'Simona','Rossi','07/21/1980',NULL,7000);
INSERT INTO "SM"."cliente" ("cf","cod","tel","email","dataaut","codfam","nome","cognome","datanasc","nomeente","reddito") VALUES ('PZpkmPVuFxmjirmo',26,72427598,'wufjw.ewf@gmail.com','02/18/2018 03:34:00',5555,'Giulio','Verdi','07/15/1980',NULL,8000);
INSERT INTO "SM"."cliente" ("cf","cod","tel","email","dataaut","codfam","nome","cognome","datanasc","nomeente","reddito") VALUES ('23r2PVuFxmjirmo',20,38477923,'grfuw.jrf@gmail.com','02/17/2018 03:24:00',5555,'claudio','Verdi','07/15/2005',NULL,8000);
;
INSERT INTO "SM"."donatore" ("cf","piva","email","tel","tipo","indirizzo") VALUES ('24534tetg','Fa0cf1Ihplq','david.boys@live.no','3494477453','azienda','Via Torino 12, Genova');
INSERT INTO "SM"."donatore" ("cf","piva","email","tel","tipo","indirizzo") VALUES ('3463hbetg3','','Brent.Brady@live.no','3494477553','privato','Via Milano 2, Genova');



INSERT INTO "SM"."importo" ("idoperaz","cifra") VALUES (100,150);
INSERT INTO "SM"."importo" ("idoperaz","cifra") VALUES (101,15);
INSERT INTO "SM"."importo" ("idoperaz","cifra") VALUES (102,125);

INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (500,'Pomodori','Verdura',True,null,'07/15/2023','07/12/2023','07/03/2023','07/04/2023',6.6,2.27);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (501,'Anguria','Verdura',True,False,'07/13/2023','07/12/2023','07/03/2023','07/04/2023',7.6,4.27);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (502,'Insalata','Verdura',True,null,'07/14/2023','07/12/2023','07/03/2023','07/04/2023',8.6,2.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (503,'Pizza surgelata','Cibo',True,False,'03/14/2023','03/12/2023','03/10/2023','03/10/2023',8.6,2.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (504,'Broccoli','Verdura',True,null,'07/14/2023','07/12/2023','07/10/2023','07/10/2023',8.6,2.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (505,'Peperoni','Verdura',True,False,'07/14/2023','07/12/2023','07/10/2023','07/10/2023',8.6,2.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (506,'Focaccia','Cibo',True,null,'03/14/2023','03/12/2023','03/12/2023','03/12/2023',1.6,1.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (507,'Pistacchi','Cibo',True,False,'07/14/2023','07/12/2023','02/12/2023','02/12/2023',3.6,1.40);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (508,'Cioccolata','Dolciumi',False,null,'07/14/2023','07/12/2023','01/12/2023','01/12/2023',3.6,2.50);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (509,'Penne','Farfalle',True,False,'07/14/2023','07/12/2023','01/12/2023','01/12/2023',1.6,0.50);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (510,'Cetrioli','Verdura',True,True,'07/14/2023','07/12/2023','07/10/2023','07/10/2023',8.6,2.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (511,'Ciambella','Dolciumi',True,False,'07/14/2023','07/12/2023','07/10/2023','07/10/2023',8.6,2.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (512,'Schiacciata','Cibo',True,True,'03/14/2023','03/12/2023','03/12/2023','03/12/2023',1.6,1.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (513,'Mandorle','Cibo',True,False,'07/14/2023','07/12/2023','02/12/2023','02/12/2023',3.6,1.40);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (514,'Cioccolato bianco','Dolciumi',False,False,'07/14/2023','07/12/2023','01/12/2023','01/12/2023',3.6,2.50);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (515,'Fusilli','Pasta',True,True,'07/14/2023','07/12/2023','01/12/2023','01/12/2023',1.6,0.50);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (516,'Spaghetti','Pasta',True,True,'07/14/2023','07/12/2023','07/10/2023',null,3.6,2.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (517,'Taglierini','Pasta',True,False,'07/14/2023','07/12/2023','07/10/2023',null,3.6,2.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (518,'Nocciole','Cibo',True,True,'03/14/2023','03/12/2023','03/12/2023',null,1.6,1.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (519,'Plumcake','Dolciumi',True,False,'07/14/2023','07/12/2023','02/12/2023',null,6.6,3.40);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (520,'Curcuma','Spezie',False,False,'07/14/2023','07/12/2023','01/12/2023',null,1.6,0.50);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (521,'Paccheri','Pasta',True,True,'07/14/2023','07/12/2023','01/12/2023',null,3.6,2.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (522,'Spaghetti di soia','Pasta',True,True,'07/14/2023','07/12/2023','07/14/2023','07/14/2023',3.6,2.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (523,'Taglierini integrali','Pasta',True,False,'07/14/2023','07/12/2023','06/14/2023','07/14/2023',3.6,2.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (524,'Ceci','Cibo',True,True,'06/06/2023','03/12/2023','03/12/2023','06/06/2023',1.6,1.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (525,'Cannella','Spezie',False,False,'07/14/2023','07/12/2023','01/12/2023','01/12/2023',1.6,0.50);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (526,'Riso bianco','Riso',True,True,'07/14/2023','07/12/2023','01/12/2023','01/12/2023',3.6,2.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (527,'Riso integrale','Riso',True,True,'07/14/2023','07/12/2023','07/10/2023','07/10/2023',3.6,2.30);
INSERT INTO "SM"."prodotto" ("idprod","nome","tipoprod","deperibile","vendibile","datamassima","scadenza","dataracc","dataacquisto","importo","npunti") VALUES (528,'Riso venere','Riso',True,False,'07/14/2023','07/12/2023','07/10/2023','07/10/2023',3.6,2.30);

-- Inserimento di un prodotto scaduto non ancora acquistato
INSERT INTO prodotto (idProd, nome, tipoProd, vendibile, deperibile, quantità, dataMassima, scadenza, dataRacc, dataAcquisto, importo, nPunti)
VALUES (3, 'Latte', 'Latticini', true, true, 10, '2023-05-19', '2023-05-15', '2019-03-21', null, 3.49, 5);

-- Inserimento di un prodotto deperibile scaduto non ancora acquistato
INSERT INTO prodotto (idProd, nome, tipoProd, vendibile, deperibile, quantità, dataMassima, scadenza, dataRacc, dataAcquisto, importo, nPunti)
VALUES (4, 'Insalata', 'Verdura', true, true, 5, '2023-05-18', '2023-05-16', '2019-03-21', null, 1.99, 3);

-- Inserimento di un prodotto scaduto non vendibile
INSERT INTO prodotto (idProd, nome, tipoProd, vendibile, deperibile, quantità, dataMassima, scadenza, dataRacc, dataAcquisto, importo, nPunti)
VALUES (5, 'Cioccolato', 'Dolci', false, false, 3, '2023-04-30', '2021-05-05', '2019-03-21', null, 2.99, 2);

INSERT INTO prodotto (idProd, nome, tipoProd, vendibile, deperibile, quantità, dataMassima, scadenza, dataRacc, dataAcquisto, importo, nPunti)
VALUES (6, 'lattuga', 'Verdura', true, true, 5, '2023-05-18', '2023-05-16', '2019-03-21', null, 1.99, 3);

INSERT INTO prodotto (idProd, nome, tipoProd, vendibile, deperibile, quantità, dataMassima, scadenza, dataRacc, dataAcquisto, importo, nPunti)
VALUES (7, 'carote', 'Verdura', true, true, 5, '2023-05-18', '2023-05-16', '2019-03-21', null, 1.99, 3);

INSERT INTO prodotto (idProd, nome, tipoProd, vendibile, deperibile, quantità, dataMassima, scadenza, dataRacc, dataAcquisto, importo, nPunti)
VALUES (8, 'cetrioli', 'Verdura', true, true, 5, '2025-05-18', '2025-05-16', '2019-03-21', null, 1.99, 3);

INSERT INTO "SM"."inventario" ("idinv","qta","prodotto") VALUES (78,30,501);
INSERT INTO "SM"."inventario" ("idinv","qta","prodotto") VALUES (93,20,502);

INSERT INTO "SM"."trasporto" ("idtrasp","sederitiro","dataora","ncestelli") VALUES (999,'Rapallo','03/18/2015 02:08:00',30);
INSERT INTO "SM"."trasporto" ("idtrasp","sederitiro","dataora","ncestelli") VALUES (998,'Lavagna','03/18/2015 02:08:00',20);
INSERT INTO "SM"."trasporto" ("idtrasp","sederitiro","dataora","ncestelli") VALUES (997,'Genova','03/18/2015 02:08:00',40);

INSERT INTO "SM"."turno" ("idturno","volontario","orario","data","tiposervizio") VALUES (3,'876trtfghk','9-11','1/02/2008','Appuntamenti');
INSERT INTO "SM"."turno" ("idturno","volontario","orario","data","tiposervizio") VALUES (4,'6rytfghg','14-18','9/07/2008','Accoglienza clienti');
INSERT INTO "SM"."turno" ("idturno","volontario","orario","data","tiposervizio") VALUES (5,'hhnn56uy','9-18','3/01/2008','Appuntamenti');