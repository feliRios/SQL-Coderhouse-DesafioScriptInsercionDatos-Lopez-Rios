# Antes de utilizar este script, crear la base de datos con el script 'database_creation.sql'

USE success_mindset;

SELECT * FROM usuario;

-- Se realiza la importacion mediante el asistente de importacion de WORKBENCH
-- Explicacion en el archivo 'explicacion_script_insercion.pdf'

-- Si se requiere truncar la tabla para poder realizar la insercion del script, se debe seguir el siguiente procedimiento

# Se retiran las claves foraneas externas para evitar restricciones
ALTER TABLE publicacion DROP FOREIGN KEY fk_user;
ALTER TABLE mensaje DROP FOREIGN KEY fk_sender_user;
ALTER TABLE compra DROP FOREIGN KEY fk_buyer;

# Se eliminan los datos de las tablas relacionadas con Usuario en caso de que los hubiese
TRUNCATE publicacion;
TRUNCATE mensaje;

# Se trunca la tabla usuario
TRUNCATE USUARIO;

# Se vuelven a asignar las relaciones foraneas externas
ALTER TABLE publicacion ADD CONSTRAINT fk_user FOREIGN KEY(id_user) REFERENCES usuario(id_user) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE mensaje ADD CONSTRAINT fk_sender_user FOREIGN KEY(id_user) REFERENCES usuario(id_user) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE compra ADD CONSTRAINT fk_buyer FOREIGN KEY(id_user) REFERENCES usuario(id_user) ON UPDATE CASCADE ON DELETE CASCADE;