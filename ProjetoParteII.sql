REM   Script: Projeto BD1
REM   Projeto de BD1

CREATE TABLE bacia(
    idBacia INT NOT NULL,
    nome CHAR,
    area DOUBLE,
    perimetro DOUBLE,
    idPostoPluviometrico INT NOT NULL,
    PRIMARY KEY(idBacia),
    CHECK (area > 0),
    CHECK (perimetro > 0),
    );
    
CREATE TABLE postoPluviometrico(
    idPostoPluviometrico INT NOT NULL,
    nome CHAR NOT NULL,
    rua CHAR NOT NULL,
    numero INT,
    bairro CHAR NOT NULL,
    municipio CHAR NOT NULL,
    estado CHAR(2),
    idBacia INT NOT NULL,
    PRIMARY KEY(idPostoPluviometrico),
    PRIMARY KEY(idBacia),
    CHECK (numero > 0),
    FOREIGN KEY (idBacia) REFERENCES bacia(idBacia)
    );
    
CREATE TABLE medicaoPluviometrica(
    idMedicao INT NOT NULL,
    dataMedicao DATE,
    valor_chuva_dia1 DOUBLE, 
    valor_chuva_dia2 DOUBLE, 
    valor_chuva_dia3 DOUBLE, 
    valor_chuva_dia4 DOUBLE, 
    valor_chuva_dia5 DOUBLE, 
    valor_chuva_dia6 DOUBLE, 
    valor_chuva_dia7 DOUBLE, 
    valor_chuva_dia8 DOUBLE, 
    valor_chuva_dia9 DOUBLE, 
    valor_chuva_dia10 DOUBLE, 
    valor_chuva_dia11 DOUBLE, 
    valor_chuva_dia12 DOUBLE, 
    valor_chuva_dia13 DOUBLE, 
    valor_chuva_dia14 DOUBLE, 
    valor_chuva_dia15 DOUBLE, 
    valor_chuva_dia16 DOUBLE, 
    valor_chuva_dia17 DOUBLE, 
    valor_chuva_dia18 DOUBLE, 
    valor_chuva_dia19 DOUBLE, 
    valor_chuva_dia20 DOUBLE, 
    valor_chuva_dia21 DOUBLE, 
    valor_chuva_dia22 DOUBLE, 
    valor_chuva_dia23 DOUBLE, 
    valor_chuva_dia24 DOUBLE, 
    valor_chuva_dia25 DOUBLE, 
    valor_chuva_dia26 DOUBLE, 
    valor_chuva_dia27 DOUBLE, 
    valor_chuva_dia28 DOUBLE, 
    valor_chuva_dia29 DOUBLE, 
    valor_chuva_dia30 DOUBLE, 
    valor_chuva_dia31 DOUBLE,
    idPostoPluviometrico INT NOT NULL,
    matricula INT NOT NULL,
    PRIMARY KEY(idPostoPluviometrico),
    PRIMARY KEY(idMedicao),
    PRIMARY KEY(matricula),
    FOREIGN KEY (idPostoPluviometrico) REFERENCES postoPluviometrico(idPostoPluviometrico)
    FOREIGN KEY (matricula) REFERENCES usuario(matricula)
    );
    
CREATE TABLE usuario(
    matricula INT NOT NULL,
    nome CHAR NOT NULL,
    PRIMARY KEY(matricula)
    );
    
CREATE TABLE telefoneUsuario(
    matricula INT NOT NULL,
    numero CHAR(11),
    PRIMARY KEY(matricula),
    PRIMARY KEY(numero),
    FOREIGN KEY (matricula) REFERENCES usuario(matricula)
    );
    
CREATE TABLE medicaoCotaDiaria(
    idMedicaoDiaria INT NOT NULL,
    cotaAtual INT NOT NULL,
    dataMedicao DATE,
    matricula INT NOT NULL,
    idAcude INT NOT NULL,
    PRIMARY KEY(matricula),
    PRIMARY KEY(idMedicaoDiaria),
    PRIMARY KEY(idAcude),
    FOREIGN KEY (matricula) REFERENCES usuario(matricula),
    FOREIGN KEY (idAcude) REFERENCES acude(idAcude)
    );
    
CREATE TABLE acude(
    idAcude INT NOT NULL,
    nome CHAR,
    volumeMaximo DOUBLE,
    comprimento DOUBLE,
    area DOUBLE,
    idRio INT NOT NULL,
    PRIMARY KEY(idAcude),
    PRIMARY KEY(idRio),
    FOREIGN KEY (idRio) REFERENCES rio(idRio)
    );
    
CREATE TABLE cota_Area_Volume(
    idAreaVolume INT NOT NULL,
    cota DOUBLE,
    area DOUBLE, 
    volume DOUBLE,
    idAcude INT NOT NULL,
    PRIMARY KEY(idAreaVolume),
    PRIMARY KEY(idAcude),
    FOREIGN KEY(idAcude) REFERENCES acude(idAcude)
    );
    
CREATE TABLE contribui(
    idAcude INT NOT NULL,
    idPostoPluviometrico INT NOT NULL,
    PRIMARY KEY(idAcude),
    PRIMARY KEY(idPostoPluviometrico),
    FOREIGN KEY (idAcude) REFERENCES acude(idAcude),
    FOREIGN KEY (idPostoPluviometrico) REFERENCES postoPluviometrico(idPostoPluviometrico)
    );;

