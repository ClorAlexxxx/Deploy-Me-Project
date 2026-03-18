-- =========================================
-- SEED DATA - EXPEDIENTE CLÍNICO (PROTO)
-- =========================================

-- 🔴 IMPORTANTE: ORDEN DE INSERCIÓN
-- 1. establecimientos
-- 2. usuarios
-- 3. medicos
-- 4. pacientes
-- 5. cie10
-- 6. consultas
-- 7. notas_evolucion
-- 8. consentimientos
-- 9. auditoria


-- =========================================
-- 1. ESTABLECIMIENTO
-- =========================================
INSERT INTO establecimientos (tipo, nombre, domicilio, institucion)
VALUES (
    'Clínica',
    'AGEMED Prototipo',
    'Mérida, Yucatán',
    'AGEMED'
);


-- =========================================
-- 2. USUARIO (password ya hasheado ejemplo)
-- =========================================
INSERT INTO usuarios (nombre, email, password_hash, rol)
VALUES (
    'Administrador',
    'admin@agemed.com',
    '$2b$12$EjemploHashSeguro1234567890',
    'admin'
);


-- =========================================
-- 3. MÉDICO
-- =========================================
INSERT INTO medicos (id_usuario, nombre, cedula, firma_medico)
VALUES (
    1,
    'Dr. Juan López',
    '1234567',
    'firma_digital_dr_lopez'
);


-- =========================================
-- 4. PACIENTES
-- =========================================
INSERT INTO pacientes (
    numero_expediente,
    nombre,
    sexo,
    edad,
    fecha_nacimiento,
    domicilio
)
VALUES
('EXP001', 'Carlos Pérez', 'Masculino', 30, '1995-05-10', 'Mérida'),
('EXP002', 'Ana Gómez', 'Femenino', 25, '2000-03-22', 'Mérida');


-- =========================================
-- 5. CIE-10 (CATÁLOGO MÍNIMO)
-- =========================================
INSERT INTO cie10 (codigo, descripcion) VALUES
('E11', 'Diabetes mellitus tipo 2'),
('I10', 'Hipertensión esencial primaria'),
('J45', 'Asma'),
('K21', 'Enfermedad por reflujo gastroesofágico'),
('M54', 'Dorsalgia'),
('G43', 'Migraña'),
('A09', 'Diarrea y gastroenteritis');


-- =========================================
-- 6. CONSULTA (HISTORIA CLÍNICA + NOTA MÉDICA)
-- =========================================
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
    presion_arterial,
    frecuencia_cardiaca,
    frecuencia_respiratoria,
    peso,
    talla,
    resultados_estudios,
    diagnostico,
    codigo_cie10,
    pronostico,
    plan_terapeutico,
    firma_medico
)
VALUES (
    1,
    1,
    1,
    CURRENT_DATE,
    CURRENT_TIME,
    'Dolor de cabeza',
    'Dolor persistente desde hace 3 días',
    'Padre con hipertensión',
    'Sin enfermedades previas',
    'Sistema nervioso con cefalea',
    36.5,
    '120/80',
    72,
    18,
    70,
    1.75,
    'Sin estudios previos',
    'Migraña',
    'G43',
    'Bueno',
    'Paracetamol cada 8 horas',
    'firma_digital_dr_lopez'
);


-- =========================================
-- 7. NOTA DE EVOLUCIÓN
-- =========================================
INSERT INTO notas_evolucion (
    id_consulta,
    fecha,
    resumen_interrogatorio,
    evolucion,
    signos_vitales,
    resultados_estudios,
    diagnostico,
    pronostico,
    tratamiento,
    firma_medico
)
VALUES (
    1,
    CURRENT_DATE,
    'Sistema nervioso con cefalea',
    'Paciente presenta mejoría',
    'TA 120/80, FC 70',
    'Sin hallazgos relevantes',
    'Migraña controlada',
    'Bueno',
    'Continuar tratamiento',
    'firma_digital_dr_lopez'
);


-- =========================================
-- 8. CONSENTIMIENTO INFORMADO (SIMPLIFICADO)
-- =========================================
INSERT INTO consentimientos (
    id_paciente,
    descripcion,
    fecha,
    firma_paciente,
    firma_medico
)
VALUES (
    1,
    'Consentimiento para tratamiento médico general',
    CURRENT_DATE,
    'firma_paciente_demo',
    'firma_digital_dr_lopez'
);


-- =========================================
-- 9. AUDITORÍA
-- =========================================
INSERT INTO auditoria (
    tabla_afectada,
    accion,
    id_usuario,
    descripcion
)
VALUES (
    'consultas',
    'INSERT',
    1,
    'Se registró una consulta médica'
);