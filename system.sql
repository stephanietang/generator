DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS experience;
DROP TABLE IF EXISTS degree;
DROP TABLE IF EXISTS sex;

CREATE TABLE country(
	id INT NOT NULL AUTO_INCREMENT,
	country_name VARCHAR(50),
	country_name_eng VARCHAR(50),
	
	PRIMARY KEY(id)
);

INSERT INTO country VALUES (1, '中国', 'China');
INSERT INTO country VALUES (2, '美国', 'USA');

CREATE TABLE experience(
	id INT NOT NULL AUTO_INCREMENT,
	desc VARCHAR,
	PRIMARY KEY(id)
);

INSERT INTO experience VALUES (1, '应届毕业生');
INSERT INTO experience VALUES (2, '一年至三年');
INSERT INTO experience VALUES (3, '三年至五年');
INSERT INTO experience VALUES (4, '五年以上');

CREATE TABLE degree(
	id INT NOT NULL AUTO_INCREMENT,
	desc VARCHAR,
	PRIMARY KEY(id)
);

INSERT INTO degree VALUES (1, '本科');
INSERT INTO degree VALUES (2, '硕士');
INSERT INTO degree VALUES (3, '博士');
INSERT INTO degree VALUES (4, '大专');

CREATE TABLE sex(
	id INT NOT NULL AUTO_INCREMENT,
	desc VARCHAR,
	PRIMARY KEY(id)
);

INSERT INTO sex VALUES (1, '男');
INSERT INTO sex VALUES (2, '女');