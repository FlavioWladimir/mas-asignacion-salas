# MAS - Modelo de Asignación de Salas

## 📌 Descripción del Proyecto

**MAS - Modelo de Asignación de Salas** es un sistema web diseñado para automatizar y optimizar el proceso de gestión, solicitud y asignación de espacios físicos en una universidad.

## 👥 Perfiles de Usuario

| Perfil | Funcionalidades |
|--------|-----------------|
| **Administrador** | Gestionar salas, usuarios, bloques horarios, aprobar/rechazar solicitudes |
| **Docente/Solicitante** | Visualizar programación, solicitar reservas, ver estado de solicitudes |

## 🗄️ Base de Datos

### Modelo Relacional
- **SGBD:** MySQL 8.0
- **Tablas:** 6 tablas interrelacionadas
  - `usuarios`
  - `tipos_sala`
  - `salas`
  - `bloques_horarios`
  - `solicitudes`
  - `asignaciones`
- **Normalización:** Tercera Forma Normal (3FN)

### Diagrama Entidad-Relación (DER)
![DER](docs/DER_MAS.png)

### Diagrama de Casos de Uso
![Casos de Uso](docs/CasosUso_MAS.png)

### Árbol Funcional de Navegación
![Árbol Funcional](docs/ArbolFuncional_MAS.png)

### Diagrama de Arquitectura
![Arquitectura](docs/Arquitectura_MAS.png)

## 📱 Prototipos de Interfaz

### Pantalla 1: Inicio de Sesión (Login)
![Login](docs/Inicio_de_Sesion.png)

### Pantalla 2: Programación
![Programación](docs/Programacion.png)

### Pantalla 3: Solicitar Reserva
![Solicitar Reserva](docs/Solicitar_Reserva.png)

### Pantalla 4: Gestión de Solicitudes (Admin)
![Gestión de Solicitudes](docs/Gestion_de_Solicitudes.png)

### Pantalla 5: Administración de Salas
![Administración de Salas](docs/Administracion_de_Salas.png)

## 🏗️ Arquitectura del Sistema

### Arquitectura Cliente-Servidor de 3 Capas

| Capa | Tecnología | Versión |
|------|------------|---------|
| **Presentación** | HTML5, CSS3, JavaScript | Estándares actuales |
| **Negocio** | PHP | 8.0 |
| **Datos** | MySQL | 8.0 |

### Patrón de Diseño
El sistema utiliza el patrón **MVC (Modelo-Vista-Controlador)**

## 📂 Estructura del Proyecto
