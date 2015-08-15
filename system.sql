DROP TABLE IF EXISTS system_param;

CREATE TABLE system_param(
	id INT NOT NULL AUTO_INCREMENT,
	param_group VARCHAR(10),
	param_value INT,
	param_desc_chi VARCHAR(50),
	param_desc_eng VARCHAR(50),
	enabled INT,
	
	PRIMARY KEY(id),
	INDEX system_param_idx (param_group)
);


INSERT INTO system_param VALUES (1, 'COUNTRY',1,'中国', 'China',1);
INSERT INTO system_param VALUES (2, 'COUNTRY',2,'美国', 'USA',1);

INSERT INTO system_param VALUES (3, 'EXPERIENCE',1, '应届毕业生','Graduating Student',1);
INSERT INTO system_param VALUES (4, 'EXPERIENCE',2, '一年至三年', '1-3 Years Experience',1);
INSERT INTO system_param VALUES (5, 'EXPERIENCE',3, '三年至五年', '3-5 Years Experience',1);
INSERT INTO system_param VALUES (6, 'EXPERIENCE',4, '五年以上', 'Above 5 Years Experience',1);

INSERT INTO system_param VALUES (7, 'DEGREE',1,'本科', 'Bachelor',1);
INSERT INTO system_param VALUES (8, 'DEGREE',2,'硕士','Master',1);
INSERT INTO system_param VALUES (9, 'DEGREE',3,'博士','PHD',1);
INSERT INTO system_param VALUES (10, 'DEGREE',4,'大专','Associate Degree',1);

INSERT INTO system_param VALUES (11, 'SEX',1,'男','Male',1);
INSERT INTO system_param VALUES (12, 'SEX',2,'女','Female',1);