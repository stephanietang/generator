DROP TABLE IF EXISTS system_param;

CREATE TABLE system_param(
	id INT NOT NULL AUTO_INCREMENT,
	param_key VARCHAR(50),
	param_value INT,
	param_desc VARCHAR(50),
	enabled INT,
	
	PRIMARY KEY(id),
	INDEX idx_system_param (param_key)
);


INSERT INTO system_param VALUES (1, 'LOWER_BIRTH_YEAR',1970,'lower birth year',1);