-- Creación de la base de datos
CREATE DATABASE CoworkingDB;
USE CoworkingDB;

-- Creación de tablas clientes 
CREATE TABLE Clientes (
cliente_id INT auto_increment PRIMARY KEY, -- Identificador único de cliente
nombre VARCHAR(50) NOT NULL, -- Nombre del cliente
apellido VARCHAR(50) NOT NULL, -- Apellido del cliente
email VARCHAR(100) UNIQUE NOT NULL, -- Correo electrónico del cliente
telefono VARCHAR(15), -- Número de teléfono del cliente
tipo_cliente ENUM('individual', 'empresa') NOT NULL DEFAULT 'individual' -- Tipo de cliente
);

-- Creación de planes
CREATE TABLE Planes (
plan_id INT auto_increment PRIMARY KEY,  -- Identificador único del plan
nombre_plan VARCHAR(50) NOT NULL,  -- Nombre del plan
precio_mensual DECIMAL(10,2) NOT NULL,  -- Precio mensual del plan
descripcion TEXT  -- Descripción del plan
);


-- Creación de planes activos
CREATE TABLE Planes_activos (
pago_id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de pago
cliente_id INT NOT NULL, -- Referencia al cliente 
plan_id INT NOT NULL, -- Referencia al plan
status BOOLEAN DEFAULT TRUE, -- Indica si el plan esta activo 
fecha_alta DATE NOT NULL, -- Fecha de pago del plan
fecha_baja DATE NOT NULL, -- Fecha de vencimiento del plan
FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
FOREIGN KEY (plan_id) REFERENCES Planes(plan_id)
);


-- Creación de asistencias
CREATE TABLE Asistencias (
asistencias_id INT auto_increment PRIMARY KEY, -- Identificador único de asistencia
cliente_id INT NOT NULL, -- Referencia al cliente 
fecha_asistencia DATE NOT NULL, -- Fecha de asistencia
FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);


-- Creación de salas de reuniones
CREATE TABLE Salas_de_reuniones (
sala_id INT auto_increment PRIMARY KEY, -- Identificador único de la sala 
nombre_sala VARCHAR(100) NOT NULL, -- Nombre de la sala
capacidad INT NOT NULL, -- Capacidad máxima de la sala 
precio_sala_hora DECIMAL(10,2) NOT NULL, -- Precio por hora de la sala 
piso VARCHAR(50) NOT NULL -- Unicación de la sala por piso 
);


-- Creación de reserva de las salas
CREATE TABLE Reserva_de_las_salas (
consumo_id INT auto_increment PRIMARY KEY, -- Identificador único del consumo
cliente_id INT NOT NULL, -- Referencia al cliente
sala_id INT NOT NULL, -- Referencia a la sala 
reserva_horas INT NOT NULL, -- Cantidad de horas reservadas 
reserva_fecha DATE, -- Fecha de la reserva 
FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
FOREIGN KEY (sala_id) REFERENCES Salas_de_reuniones(sala_id)
);

