REM   Script: Projeto BD1
REM   Projeto de BD1

-- Bacia
CREATE TABLE bacia (     
    id_bacia INT NOT NULL,     
    nome VARCHAR(15) NOT NULL,     
    area NUMBER(9,2),     
    perimetro NUMBER(9,2),     
    PRIMARY KEY(id_bacia), 
    CHECK (area > 0),     
    CHECK (perimetro > 0) 
);

-- Posto Pluviométrico
CREATE TABLE posto_pluviometrico (    
    id_posto_pluviometrico INT NOT NULL,    
    nome VARCHAR(30) NOT NULL,    
    rua VARCHAR(30) NOT NULL,    
    numero INT,    
    bairro VARCHAR(15) NOT NULL,    
    municipio VARCHAR(15) NOT NULL,    
    estado CHAR(2),    
    id_bacia INT NOT NULL,    
    PRIMARY KEY(id_posto_pluviometrico),  
    FOREIGN KEY (id_bacia) REFERENCES bacia(id_bacia)    
);

-- Usuário
CREATE TABLE usuario (   
    matricula INT NOT NULL,   
    nome VARCHAR(50) NOT NULL,   
    PRIMARY KEY(matricula)   
);

-- Medição Pluviométrica
CREATE TABLE medicao_pluviometrica (     
    id_medicao INT NOT NULL,     
    data_medicao DATE,     
    valor_chuva_dia1 NUMBER(9,2),      
    valor_chuva_dia2 NUMBER(9,2),      
    valor_chuva_dia3 NUMBER(9,2),      
    valor_chuva_dia4 NUMBER(9,2),      
    valor_chuva_dia5 NUMBER(9,2),      
    valor_chuva_dia6 NUMBER(9,2),      
    valor_chuva_dia7 NUMBER(9,2),      
    valor_chuva_dia8 NUMBER(9,2),      
    valor_chuva_dia9 NUMBER(9,2),      
    valor_chuva_dia10 NUMBER(9,2),      
    valor_chuva_dia11 NUMBER(9,2),      
    valor_chuva_dia12 NUMBER(9,2),      
    valor_chuva_dia13 NUMBER(9,2),      
    valor_chuva_dia14 NUMBER(9,2),      
    valor_chuva_dia15 NUMBER(9,2),      
    valor_chuva_dia16 NUMBER(9,2),      
    valor_chuva_dia17 NUMBER(9,2),      
    valor_chuva_dia18 NUMBER(9,2),      
    valor_chuva_dia19 NUMBER(9,2),      
    valor_chuva_dia20 NUMBER(9,2),      
    valor_chuva_dia21 NUMBER(9,2),      
    valor_chuva_dia22 NUMBER(9,2),      
    valor_chuva_dia23 NUMBER(9,2),      
    valor_chuva_dia24 NUMBER(9,2),      
    valor_chuva_dia25 NUMBER(9,2),      
    valor_chuva_dia26 NUMBER(9,2),      
    valor_chuva_dia27 NUMBER(9,2),      
    valor_chuva_dia28 NUMBER(9,2),      
    valor_chuva_dia29 NUMBER(9,2),      
    valor_chuva_dia30 NUMBER(9,2),      
    valor_chuva_dia31 NUMBER(9,2),     
    id_posto_pluviometrico INT NOT NULL,     
    matricula INT NOT NULL,     
    PRIMARY KEY (id_medicao, matricula),    
    FOREIGN KEY (id_posto_pluviometrico) REFERENCES posto_pluviometrico(id_posto_pluviometrico),     
    FOREIGN KEY (matricula) REFERENCES usuario(matricula)     
);

-- Telefone do Usuario
CREATE TABLE telefone_usuario (    
    matricula INT NOT NULL,    
    numero CHAR(11),    
    PRIMARY KEY(matricula, numero),  
    FOREIGN KEY (matricula) REFERENCES usuario(matricula)    
);

-- Rio
CREATE TABLE rio(
    id_Rio INT NOT NULL,
    nome VARCHAR(30),
    indicativo CHAR, 
    id_Bacia INT NOT NULL,
    PRIMARY KEY(id_Rio, id_Bacia),
    FOREIGN KEY (id_Bacia) REFERENCES bacia(id_Bacia)
    );
    
-- Açude
CREATE TABLE acude(  
    id_Acude INT NOT NULL UNIQUE,  
    nome VARCHAR(30),  
    volume_maximo NUMBER(9,2),  
    comprimento NUMBER(9,2),  
    area NUMBER(9,2),  
    id_Rio INT NOT NULL,
    PRIMARY KEY (id_Acude, id_Rio),
    FOREIGN KEY (id_Rio) REFERENCES rio(id_Rio)
);

-- Medição
CREATE TABLE medicao_cota_diaria(      
    id_medicao_diaria INT NOT NULL,      
    cotaAtual INT NOT NULL,      
    dataMedicao DATE,      
    matricula INT NOT NULL,      
    id_Acude INT NOT NULL,      
    PRIMARY KEY(id_medicao_diaria, matricula, id_Acude),    
    FOREIGN KEY (matricula) REFERENCES usuario(matricula),      
    FOREIGN KEY (id_Acude) REFERENCES acude(id_Acude)      
);

-- Cota Área Volume
CREATE TABLE cota_area_volume (   
    id_area_volume INT NOT NULL,   
    cota NUMBER(9,2),   
    area NUMBER(9,2),    
    volume NUMBER(9,2),   
    id_Acude INT NOT NULL,   
    PRIMARY KEY(id_area_volume, id_acude), 
    FOREIGN KEY(id_Acude) REFERENCES acude(id_Acude)   
);

-- Contribui
CREATE TABLE contribui(    
    id_Acude INT NOT NULL,    
    id_posto_pluviometrico INT NOT NULL,    
    PRIMARY KEY(id_Acude, id_posto_pluviometrico),  
    FOREIGN KEY (id_Acude) REFERENCES acude(id_Acude),    
    FOREIGN KEY (id_posto_pluviometrico) REFERENCES posto_pluviometrico(id_posto_pluviometrico)    
);

-- Estação de Qualidade
CREATE TABLE estacaoDeQualidade(
    id_EstacaoQualidade INT NOT NULL,
    nome VARCHAR(30),
    latitude NUMBER(9,2),
    longitude NUMBER(9,2),
    dataMedicaoRio DATE,
    pHRio NUMBER(9,2),
    DBORio NUMBER(9,2),
    turbidezRio NUMBER(9,2),
    oxigenioRio NUMBER(9,2),
    alcalinidadeRio NUMBER(9,2),
    dataMedicaoAcude DATE,
    pHAcude NUMBER(9,2),
    DBOAcude NUMBER(9,2),
    turbidezAcude NUMBER(9,2),
    oxigenioAcude NUMBER(9,2),
    alcalinidadeAcude NUMBER(9,2),
    id_Rio INT NOT NULL,
    id_Acude INT NOT NULL,
    PRIMARY KEY (id_EstacaoQualidade, id_Rio, id_Acude),
    FOREIGN KEY id_Rio REFERENCES rio(id_Rio),
    FOREIGN KEY id_Acude REFERENCES acude(id_Acude)
    );;

