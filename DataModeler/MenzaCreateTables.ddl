CREATE TABLE adresa (
    idadr             INTEGER NOT NULL,
    ulica             VARCHAR2(30 CHAR),
    broj              VARCHAR2(30 CHAR),
    grad_idgrd        INTEGER NOT NULL,
    grad_drzava_iddrz INTEGER NOT NULL
);

ALTER TABLE adresa ADD CONSTRAINT adresa_pk PRIMARY KEY ( idadr );

CREATE TABLE dostavljachrane (
    iddos     INTEGER NOT NULL,
    nazivdost VARCHAR2(30 CHAR)
);

ALTER TABLE dostavljachrane ADD CONSTRAINT dostavljachrane_pk PRIMARY KEY ( iddos );

CREATE TABLE drzava (
    iddrz  INTEGER NOT NULL,
    nazdrz VARCHAR2(30 CHAR),
    pozdrz VARCHAR2(30 CHAR)
);

ALTER TABLE drzava ADD CONSTRAINT drzava_pk PRIMARY KEY ( iddrz );

CREATE TABLE fakultet (
    idfak             INTEGER NOT NULL,
    nazfak            VARCHAR2(30 CHAR),
    adresa_idadr      INTEGER NOT NULL,
    univerzitet_iduni INTEGER
);

ALTER TABLE fakultet ADD CONSTRAINT fakultet_pk PRIMARY KEY ( idfak );

CREATE TABLE grad (
    idgrd        INTEGER NOT NULL,
    nazgrd       VARCHAR2(30 CHAR),
    posbr        VARCHAR2(30 CHAR),
    drzava_iddrz INTEGER NOT NULL
);

ALTER TABLE grad ADD CONSTRAINT grad_pk PRIMARY KEY ( idgrd,
                                                      drzava_iddrz );

CREATE TABLE hrana (
    idhran  INTEGER NOT NULL,
    nazhran VARCHAR2(30 CHAR),
    kolhran INTEGER
);

ALTER TABLE hrana ADD CONSTRAINT hrana_pk PRIMARY KEY ( idhran );

CREATE TABLE hranaunar (
    narudzbina_idnar INTEGER NOT NULL,
    hrana_idhran     INTEGER NOT NULL
);

ALTER TABLE hranaunar ADD CONSTRAINT hranaunar_pk PRIMARY KEY ( narudzbina_idnar,
                                                                hrana_idhran );

CREATE TABLE kuvar (
    idosb              INTEGER NOT NULL,
    ime                VARCHAR2(30 CHAR),
    prz                VARCHAR2(30 CHAR),
    jmbg               VARCHAR2(13 CHAR),
    datrodj            DATE,
    adresa_idadr       INTEGER NOT NULL,
    plata              INTEGER,
    tipkuvara_idtipkuv INTEGER NOT NULL,
    kuvar_idosb        INTEGER,
    restoran_idres     INTEGER
);

ALTER TABLE kuvar ADD CONSTRAINT kuvar_pk PRIMARY KEY ( idosb );

CREATE TABLE menadzer (
    idosb        INTEGER NOT NULL,
    ime          VARCHAR2(30 CHAR),
    prz          VARCHAR2(30 CHAR),
    jmbg         VARCHAR2(13 CHAR),
    datrodj      DATE,
    adresa_idadr INTEGER NOT NULL,
    email        VARCHAR2(30 CHAR)
);

ALTER TABLE menadzer ADD CONSTRAINT menadzer_pk PRIMARY KEY ( idosb );

CREATE TABLE narudzbina (
    idnar                   INTEGER NOT NULL,
    datumzakad              DATE,
    dostavljachrane_iddos   INTEGER NOT NULL,
    upravlja_restoran_idres INTEGER NOT NULL,
    upravlja_menadzer_idosb INTEGER NOT NULL
);

ALTER TABLE narudzbina ADD CONSTRAINT narudzbina_pk PRIMARY KEY ( idnar );

CREATE TABLE portir (
    idosb          INTEGER NOT NULL,
    ime            VARCHAR2(30 CHAR),
    prz            VARCHAR2(30 CHAR),
    jmbg           VARCHAR2(13 CHAR),
    datrodj        DATE,
    adresa_idadr   INTEGER NOT NULL,
    brlic          VARCHAR2(30 CHAR),
    restoran_idres INTEGER
);

ALTER TABLE portir ADD CONSTRAINT portir_pk PRIMARY KEY ( idosb );

CREATE TABLE restoran (
    idres        INTEGER NOT NULL,
    nazres       VARCHAR2(30 CHAR),
    povres       INTEGER,
    adresa_idadr INTEGER NOT NULL
);

ALTER TABLE restoran ADD CONSTRAINT restoran_pk PRIMARY KEY ( idres );

CREATE TABLE student (
    idosb          INTEGER NOT NULL,
    ime            VARCHAR2(30 CHAR),
    prz            VARCHAR2(30 CHAR),
    jmbg           VARCHAR2(13 CHAR),
    datrodj        DATE,
    adresa_idadr   INTEGER NOT NULL,
    indeks         VARCHAR2(30 CHAR),
    fakultet_idfak INTEGER NOT NULL
);

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( idosb );

