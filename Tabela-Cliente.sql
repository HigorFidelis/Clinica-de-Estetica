USE banco;

CREATE TABLE IF NOT EXISTS Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(11) NOT NULL,
    origem VARCHAR(255) NOT NULL,
    preferencias VARCHAR(255) NULL
);

INSERT INTO Cliente (nome, CPF, telefone, origem, preferencias)
VALUES ('Higor Fidelis', '24499505000', '11982020866', 'Internet', 'Chá');