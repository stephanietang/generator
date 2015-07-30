-- DROP TABLE IF EXISTS post;
-- DROP TABLE IF EXISTS company;

DROP TABLE IF EXISTS verify_token;
-- DROP TABLE IF EXISTS user_role;
-- DROP TABLE IF EXISTS role_permission;
DROP TABLE IF EXISTS user;
-- DROP TABLE IF EXISTS role;
-- DROP TABLE IF EXISTS permission;


CREATE TABLE user(
	id INT NOT NULL AUTO_INCREMENT,
	password VARCHAR(200) NOT NULL,
	salt VARCHAR(50) NOT NULL,
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
	
	FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE basic_info(
	user_id INT NOT NULL,
	name VARCHAR(250),
	country_id INT,
	city VARCHAR(100),
	tel_no VARCHAR(20),
	exp_id INT,
	degree_id INT,
	sex_id INT,
	born_year INT(4),
	
	PRIMARY KEY(user_id),
	
	FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (country_id) REFERENCES country(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (exp_id) REFERENCES experience(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (degree_id) REFERENCES degree(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (sex_id) REFERENCES sex(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE education(
	id INT,
	user_id INT,
	school_name VARCHAR(200),
	degree_id INT,
	start_year INT(4),
	end_year INT(4),
	department VARCHAR(200),
	
	PRIMARY KEY(id),
	
	FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (degree_id) REFERENCES degree(id) ON DELETE CASCADE ON UPDATE CASCADE
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

	FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE,
	
	FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE ON UPDATE CASCADE
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


insert into basic_info values (1, '陈大文', 1, '深圳', '16820428602', 1, 1, 1, 1985);
insert into education values(1,1,'清华大学',1,2003,2007,'计算机科学与技术');
insert into education values(2,1,'哥伦比亚大学',2,2007,2009,'计算机科学与技术');

