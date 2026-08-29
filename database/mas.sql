-- ============================================
-- MAS - Modelo de Asignación de Salas
-- Base de Datos
-- ============================================

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS mas;
USE mas;

-- ============================================
-- 1. Tabla: usuarios
-- ============================================
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    rut VARCHAR(12) UNIQUE NOT NULL,
    nombre_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    rol ENUM('administrador', 'docente') DEFAULT 'docente',
    estado ENUM('activo', 'inactivo') DEFAULT 'activo',
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- 2. Tabla: tipos_sala
-- ============================================
CREATE TABLE tipos_sala (
    id_tipo_sala INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo VARCHAR(50) NOT NULL,
    descripcion TEXT
);

-- ============================================
-- 3. Tabla: salas
-- ============================================
CREATE TABLE salas (
    id_sala INT AUTO_INCREMENT PRIMARY KEY,
    codigo_sala VARCHAR(10) UNIQUE NOT NULL,
    nombre_sala VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL,
    id_tipo_sala INT,
    estado ENUM('disponible', 'mantencion') DEFAULT 'disponible',
    ubicacion VARCHAR(100),
    descripcion TEXT,
    FOREIGN KEY (id_tipo_sala) REFERENCES tipos_sala(id_tipo_sala)
);

-- ============================================
-- 4. Tabla: bloques_horarios
-- ============================================
CREATE TABLE bloques_horarios (
    id_bloque INT AUTO_INCREMENT PRIMARY KEY,
    numero_bloque INT NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    dia_semana ENUM('lunes','martes','miercoles','jueves','viernes') NOT NULL
);

-- ============================================
-- 5. Tabla: solicitudes
-- ============================================
CREATE TABLE solicitudes (
    id_solicitud INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario_solicitante INT NOT NULL,
    id_sala INT NOT NULL,
    id_bloque_inicio INT NOT NULL,
    id_bloque_fin INT NOT NULL,
    fecha_solicitud TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_reserva DATE NOT NULL,
    motivo TEXT NOT NULL,
    estado ENUM('pendiente','aprobada','rechazada') DEFAULT 'pendiente',
    comentarios TEXT,
    FOREIGN KEY (id_usuario_solicitante) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_sala) REFERENCES salas(id_sala),
    FOREIGN KEY (id_bloque_inicio) REFERENCES bloques_horarios(id_bloque),
    FOREIGN KEY (id_bloque_fin) REFERENCES bloques_horarios(id_bloque)
);

-- ============================================
-- 6. Tabla: asignaciones
-- ============================================
CREATE TABLE asignaciones (
    id_asignacion INT AUTO_INCREMENT PRIMARY KEY,
    id_solicitud INT NOT NULL,
    id_usuario_aprobador INT NOT NULL,
    id_sala INT NOT NULL,
    id_bloque_inicio INT NOT NULL,
    id_bloque_fin INT NOT NULL,
    fecha_reserva DATE NOT NULL,
    fecha_asignacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('activa','cancelada') DEFAULT 'activa',
    FOREIGN KEY (id_solicitud) REFERENCES solicitudes(id_solicitud),
    FOREIGN KEY (id_usuario_aprobador) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_sala) REFERENCES salas(id_sala),
    FOREIGN KEY (id_bloque_inicio) REFERENCES bloques_horarios(id_bloque),
    FOREIGN KEY (id_bloque_fin) REFERENCES bloques_horarios(id_bloque)
);

-- ============================================
-- Datos de Prueba
-- ============================================

-- Tipos de Sala
INSERT INTO tipos_sala (nombre_tipo, descripcion) VALUES
('Aula', 'Sala de clases estándar con pizarra y proyector'),
('Laboratorio', 'Sala equipada con computadores y software especializado'),
('Auditorio', 'Sala de grandes dimensiones para eventos y conferencias'),
('Sala de Reuniones', 'Sala pequeña para reuniones de trabajo');

-- Usuario Administrador (contraseña: admin123)
INSERT INTO usuarios (rut, nombre_completo, email, contrasena, rol) VALUES
('11111111-1', 'Administrador MAS', 'admin@mas.cl', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'administrador');

-- Usuario Docente (contraseña: docente123)
INSERT INTO usuarios (rut, nombre_completo, email, contrasena, rol) VALUES
('22222222-2', 'Docente Ejemplo', 'docente@mas.cl', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'docente');

-- Salas de Ejemplo
INSERT INTO salas (codigo_sala, nombre_sala, capacidad, id_tipo_sala, ubicacion) VALUES
('A001', 'Aula 1', 40, 1, 'Edificio A, Piso 1'),
('A002', 'Aula 2', 35, 1, 'Edificio A, Piso 1'),
('A003', 'Aula 3', 45, 1, 'Edificio A, Piso 2'),
('B001', 'Laboratorio de Informática', 25, 2, 'Edificio B, Piso 1'),
('B002', 'Laboratorio de Redes', 20, 2, 'Edificio B, Piso 2'),
('C001', 'Auditorio Central', 150, 3, 'Edificio C, Piso 1'),
('D001', 'Sala de Reuniones', 12, 4, 'Edificio D, Piso 1');