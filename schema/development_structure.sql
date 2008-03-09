CREATE TABLE schema_info (version integer);
CREATE TABLE sites ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "domain" varchar(255) DEFAULT NULL);
INSERT INTO schema_info (version) VALUES (1)