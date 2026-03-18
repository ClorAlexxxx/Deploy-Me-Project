CREATE TABLE usuarios (
id_usuario SERIAL PRIMARY KEY,
nombre VARCHAR(100),
email VARCHAR(100) UNIQUE NOT NULL,
password_hash TEXT NOT NULL,
rol VARCHAR(50) -- admin, medico, enfermero
);

CREATE TABLE establecimientos (
id_establecimiento SERIAL PRIMARY KEY,
tipo VARCHAR(100),
nombre VARCHAR(150) NOT NULL,
domicilio TEXT NOT NULL,
institucion VARCHAR(150)
);

CREATE TABLE pacientes (

id_paciente SERIAL PRIMARY KEY,
numero_expediente VARCHAR(50) UNIQUE,
nombre VARCHAR(150) NOT NULL,
sexo VARCHAR(10) NOT NULL,
edad INTEGER,
fecha_nacimiento DATE,
domicilio TEXT

);

CREATE TABLE medicos(

id_usuario INTEGER REFERENCES usuarios(id_usuario),
id_medico SERIAL PRIMARY KEY,
nombre VARCHAR(150) NOT NULL,
cedula VARCHAR(20) NOT NULL,
firma_medico TEXT NOT NULL
);

CREATE TABLE consultas(

id_establecimiento INTEGER REFERENCES establecimientos(id_establecimiento),
id_consulta SERIAL PRIMARY KEY,
id_paciente INTEGER REFERENCES pacientes(id_paciente),
id_medico INTEGER REFERENCES medicos(id_medico),

motivo_consulta TEXT,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

antecedentes_heredofamiliares TEXT,
antecedentes_personales TEXT,
padecimiento_actual TEXT,
interrogatorio_sistemas TEXT,

temperatura DECIMAL,
presion_arterial VARCHAR(10),
peso DECIMAL,
frecuencia_cardiaca INTEGER,
frecuencia_respiratoria INTEGER,
talla DECIMAL,

diagnostico TEXT,
codigo_cie10 VARCHAR(10) REFERENCES cie10(codigo),
pronostico TEXT,
plan_terapeutico TEXT

);

CREATE TABLE notas_evolucion(

id_nota SERIAL PRIMARY KEY,
id_consulta INTEGER REFERENCES consultas(id_consulta),
fecha DATE,
evolucion TEXT,
signos_vitales TEXT,
diagnostico TEXT,
tratamiento TEXT

);

CREATE TABLE cie10 (
codigo VARCHAR(10) PRIMARY KEY,
descripcion TEXT NOT NULL
);

CREATE TABLE auditoria (
id_auditoria SERIAL PRIMARY KEY,
tabla_afectada VARCHAR(50),
accion VARCHAR(20), -- INSERT, UPDATE, DELETE
usuario_id INTEGER,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
descripcion TEXT
);
