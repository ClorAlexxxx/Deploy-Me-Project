CREATE TABLE establecimientos (
id_establecimiento SERIAL PRIMARY KEY,
tipo VARCHAR(100),
nombre VARCHAR(150) NOT NULL,
domicilio TEXT NOT NULL,
institucion VARCHAR(150)
);

CREATE TABLE usuarios (
id_usuario SERIAL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
password_hash TEXT NOT NULL,
rol VARCHAR(50) NOT NULL -- admin, medico, enfermero
);

CREATE TABLE medicos(

id_usuario INTEGER UNIQUE NOT NULL REFERENCES usuarios(id_usuario),
id_medico SERIAL PRIMARY KEY,
nombre VARCHAR(150) NOT NULL,
cedula VARCHAR(20) NOT NULL,
firma_medico TEXT NOT NULL
);

CREATE TABLE pacientes (

id_paciente SERIAL PRIMARY KEY,
numero_expediente VARCHAR(50) UNIQUE NOT NULL,
nombre VARCHAR(150) NOT NULL,
sexo VARCHAR(10) NOT NULL,
edad INTEGER,
fecha_nacimiento DATE,
domicilio TEXT

);

CREATE TABLE cie10 (
codigo VARCHAR(10) PRIMARY KEY,
descripcion TEXT NOT NULL
);

CREATE TABLE consultas(

id_establecimiento INTEGER NOT NULL REFERENCES establecimientos(id_establecimiento),
id_consulta SERIAL PRIMARY KEY,
id_paciente INTEGER NOT NULL REFERENCES pacientes(id_paciente),
id_medico INTEGER NOT NULL REFERENCES medicos(id_medico),

fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
hora TIME DEFAULT CURRENT_TIME,

motivo_consulta TEXT,
padecimiento_actual TEXT,

antecedentes_heredofamiliares TEXT,
antecedentes_personales TEXT,
interrogatorio_sistemas TEXT,
resultados_estudios TEXT,

temperatura DECIMAL,
presion_arterial VARCHAR(10),
peso DECIMAL,
frecuencia_cardiaca INTEGER,
frecuencia_respiratoria INTEGER,
talla DECIMAL,

diagnostico TEXT,
codigo_cie10 VARCHAR(10) REFERENCES cie10(codigo),
pronostico TEXT,
plan_terapeutico TEXT,

firma_medico TEXT NOT NULL


);

CREATE TABLE notas_evolucion(

id_nota SERIAL PRIMARY KEY,
id_consulta INTEGER NOT NULL REFERENCES consultas(id_consulta),
fecha DATE,
hora TIME DEFAULT CURRENT_TIME,
resumen_interrogatorio TEXT,
evolucion TEXT,
signos_vitales TEXT,
resultados_estudios TEXT,
diagnostico TEXT,
pronostico TEXT,
tratamiento TEXT,

firma_medico TEXT NOT NULL
);

CREATE TABLE consentimientos (
id SERIAL PRIMARY KEY,
id_paciente INTEGER NOT NULL REFERENCES pacientes(id_paciente),
descripcion TEXT,
fecha DATE,
firma_paciente TEXT NOT NULL,
firma_medico TEXT NOT NULL
);

CREATE TABLE auditoria (
id_auditoria SERIAL PRIMARY KEY,
tabla_afectada VARCHAR(50) NOT NULL,
accion VARCHAR(20) NOT NULL, -- INSERT, UPDATE, DELETE
id_usuario INTEGER NOT NULL REFERENCES usuarios(id_usuario),
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
descripcion TEXT
);
