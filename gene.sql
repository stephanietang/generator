to see the maven plugin goals:

> mvn help:describe -Dplugin=groupid:artifactid

to know the mybatis-generator goal, run:

> mvn help:describe -Dplugin=org.mybatis.generator:mybatis-generator-maven-plugin

This plugin has 1 goal:

mybatis-generator:generate
  Description: Goal which generates MyBatis/iBATIS artifacts.

> mvn -Dmybatis.generator.overwrite=true mybatis-generator:generate

kill tomcat process:
pkill -9 -f tomcat

CREATE USER 'devuser'@'localhost' IDENTIFIED BY 'devpwd';

Grant ALL ON *.* TO 'devuser'@'localhost';

DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS company;

DROP TABLE IF EXISTS verify_token;
DROP TABLE IF EXISTS user_role;
DROP TABLE IF EXISTS role_permission;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS permission;


CREATE TABLE user(
	id INT NOT NULL AUTO_INCREMENT,
	password VARCHAR(200) NOT NULL,
	salt VARCHAR(50) NOT NULL,
	chi_name VARCHAR(50),
	eng_name VARCHAR(50),
	email VARCHAR(50),
	enabled TINYINT NOT NULL DEFAULT 0,

	PRIMARY KEY(id)
);

CREATE TABLE verify_token(
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	token VARCHAR(60),
	token_type TINYINT,
	expiry_date DATE,
	verified TINYINT NOT NULL DEFAULT 0,
	
	PRIMARY KEY (id),
	
	FOREIGN KEY (user_id)
		REFERENCES user(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE basic_info(
	user_id INT NOT NULL,
	name	VARCHAR(250),
	country_id INT,
	city VARCHAR(100),
	tel_no	VARCHAR(20),
	experience_id INT,
	degree_id INT,
	sex_id 	INT,
	born_year INT,
	
	PRIMARY KEY(user_id),
	
	FOREIGN KEY (user_id)
		REFERENCES user(id)
		ON DELETE CASCADE ON UPDATE CASCADE
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

	PRIMARY KEY(id),

	INDEX user_role_idx (user_id, role_id),

	FOREIGN KEY (user_id)
		REFERENCES user(id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	
	FOREIGN KEY (role_id)
		REFERENCES role(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE permission(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(40),
	
	PRIMARY KEY (id)
);

CREATE TABLE role_permission(
	id INT NOT NULL AUTO_INCREMENT,
	role_id INT NOT NULL,
	permission_id INT NOT NULL,
	
	PRIMARY KEY (id),
	
	FOREIGN KEY (role_id)
		REFERENCES role(id)
		ON DELETE CASCADE ON UPDATE CASCADE,
		
	FOREIGN KEY (permission_id)
		REFERENCES permission(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE company(
	id INT NOT NULL AUTO_INCREMENT,
	chi_name VARCHAR(30),
	eng_name VARCHAR(30),
	website VARCHAR(50),
	intro VARCHAR(1000),
	location VARCHAR(50),

	PRIMARY KEY(id)
); 

CREATE TABLE post(
	id INT NOT NULL AUTO_INCREMENT,
	company_id INT NOT NULL,
	user_id INT NOT NULL,
	post_desc VARCHAR(3000),
	post_date DATE,
	location VARCHAR(50),
	salary_min INT,
	salary_max INT,
	work_year_min INT,
	work_year_max INT,

	PRIMARY KEY(id),

	INDEX post_idx (company_id, user_id),

	FOREIGN KEY (user_id)
		REFERENCES user(id)
		ON DELETE CASCADE ON UPDATE CASCADE,

	FOREIGN KEY (company_id)
		REFERENCES company(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

insert into user values(1, 'test','test',null, null, 'test@test.com',1);

