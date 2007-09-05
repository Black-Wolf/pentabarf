
CREATE TABLE conference (
  conference_id SERIAL NOT NULL,
  acronym TEXT NOT NULL UNIQUE,
  title TEXT NOT NULL,
  subtitle TEXT,
  conference_phase_id INTEGER NOT NULL,
  start_date DATE NOT NULL,
  days SMALLINT NOT NULL DEFAULT 1,
  venue TEXT,
  city TEXT,
  country_id INTEGER,
  time_zone_id INTEGER,
  currency_id INTEGER,
  timeslot_duration INTERVAL NOT NULL DEFAULT '1:00:00',
  default_timeslots INTEGER NOT NULL DEFAULT 1,
  max_timeslot_duration INTEGER NOT NULL DEFAULT 10,
  day_change TIME WITHOUT TIME ZONE NOT NULL DEFAULT '0:00:00',
  remark TEXT,
  f_deleted BOOL NOT NULL DEFAULT FALSE,
  release VARCHAR(32),
  homepage TEXT,
  abstract_length INTEGER,
  description_length INTEGER,
  export_base_url VARCHAR(256),
  export_css_file VARCHAR(256),
  feedback_base_url VARCHAR(256),
  css TEXT,
  email TEXT,
  f_feedback_enabled BOOL NOT NULL DEFAULT FALSE,
  f_submission_enabled BOOL NOT NULL DEFAULT FALSE,
  f_visitor_enabled BOOL NOT NULL DEFAULT FALSE,
  f_reconfirmation_enabled BOOL NOT NULL DEFAULT FALSE,
  last_modified TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  last_modified_by INTEGER,
  FOREIGN KEY (conference_phase_id) REFERENCES conference_phase (conference_phase_id) ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (country_id) REFERENCES country (country_id) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY (time_zone_id) REFERENCES time_zone (time_zone_id) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY (currency_id) REFERENCES currency (currency_id) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY (last_modified_by) REFERENCES person (person_id) ON UPDATE CASCADE ON DELETE SET NULL,
  PRIMARY KEY (conference_id)
) WITHOUT OIDS;
