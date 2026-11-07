USE banco;

CREATE TABLE IF NOT EXISTS Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(11) NOT NULL,
    origem VARCHAR(255) NOT NULL,
    preferencias VARCHAR(255) NULL
);

INSERT INTO Cliente (id, nome, CPF, telefone, origem, preferencias) VALUES
(1, 'Ana Souza', '11122233344', '11988880001', 'Instagram', 'Prefere chá'),
(2, 'Beatriz Lima', '55566677788', '11977770002', 'Indicação', 'Só profissionais mulheres');


CREATE TABLE IF NOT EXISTS Categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO Categoria (id, nome) VALUES
(1, 'Faciais'),
(2, 'Corporais'),
(3, 'Injetáveis'),
(4, 'Home Care');

CREATE TABLE IF NOT EXISTS Anamnese (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente INT NOT NULL,
    data DATE NOT NULL,
    gestante ENUM('não', 'sim') NOT NULL,
    marcapasso ENUM('não', 'sim') NOT NULL,
    isotretinoina ENUM('não', 'sim') NOT NULL,
    fototipo VARCHAR(5) NOT NULL,
    FOREIGN KEY (cliente) REFERENCES Cliente(id)
);

INSERT INTO Anamnese (id, cliente, data, gestante, marcapasso, isotretinoina, fototipo) VALUES
(1, 1, '2026-10-01', 'não', 'não', 'não', 'III'),
(2, 2, '2026-10-12', 'sim', 'não', 'não', 'II');

CREATE TABLE IF NOT EXISTS Medida_Corporal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente INT NOT NULL,
    data DATE NOT NULL,
    cintura INT NOT NULL,
    quadril INT NOT NULL,
    coxas INT NOT NULL,
    FOREIGN KEY (cliente) REFERENCES Cliente(id)
);

INSERT INTO Medida_Corporal (id, cliente, data, cintura, quadril, coxas) VALUES
(1, 1, '2026-10-05', 78, 102, 58);

CREATE TABLE IF NOT EXISTS Procedimento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    categoria INT NOT NULL,
    minutos INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    injetavel ENUM('não', 'sim') NOT NULL,
    equipamento ENUM('não', 'sim') NOT NULL,
    FOREIGN KEY (categoria) REFERENCES Categoria(id)
);

INSERT INTO Procedimento (id, nome, categoria, minutos, preco, injetavel, equipamento) VALUES
(1, 'Depilação a laser (axilas)', 2, 30, 150.00, 'não', 'sim'),
(2, 'Toxina botulínica', 3, 30, 900.00, 'sim', 'não'),
(3, 'Drenagem linfática', 2, 60, 120.00, 'não', 'não'),
(4, 'Peeling químico', 1, 45, 250.00, 'não', 'não');
