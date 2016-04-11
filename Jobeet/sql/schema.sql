BEGIN TRANSACTION;

CREATE TABLE jobeet_affiliate (
  id INTEGER PRIMARY KEY NOT NULL,
  url VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  token VARCHAR(80) NOT NULL,
  is_active TINYINT NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL
);

CREATE UNIQUE INDEX jobeet_affiliate_email ON jobeet_affiliate (email);

CREATE TABLE jobeet_category (
  id INTEGER PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL
);

CREATE UNIQUE INDEX jobeet_category_name ON jobeet_category (name);

CREATE TABLE jobeet_something (
  json_column1 VARCHAR(255) NOT NULL,
  json_column2 VARCHAR(255) NOT NULL
);

CREATE TABLE jobeet_job (
  id INTEGER PRIMARY KEY NOT NULL,
  category_id INTEGER NOT NULL,
  type VARCHAR(255),
  position VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  how_to_apply TEXT NOT NULL,
  token VARCHAR(255) NOT NULL,
  is_public TINYINT NOT NULL DEFAULT 1,
  is_activated TINYINT NOT NULL DEFAULT 0,
  email VARCHAR(255) NOT NULL,
  expires_at DATETIME NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  FOREIGN KEY (category_id) REFERENCES jobeet_category(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX jobeet_job_idx_category_id ON jobeet_job (category_id);

CREATE UNIQUE INDEX jobeet_job_token ON jobeet_job (token);

CREATE TABLE jobeet_category_affiliate (
  category_id INTEGER NOT NULL,
  affiliate_id INTEGER NOT NULL,
  PRIMARY KEY (category_id, affiliate_id),
  FOREIGN KEY (affiliate_id) REFERENCES jobeet_affiliate(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (category_id) REFERENCES jobeet_category(id) ON UPDATE CASCADE
);

CREATE INDEX jobeet_category_affiliate_idx_affiliate_id ON jobeet_category_affiliate (affiliate_id);

CREATE INDEX jobeet_category_affiliate_idx_category_id ON jobeet_category_affiliate (category_id);

COMMIT;