CREATE TABLE studentskakartica (
    idstudk       INTEGER NOT NULL,
    brdor         INTEGER,
    brruc         INTEGER,
    brvec         INTEGER,
    stanrac       INTEGER,
    datprav       DATE,
    datvaz        DATE,
    student_idosb INTEGER NOT NULL
);

CREATE UNIQUE INDEX stundetskakartica__idx ON
    studentskakartica (
        student_idosb
    ASC );

ALTER TABLE studentskakartica ADD CONSTRAINT stundetskakartica_pk PRIMARY KEY ( idstudk );

CREATE TABLE tipkuvara (
    idtipkuv INTEGER NOT NULL,
    naztip   VARCHAR2(30 CHAR)
);

ALTER TABLE tipkuvara ADD CONSTRAINT tipkuvara_pk PRIMARY KEY ( idtipkuv );

CREATE TABLE univerzitet (
    iduni  INTEGER NOT NULL,
    nazuni VARCHAR2(30 CHAR)
);

ALTER TABLE univerzitet ADD CONSTRAINT univerzitet_pk PRIMARY KEY ( iduni );

CREATE TABLE upravlja (
    restoran_idres INTEGER NOT NULL,
    menadzer_idosb INTEGER NOT NULL
);

ALTER TABLE upravlja ADD CONSTRAINT upravlja_pk PRIMARY KEY ( restoran_idres,
                                                              menadzer_idosb );

ALTER TABLE adresa
    ADD CONSTRAINT adresa_grad_fk FOREIGN KEY ( grad_idgrd,
                                                grad_drzava_iddrz )
        REFERENCES grad ( idgrd,
                          drzava_iddrz );

ALTER TABLE fakultet
    ADD CONSTRAINT fakultet_adresa_fk FOREIGN KEY ( adresa_idadr )
        REFERENCES adresa ( idadr );

ALTER TABLE fakultet
    ADD CONSTRAINT fakultet_univerzitet_fk FOREIGN KEY ( univerzitet_iduni )
        REFERENCES univerzitet ( iduni );

ALTER TABLE grad
    ADD CONSTRAINT grad_drzava_fk FOREIGN KEY ( drzava_iddrz )
        REFERENCES drzava ( iddrz );

ALTER TABLE hranaunar
    ADD CONSTRAINT hranaunar_hrana_fk FOREIGN KEY ( hrana_idhran )
        REFERENCES hrana ( idhran );

ALTER TABLE hranaunar
    ADD CONSTRAINT hranaunar_narudzbina_fk FOREIGN KEY ( narudzbina_idnar )
        REFERENCES narudzbina ( idnar );

ALTER TABLE kuvar
    ADD CONSTRAINT kuvar_adresa_fk FOREIGN KEY ( adresa_idadr )
        REFERENCES adresa ( idadr );

ALTER TABLE kuvar
    ADD CONSTRAINT kuvar_kuvar_fk FOREIGN KEY ( kuvar_idosb )
        REFERENCES kuvar ( idosb );

ALTER TABLE kuvar
    ADD CONSTRAINT kuvar_restoran_fk FOREIGN KEY ( restoran_idres )
        REFERENCES restoran ( idres );

ALTER TABLE kuvar
    ADD CONSTRAINT kuvar_tipkuvara_fk FOREIGN KEY ( tipkuvara_idtipkuv )
        REFERENCES tipkuvara ( idtipkuv );

ALTER TABLE menadzer
    ADD CONSTRAINT menadzer_adresa_fk FOREIGN KEY ( adresa_idadr )
        REFERENCES adresa ( idadr );

ALTER TABLE narudzbina
    ADD CONSTRAINT narudzbina_dostavljachrane_fk FOREIGN KEY ( dostavljachrane_iddos )
        REFERENCES dostavljachrane ( iddos );

ALTER TABLE narudzbina
    ADD CONSTRAINT narudzbina_upravlja_fk FOREIGN KEY ( upravlja_restoran_idres,
                                                        upravlja_menadzer_idosb )
        REFERENCES upravlja ( restoran_idres,
                              menadzer_idosb );

ALTER TABLE portir
    ADD CONSTRAINT portir_adresa_fk FOREIGN KEY ( adresa_idadr )
        REFERENCES adresa ( idadr );

ALTER TABLE portir
    ADD CONSTRAINT portir_restoran_fk FOREIGN KEY ( restoran_idres )
        REFERENCES restoran ( idres );

ALTER TABLE restoran
    ADD CONSTRAINT restoran_adresa_fk FOREIGN KEY ( adresa_idadr )
        REFERENCES adresa ( idadr );

ALTER TABLE student
    ADD CONSTRAINT student_adresa_fk FOREIGN KEY ( adresa_idadr )
        REFERENCES adresa ( idadr );

ALTER TABLE student
    ADD CONSTRAINT student_fakultet_fk FOREIGN KEY ( fakultet_idfak )
        REFERENCES fakultet ( idfak );

ALTER TABLE studentskakartica
    ADD CONSTRAINT studentskakartica_student_fk FOREIGN KEY ( student_idosb )
        REFERENCES student ( idosb );

ALTER TABLE upravlja
    ADD CONSTRAINT upravlja_menadzer_fk FOREIGN KEY ( menadzer_idosb )
        REFERENCES menadzer ( idosb );

ALTER TABLE upravlja
    ADD CONSTRAINT upravlja_restoran_fk FOREIGN KEY ( restoran_idres )
        REFERENCES restoran ( idres );