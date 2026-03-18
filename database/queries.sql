-- =========================================
-- QUERIES PRINCIPALES - EXPEDIENTE CLÍNICO
-- =========================================


-- =========================================
-- 1. PACIENTES
-- =========================================

-- 🔹 Crear paciente
INSERT INTO pacientes (
    numero_expediente,
    nombre,
    sexo,
    edad,
    fecha_nacimiento,
    domicilio
)
VALUES ($1, $2, $3, $4, $5, $6);


-- 🔹 Obtener todos los pacientes
SELECT * FROM pacientes;


-- 🔹 Obtener paciente por ID
SELECT * FROM pacientes
WHERE id_paciente = $1;


-- 🔹 Buscar paciente por nombre
SELECT * FROM pacientes
WHERE nombre ILIKE '%' || $1 || '%';


-- 🔹 Actualizar paciente
UPDATE pacientes
SET nombre = $1,
    sexo = $2,
    edad = $3,
    domicilio = $4
WHERE id_paciente = $5;


-- =========================================
-- 2. USUARIOS / LOGIN
-- =========================================

-- 🔹 Obtener usuario por email (login)
SELECT * FROM usuarios
WHERE email = $1;


-- 🔹 Crear usuario
INSERT INTO usuarios (nombre, email, password_hash, rol)
VALUES ($1, $2, $3, $4);


-- =========================================
-- 3. MÉDICOS
-- =========================================

-- 🔹 Obtener médico por usuario
SELECT * FROM medicos
WHERE id_usuario = $1;


-- =========================================
-- 4. CIE-10
-- =========================================

-- 🔹 Buscar diagnóstico
SELECT * FROM cie10
WHERE descripcion ILIKE '%' || $1 || '%';


-- =========================================
-- 5. CONSULTAS (HISTORIA CLÍNICA)
-- =========================================

-- 🔹 Crear consulta
INSERT INTO consultas (
    id_establecimiento,
    id_paciente,
    id_medico,
    fecha,
    hora,
    motivo_consulta,
    padecimiento_actual,
    antecedentes_heredofamiliares,
    antecedentes_personales,
    interrogatorio_sistemas,
    temperatura,
    tension_arterial,
    frecuencia_cardiaca,
    frecuencia_respiratoria,
    peso,
    talla,
    exploracion_fisica,
    resultados_estudios,
    diagnostico,
    codigo_cie10,
    pronostico,
    plan_terapeutico,
    firma_medico
)
VALUES (
    $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,
    $11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23
);


-- 🔹 Obtener consultas por paciente
SELECT * FROM consultas
WHERE id_paciente = $1;


-- =========================================
-- 6. EXPEDIENTE CLÍNICO COMPLETO (CLAVE 🔥)
-- =========================================

SELECT 
    p.numero_expediente,
    p.nombre AS paciente,
    p.sexo,
    p.edad,
    p.fecha_nacimiento,
    p.domicilio,

    c.fecha,
    c.hora,
    c.motivo_consulta,
    c.padecimiento_actual,
    c.diagnostico,
    c.pronostico,
    c.plan_terapeutico,

    c.temperatura,
    c.tension_arterial,
    c.frecuencia_cardiaca,
    c.frecuencia_respiratoria,
    c.peso,
    c.talla,

    m.nombre AS medico,
    m.cedula,

    e.nombre AS establecimiento

FROM pacientes p
JOIN consultas c ON p.id_paciente = c.id_paciente
JOIN medicos m ON c.id_medico = m.id_medico
JOIN establecimientos e ON c.id_establecimiento = e.id_establecimiento

WHERE p.id_paciente = $1;


-- =========================================
-- 7. NOTAS DE EVOLUCIÓN
-- =========================================

-- 🔹 Crear nota de evolución
INSERT INTO notas_evolucion (
    id_consulta,
    fecha,
    evolucion,
    signos_vitales,
    resultados_estudios,
    diagnostico,
    pronostico,
    tratamiento
)
VALUES ($1,$2,$3,$4,$5,$6,$7,$8);


-- 🔹 Obtener evolución por consulta
SELECT * FROM notas_evolucion
WHERE id_consulta = $1;


-- =========================================
-- 8. CONSENTIMIENTO INFORMADO
-- =========================================

INSERT INTO consentimientos (
    id_paciente,
    descripcion,
    fecha,
    firma_paciente,
    firma_medico
)
VALUES ($1,$2,$3,$4,$5);


-- =========================================
-- 9. AUDITORÍA
-- =========================================

INSERT INTO auditoria (
    tabla_afectada,
    accion,
    usuario_id,
    descripcion
)
VALUES ($1,$2,$3,$4);