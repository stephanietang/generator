
DROP TABLE IF EXISTS verify_token;
DROP TABLE IF EXISTS user_role;
-- DROP TABLE IF EXISTS role_permission;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS user;

-- DROP TABLE IF EXISTS permission;


/* For Remember-Me token storage purpose */
CREATE TABLE persistent_logins (
    username VARCHAR(64) NOT NULL,
    series VARCHAR(64) NOT NULL,
    token VARCHAR(64) NOT NULL,
    last_used TIMESTAMP NOT NULL,
    PRIMARY KEY (series)
);

CREATE TABLE user(
	id INT NOT NULL AUTO_INCREMENT,
	email VARCHAR(50),
	password VARCHAR(60) NOT NULL,
	enabled TINYINT NOT NULL DEFAULT 0,

	PRIMARY KEY(id),
	UNIQUE uni_user (email),
	INDEX idx_user (email)
);

CREATE TABLE role(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(40),
	
	PRIMARY KEY(id)
);

CREATE TABLE user_role(
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	role_id INT NOT NULL,

	PRIMARY KEY (id),

	CONSTRAINT fk_user_role FOREIGN KEY (user_id) REFERENCES user(id),
	CONSTRAINT fk_user_role_2 FOREIGN KEY (role_id) REFERENCES role(id)
);

CREATE TABLE verify_token(
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	token VARCHAR(60),
	token_type TINYINT,
	expiry_date DATE,
	sent TINYINT NOT NULL DEFAULT 0,
	verified TINYINT NOT NULL DEFAULT 0,
	
	PRIMARY KEY (id),
	
	CONSTRAINT fk_verify_token FOREIGN KEY (user_id) REFERENCES user(id)
);

--CREATE TABLE permission(
--	id INT NOT NULL AUTO_INCREMENT,
--	name VARCHAR(40),
--	
--	PRIMARY KEY (id)
--);
--
--CREATE TABLE role_permission(
--	id INT NOT NULL AUTO_INCREMENT,
--	role_id INT NOT NULL,
--	permission_id INT NOT NULL,
--	
--	PRIMARY KEY (id),
--	
--	FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE ON UPDATE CASCADE,
--		
--	FOREIGN KEY (permission_id) REFERENCES permission(id) ON DELETE CASCADE ON UPDATE CASCADE
--);

-- for testing
INSERT INTO user(email, password,enabled)
VALUES ('stephanie@gmail.com','123','123456', true);
INSERT INTO user(email,password,enabled)
VALUES ('company@gmail.com','123','123456', true);
INSERT INTO user(email,password,enabled)
VALUES ('admin@gmail.com','123','123456', true);

INSERT INTO role (name)
VALUES ('ROLE_TALENT');
INSERT INTO role (name)
VALUES ('ROLE_COMPANY');
INSERT INTO role (name)
VALUES ('ROLE_ADMIN');

INSERT INTO user_role(user_id, role_id)
VALUES (1,1);
INSERT INTO user_role(user_id, role_id)
VALUES (2,2);
INSERT INTO user_role(user_id, role_id)
VALUES (3,3);