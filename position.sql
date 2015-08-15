CREATE TABLE "company" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
    "name" varchar(100) NOT NULL);
    
CREATE TABLE "position" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
    "title" varchar(100) NOT NULL, 
    "description" varchar(1000) NOT NULL,
     "abstract" varchar(500) NOT NULL, 
     "city" varchar(50) NOT NULL, 
     "salary_from" real NOT NULL, 
     "salary_to" real NOT NULL, 
     "work_year_from" integer NOT NULL, 
     "work_year_to" integer NOT NULL, 
     "type" BLOB NOT NULL,
      "education" integer NOT NULL, 
      "company_id" integer NOT NULL REFERENCES "company" ("id"));
      
CREATE TABLE "skill" (
"id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
"name" varchar(50) NOT NULL);

CREATE INDEX "position_447d3092" ON "position" ("company_id");
CREATE TABLE "position_skills" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
"position_id" integer NOT NULL REFERENCES "position" ("id"),
 "skill_id" integer NOT NULL REFERENCES "skill" ("id"),
  UNIQUE ("position_id", "skill_id"));
CREATE INDEX "position_skills_bce5bd07" ON "position_skills" ("position_id");
CREATE INDEX "position_skills_d38d4c39" ON "position_skills" ("skill_id");
