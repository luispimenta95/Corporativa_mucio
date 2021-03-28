create table administrador (
idAdministrador int auto_increment not null primary key,
nomeAdministrador varchar(255),
cpfAdministrador varchar(11) unique,
emailAdministrador varchar(255),
senhaAdministrador varchar(255)  default '12345',
ativo boolean default 1, 
telefoneAdministrador varchar(255),
dataCadastro timestamp,
administradorMaster boolean default 0
    );
    create table tipoCliente(
        idTipoCliente int auto_increment not null primary key,
        nomeTipoCliente varchar(255)
    );

create table estado(
      idEstado int auto_increment not null primary key,
      ufEstado varchar(2),
      nomeEstado varchar(35)
  );

create table cidade(
      idCidade int auto_increment not null primary key,
      estado int,
      nomeCidade varchar(50),
      precoFrete float,
      entrega boolean default 0,
  );

create table cliente (
idCliente int auto_increment not null primary key,
nomeCliente varchar(255),
cpf_cnpj varchar(16) unique,
emailCliente varchar(255),
senhaCliente varchar(255)  default '12345',
ativo boolean default 1, 
telefoneCliente varchar(255),
dataCadastro timestamp,
primeiroAcesso boolean default 1,
tipoCliente int,
enderecoCliente varchar(200),
cidade int,
foreign key(cidade) references cidade (idCidade) ON update cascade on delete restrict,

foreign key(tipoCliente) references tipoCliente (idTipoCliente) ON update cascade on delete restrict

    );

create table produto (
idProduto int auto_increment not null primary key,
nomeProduto varchar(255),
codigo int,
imagem varchar(255),
ativo boolean default 1, 
unidade varchar(25),
precoAtacado float,
precoDelivery float,
estoque int default 0,
dataCadastro timestamp

    );
        
create table pedido (
idPedido int auto_increment not null primary key,
dataPedido timestamp,
quantidade int,
preco float,
cliente int,
produto int,
codPedido varchar(10),
precoFrete float,

pedidoFinalizado boolean default 0,
foreign key(cliente) references cliente (idCliente) ON update cascade on delete restrict,
foreign key(produto) references produto (idProduto) ON update cascade on delete restrict

    );
        