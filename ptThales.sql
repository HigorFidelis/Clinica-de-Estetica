--tabela contradicao 
create table Contraindicacao (
id_paciente int(50)not null
procedimento_id int(50)not null
Condicao char(80)not null
tipo char(80)not null
constraint pk_Contraindicacao primary key (id_paciente) --Coloquei o id paciente como pk pq ele se relacciona em diversas tabelas e a unica coisa que não pode ser alterada
);

insert into Contraindicacao ( id_paciente,procedimento_id,Condicao,tipo) values 
(1, 11, 'Gestante', 'Absoluta'),
(2, 11, 'Gestante', 'Absoluta'),
(3, 12, 'Faz uso de remédio controlado isotretinoína', 'Absoluta',);


--tabela pacote
create table Pacote (
Id_pacote int(50) not null
Identificacao do produto char(80)not null
procedimento_id int(50) not null
Qtd_sessoes int(50) not null
Validade_meses int(50) not null 
preco int(50) not null
-- Já nesta segunda tabela eu nao ovu deixar nenhuma condicao com opcao de preenchimento pois uma clinica deve manter a transparencia 
);
insert into Pacote ( Id_pacote,Identificacao do produto,procedimento_id,Qtd_sessoes,Validade_meses,preco)values
(1 'Pacote laser 10 sessoes', 1, 10, 6, 1800);

--tabela produto 
create table Produto (
id_produto int (50) not null
nome char (80) not null 
tipo char (80) not null
preco int (50) not null 
constraint fk_produto foreign key (id_produto)
-- eu coloquei está tabela na condicao de fk pois acredito que ela vai se auto relacionar e se relacioanr com outras coias entao eu optei por deixar desta forma 
);
insert into Produto (id_produto,nome,tipo,preco) values 
( 1 'Hidratante Home Care', 'Cosmético', 120.00),
( 2 'Toxina botulínica 100U', 'Injetável', 900.00):

--tabela vendas 
create table Vendas (
id_produto int (50) not null 
cliente_id int (50) not null 
dt_venda date not null 
total int (50) null 
-- ao inves de eu colocar id vendas eu coloquei id produtopois pelo id do produto é possivel rastrear o que foi vendido e para quem esta condição pretendo deixar como fk 
);
insert into Vendas( id_produto,cliente_id,dt_venda,total)values 
(1, 1, '05/10/2026' 1800),
(2, 2, '12/10/2026' 1200);


 --Item_Venda
 create table Item_venda (
Id int(50) not null 
Vendas_Id int (50) not null 
Tipo char (80) not null 
item_id int (50) not null 
Valor int (50) not null 
Obs_item char (80) null 
constraint fk_Item_Venda foreign key (Vendas_Id) 
-- Na tabela de venda eu deixei a maioria dos itens como obrigatório pois eu a maioria dos itens são nescessários para a transparencia 
 );
insert into Item_venda(Id,Vendas_Id,Tipo,item_id,Valor,Obs_item)values 
( 1, 1, 'Pacote', 1, 1800, 'Pacote 1',),
( 2, 2, 'Avulso', 2, 900, 'Procedimento 2'),
( 3, 2, 'Produto', 1, 120, 'Produto 1');  


