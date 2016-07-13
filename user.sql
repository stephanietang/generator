
DROP TABLE IF EXISTS verify_token;
DROP TABLE IF EXISTS user_role;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS user;


/* For Remember-Me token storage purpose */
CREATE TABLE persistent_logins (
    username VARCHAR(64) NOT NULL,
    series VARCHAR(64) NOT NULL,
    token VARCHAR(64) NOT NULL,
    last_used TIMESTAMP NOT NULL,
    
    CONSTRAINT persistent_logins_pk PRIMARY KEY(series)
);

CREATE TABLE user(
	id INT NOT NULL AUTO_INCREMENT,
	email VARCHAR(50),
	name VARCHAR(50),
	password VARCHAR(60) NOT NULL,
	enabled TINYINT NOT NULL DEFAULT 0,
	
	CONSTRAINT user_pk PRIMARY KEY(id),
	CONSTRAINT UNIQUE user_email_uq (email)
);

CREATE TABLE role(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(40),
	
	CONSTRAINT role_pk PRIMARY KEY(id)
);

CREATE TABLE user_role(
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	role_id INT NOT NULL,

	CONSTRAINT user_role_pk PRIMARY KEY(id),
	CONSTRAINT user_role_user_id_fk FOREIGN KEY (user_id) REFERENCES user(id),
	CONSTRAINT user_role_role_id_fk FOREIGN KEY (role_id) REFERENCES role(id)
);

CREATE TABLE verify_token(
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	token VARCHAR(60),
	token_type TINYINT,
	expiry_date DATE,
	sent TINYINT NOT NULL DEFAULT 0,
	verified TINYINT NOT NULL DEFAULT 0,
	
	CONSTRAINT verify_token_pk PRIMARY KEY(id),
	CONSTRAINT verify_token_user_id_fk FOREIGN KEY (user_id) REFERENCES user(id)
);

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