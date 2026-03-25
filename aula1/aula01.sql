CREATE TABLE Fornecedor
(
    codigo CHAR(10),
    nome VARCHAR(50) NOT NULL,
    cidade VARCHAR(80),
    PRIMARY KEY(codigo)
);

CREATE TABLE peca
(
    codPeca CHAR(10) DEFAULT "XBZ4",
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(100),
    PRIMARY KEY (codPeca)
);

CREATE TABLE Venda
(
    codForn CHAR(10),
    codPeca CHAR(10),
    quantidade INT NOT NULL,
    data DATE NOT NULL,
    PRIMARY KEY (codForn, codPeca),
    FOREIGN KEY (codForn) REFERENCES Fornecedor (codigo) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (codPeca) REFERENCES peca (codPeca) ON DELETE RESTRICT ON UPDATE CASCADE
);
