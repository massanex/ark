SET foreign_key_checks=0;

CREATE TABLE jobeet_affiliate (
  id INTEGER unsigned NOT NULL auto_increment,
  url VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  token VARCHAR(80) NOT NULL,
  is_active TINYINT unsigned NOT NULL DEFAULT 0,
  created_at datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE jobeet_affiliate_email (email)
) ENGINE=InnoDB;

CREATE TABLE jobeet_category (
  id INTEGER unsigned NOT NULL auto_increment,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE jobeet_category_name (name)
) ENGINE=InnoDB;

CREATE TABLE jobeet_something (
  json_column1 VARCHAR(255) NOT NULL,
  json_column2 VARCHAR(255) NOT NULL
);

CREATE TABLE jobeet_job (
  id INTEGER unsigned NOT NULL auto_increment,
  category_id INTEGER unsigned NOT NULL,
  type VARCHAR(255) NULL,
  position VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL,
  description text NOT NULL,
  how_to_apply text NOT NULL,
  token VARCHAR(255) NOT NULL,
  is_public TINYINT unsigned NOT NULL DEFAULT 1,
  is_activated TINYINT unsigned NOT NULL DEFAULT 0,
  email VARCHAR(255) NOT NULL,
  company VARCHAR(255) NULL,
  logo VARCHAR(255) NULL,
  url VARCHAR(128) NULL,
  expires_at datetime NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL,
  INDEX jobeet_job_idx_category_id (category_id),
  PRIMARY KEY (id),
  UNIQUE jobeet_job_token (token),
  CONSTRAINT jobeet_job_fk_category_id FOREIGN KEY (category_id) REFERENCES jobeet_category (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE jobeet_category_affiliate (
  category_id INTEGER unsigned NOT NULL,
  affiliate_id INTEGER unsigned NOT NULL,
  INDEX jobeet_category_affiliate_idx_affiliate_id (affiliate_id),
  INDEX jobeet_category_affiliate_idx_category_id (category_id),
  PRIMARY KEY (category_id, affiliate_id),
  CONSTRAINT jobeet_category_affiliate_fk_affiliate_id FOREIGN KEY (affiliate_id) REFERENCES jobeet_affiliate (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT jobeet_category_affiliate_fk_category_id FOREIGN KEY (category_id) REFERENCES jobeet_category (id) ON UPDATE CASCADE
) ENGINE=InnoDB;

SET foreign_key_checks=1;

