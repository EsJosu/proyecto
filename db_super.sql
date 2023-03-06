drop database if exists db_super;
create database db_super;
use db_super;

create table categoria(
Id_cat int auto_increment primary key not null,
Nombre_cat varchar(20)
);

create table persona(
Id_persona int auto_increment primary key not null,
Nombre varchar (50) not null,
Telefono int not null,
Ci int not null
);

CREATE TABLE clientes (
  Id_cli INT AUTO_INCREMENT PRIMARY KEY,
  Nit int NOT NULL,
  foreign key (Id_cli) references persona(Id_persona)
);

create table empleado(
Id_empleado int auto_increment primary key,
Apellido varchar(20) not null,
Edad int not null,
Direccion varchar(50) not null,
Genero varchar(50) not null,
Cargo varchar(50) not null,
foreign key (Id_empleado) references persona(Id_persona)
);

CREATE TABLE productos (
  Id_prod INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(20) NOT NULL,
  Descripcion VARCHAR(50) NOT NULL,
  Precio DECIMAL(10, 2) NOT NULL,
  Cantidad INT NOT NULL,
  Id_cat int not null,
  foreign key (Id_cat) references categoria (Id_cat)
);

create table login(
	usuario VARCHAR(15) NOT NULL primary key,
    clave VARCHAR(70) NOT NULL,
	Id_persona int NOT NULL,
    estado bit NOT NULL,
    fech_reg TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    foreign key (Id_persona) references persona(Id_persona)
);

CREATE TABLE factura (
  Id_factura INT AUTO_INCREMENT PRIMARY KEY,
  Id_cli INT NOT NULL,
  Id_empleado int not null,
  tipoDocumento set ('NIT','CI','Vacio') not null,
  numDocumento varchar(10) null,
  Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (Id_cli) REFERENCES clientes(Id_cli),
  FOREIGN KEY (Id_empleado) REFERENCES empleado(Id_empleado)
);

CREATE TABLE detalle_factura (
  Id_detalle_fact INT AUTO_INCREMENT PRIMARY KEY,
  Id_factura INT NOT NULL,
  Id_prod INT NOT NULL,
  costoUnitario float not null,
  descripcion varchar(100) not null,
  FOREIGN KEY (Id_factura) REFERENCES factura(Id_factura),
  FOREIGN KEY (Id_prod) REFERENCES productos(Id_prod)
);

insert into categoria(Id_cat,Nombre_cat)
values('1','lacteos'),
('2','bebida analcoholica'),
('3','frutas y verduras'),
('4','panaderia');

insert into persona(Id_persona,Nombre,Telefono,Ci)
values('1','Luis ','72513212','9430300'),
('2','Jose','64539022','9100233'),
('3','Maria ','64178889','9552555'),
('4','Antonia ','64539022','9101122'),
('5','Mario ','75040300','3749003'),
('6','Jessica ','72599401','8829092'),
('7','Jason ','69029776','9227332'),
('8','Pamela ','70283394','8909112'),
('9','Daniela ','641090922','9392700'),
('10','Andres ','61244567','7495506'),
('11','Martha ','641090922','9392700'),
('12','Jorge ','641090922','9392700');

insert into clientes(Id_cli,Nit)
values('1','473950302'),
('2','119203456'),
('3','904835596');

insert into empleado(Id_empleado,Apellido,Edad,Direccion,Genero,Cargo)
values('1','Aguilar Rodriguez',20,'Villa Fatima','Femenino','cajero'),
('2',' Perez Llanos',35,'Obrajes','Masculino','reponedor'),
('3','Paredes Suarez',28,'Calacoto','Femenino','encargada panaderia');

insert into productos(Id_prod,Nombre,Descripcion,Precio,Cantidad,Id_cat)
values('1','Yogurt Pil','Yogurt Frutilla 200gr','8','75','1'),
('2','Leche Delizia','Leche Entera 950ml','6','90','1'),
('3','Coka Quina 2lt','Gaseosa 2 litros','10','55','2'),
('4','Kilo Naranjas','12 Naranjas kilo','9','120','3'),
('5','Queque Platano','Queque Mediano','10','8','4');

insert into login(Usuario,clave,Id_persona,estado) values
('Luar','12','1',1),
('Josepa','12','2',1),
('Mar','12','3',1);

insert into factura(Id_cli,Id_empleado,tipoDocumento,numDocumento,Fecha) values
('1','1','CI','9115622','2023-02-04'),
('2','1','CI','9204226','2023-02-04'),
('3','2','CI','6879541','2023-02-04'),
('1','2','CI','6836877','2023-02-04'),
('1','1','CI','9163698','2023-02-04'),
('2','2','NIT','927485936','2023-02-01');


insert into detalle_factura(Id_factura,Id_prod,costoUnitario,descripcion) values
('1','1','8','compra'),
('2','2','19','compra'),
('3','2','8','compra'),
('4','3','19','compra'),
('5','1','8','compra'),
('6','2','19','compra'),
('6','2','19','compra');

/*reporte productos mas solicitudes*/
select productos.Id_prod,productos.Nombre, detalle_factura.Id_prod, count(detalle_factura.Id_prod)as Vendidos from
productos,detalle_factura where
productos.Id_prod = detalle_factura.Id_prod
group by detalle_factura.Id_prod order by (vendidos)desc
