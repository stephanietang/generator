DROP TABLE IF EXISTS basic_info;
CREATE TABLE basic_info(
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	name VARCHAR(250),
	country INT,
	city INT,
	tel_no VARCHAR(20),
	experience INT,
	degree INT,
	sex INT,
	born_year INT(4),
	
	PRIMARY KEY(id),
	UNIQUE uni_basic_info (user_id),
	INDEX idx_basic_info (user_id),
	CONSTRAINT fk_basic_info FOREIGN KEY (user_id) REFERENCES user(id)
);

DROP TABLE IF EXISTS education;
CREATE TABLE education(
	id INT NOT NULL AUTO_INCREMENT,
	basic_info_id INT,
	school_name VARCHAR(200),
	degree INT,
	start_year INT(4),
	end_year INT(4),
	department VARCHAR(200),
	
	PRIMARY KEY(id),
	
	CONSTRAINT fk_education FOREIGN KEY (basic_info_id) REFERENCES basic_info(id)
);

DROP TABLE IF EXISTS avatar;
CREATE TABLE avatar(
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	uuid VARCHAR(36),
	path VARCHAR(200),
	
	PRIMARY KEY(id),
	INDEX idx_avatar (user_id),
	INDEX idx_avatar_2 (uuid),
	CONSTRAINT fk_avatar FOREIGN KEY (user_id) REFERENCES user(id)
);


-- testing
insert into basic_info values (1, 1, '陈大文', 1, '深圳', '16820428602', 1, 1, 1, 1985);
insert into education values(1,1,'清华大学',1,2003,2007,'计算机科学与技术');
insert into education values(2,1,'哥伦比亚大学',2,2007,2009,'计算机科学与技术');