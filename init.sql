-- init.sql: runs only on first container startup
CREATE DATABASE ejemplo;
CREATE USER estudiante WITH ENCRYPTED PASSWORD 'estudiante123';
GRANT ALL PRIVILEGES ON DATABASE ejemplo TO estudiante;
\connect ejemplo
CREATE TABLE personas (
  id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL,
  correo TEXT UNIQUE NOT NULL
);
INSERT INTO personas (nombre, correo) VALUES
  ('Ana', 'ana@example.com'),
  ('Luis', 'luis@example.com');
