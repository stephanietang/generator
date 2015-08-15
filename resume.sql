CREATE TABLE "account" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT
    );

CREATE TABLE "education_experience" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    "school_name" varchar(150) NOT NULL UNIQUE,
    "degree" varchar(20) NOT NULL,
    "major" varchar(20) NOT NULL,
    "entry_date" datetime NULL,
    "account_id" integer NOT NULL REFERENCES "account" ("id"));

CREATE TABLE "works" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
     "description" varchar(500) NOT NULL,
     "account_id" integer NOT NULL REFERENCES "account" ("id"));

CREATE TABLE "resume" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    "self_description" varchar(1000) NOT NULL,
    "account_id" integer NOT NULL REFERENCES "account" ("id"));

CREATE TABLE "website" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" varchar(100) NOT NULL);

CREATE TABLE "social_network" (

    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    "url" varchar(100) NOT NULL,
     "account_id" integer NOT NULL REFERENCES "account" ("id"));

CREATE TABLE "work_experience" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    "company_name" varchar(150) NOT NULL UNIQUE,
     "duty_name" varchar(150) NOT NULL,
     "work_start_date" date NOT NULL,
     "work_end_date" date NOT NULL,
     "work_description" varchar(500) NOT NULL,
     "account_id" integer NOT NULL REFERENCES "account" ("id"));

CREATE INDEX "education_experience_8a089c2a" ON "education_experience" ("account_id");
CREATE INDEX "product_8a089c2a" ON "works" ("account_id");
CREATE INDEX "resume_8a089c2a" ON "resume" ("account_id");
CREATE INDEX "social_network_8a089c2a" ON "social_network" ("account_id");
CREATE INDEX "work_experience_8a089c2a" ON "work_experience" ("account_id");

COMMIT;