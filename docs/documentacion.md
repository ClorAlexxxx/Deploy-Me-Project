Se implementa control de acceso mediante roles (usuarios), garantizando la confidencialidad de los datos conforme a la NOM-004-SSA3-2012.

El modelo de datos fue diseñado con base en la NOM-004-SSA3-2012, incorporando los elementos mínimos del expediente clínico como identificación del paciente, historia clínica, notas médicas y datos del establecimiento, implementados de forma simplificada acorde a un prototipo funcional.

Base de datos diseñada conforme a la NOM-004-SSA3-2012,

incluyendo:



\- Identificación del paciente

\- Historia clínica

\- Notas médicas

\- Datos del establecimiento

\- Catálogo CIE-10

Se utilizaron restricciones NOT NULL únicamente en campos críticos

definidos por la NOM-004-SSA3-2012, permitiendo flexibilidad en

campos clínicos que pueden no estar disponibles en todas las consultas.

❓ “¿Por qué no todo es NOT NULL?”



👉 Respuesta:



Porque en el contexto clínico no toda la información está disponible

en todas las consultas, por lo que se permite NULL en campos opcionales

para mantener flexibilidad sin comprometer la integridad del sistema.

❓ “¿Cómo garantizas integridad?”



👉 Respuesta:



Mediante claves foráneas (FOREIGN KEY) y restricciones NOT NULL

en los campos críticos como paciente, médico y establecimiento.

❓ “¿Cómo cumples la NOM?”



👉 Respuesta:



Se modelaron las entidades principales del expediente clínico:

paciente, historia clínica, notas médicas, establecimiento

y consentimiento informado, conforme a la NOM-004-SSA3-2012.

