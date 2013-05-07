--
-- Tabellenstruktur f�r Tabelle Land
--
  CREATE TABLE Land
( laendername           varchar(50) NOT NULL,

  CONSTRAINT pk_laendername PRIMARY KEY(laendername)
);


--
-- Tabellenstruktur f�r Tabelle Ferienwohnung
--
  CREATE TABLE Ferienwohnung
( wohnungsname          varchar(250) NOT NULL,
  groesse               integer NOT NULL,
  preis                 number(6,2) NOT NULL,
  zimmeranzahl          integer NOT NULL,
  strasse               varchar2(50) NOT NULL,
  hausnr                integer NOT NULL,
  plz                   integer NOT NULL,
  laendername           varchar2(50) NOT NULL,
  
  CONSTRAINT pk_wohnungsname PRIMARY KEY(wohnungsname),
  
  CONSTRAINT fk_laendername FOREIGN KEY(laendername) REFERENCES Land(laendername)
);


--
-- Tabellenstruktur f�r Tabelle Kunde
--
  CREATE TABLE Kunde
( anrede                char(1) NOT NULL,
  vorname               varchar2(50) NOT NULL,
  nachname              varchar2(50) NOT NULL, 
  strassenname          integer NOT NULL,
  hausnr                integer NOT NULL,
  plz                   integer NOT NULL,
  ort                   varchar2(50) NOT NULL,
  mailadresse           varchar2(50) NOT NULL,
  passwort              varchar2(50) NOT NULL,
  kreditinstitut        varchar2(50) NOT NULL,
  kontonr               integer NOT NULL,
  blz                   integer NOT NULL,
  land                  varchar2(50) NOT NULL,
  telefonnummer         integer NOT NULL,
  geburtstdatum         date NOT NULL,
  
  CONSTRAINT pk_mailadresse PRIMARY KEY(mailadresse),
  
  CONSTRAINT fk_land FOREIGN KEY(land) REFERENCES Land(laendername),
  
  CONSTRAINT prop_anrede CHECK(anrede = 't' OR anrede = 'f')
);
  
  
--
-- Tabellenstruktur f�r Tabelle Buchung
--
  CREATE TABLE Buchung
( buchungsnr            integer NOT NULL,
  buchungsdatum         date NOT NULL,
  bewertung             integer, 
  von                   date NOT NULL,
  bis                   date NOT NULL,
  zahlungsdatum         date,
  rechnungsnummer       integer,
  wohnungsname          varchar2(50) NOT NULL,
  mailadresse           varchar2(50) NOT NULL,
  
  CONSTRAINT pk_buchungsnr PRIMARY KEY(buchungsnr),
  
  CONSTRAINT fk_wohnungsname FOREIGN KEY(wohnungsname) REFERENCES Ferienwohnung(wohnungsname),
  CONSTRAINT fk_mailadresse FOREIGN KEY(mailadresse) REFERENCES Kunde(mailadresse),
  
  CONSTRAINT prop_bewertung CHECK( 0 < bewertung AND bewertung < 6)
);
  

--
-- Tabellenstruktur f�r Tabelle Bilder
--
  CREATE TABLE Bilder
( pfad                  varchar(250) NOT NULL,
  wohnungsname          varchar(50) NOT NULL,

  CONSTRAINT prop_pfad PRIMARY KEY(pfad),
  
  CONSTRAINT prop_wohnungsname FOREIGN KEY(wohnungsname) REFERENCES Ferienwohnung(wohnungsname)
);


--
-- Tabellenstruktur f�r Tabelle Austattung
--
  CREATE TABLE Ausstattung
( ausstattungsname       varchar(50) NOT NULL,

  CONSTRAINT pk_austattungsname PRIMARY KEY(ausstattungsname)
);


--
-- Tabellenstruktur f�r Tabelle Touristenatraktion
--
  CREATE TABLE Touristenattraktion
( attraktionsname       varchar(50) NOT NULL,
  beschreibung          varchar(2000) NOT NULL,

  CONSTRAINT pk_attraktionsname PRIMARY KEY(attraktionsname)
);


--
-- Tabellenstruktur f�r Tabelle Entfernung
--
  CREATE TABLE Entfernung
( wohnung               varchar(50) NOT NULL,
  attraktion            varchar(50) NOT NULL,
  entfernung            number(6,2) NOT NULL,
  
  CONSTRAINT pk_entfernung PRIMARY KEY (attraktion,wohnung),
  
  CONSTRAINT fk_wohnung FOREIGN KEY(wohnung) REFERENCES Ferienwohnung(wohnungsname),
  CONSTRAINT fk_attraktionsname FOREIGN KEY(attraktion) REFERENCES Touristenattraktion(attraktionsname)
);


--
-- Tabellenstruktur f�r Tabelle hat
--
  CREATE TABLE hat
( wohnungsname               varchar(50) NOT NULL,
  ausstattungsname           varchar(50) NOT NULL,
  
  CONSTRAINT fk1_wohnungsname FOREIGN KEY(wohnungsname) REFERENCES Ferienwohnung(wohnungsname),
  CONSTRAINT fk1_ausstattungsname FOREIGN KEY(ausstattungsname) REFERENCES Ausstattung(ausstattungsname)
);
commit;

