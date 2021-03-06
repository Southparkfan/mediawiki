-- This file is automatically generated using maintenance/generateSchemaSql.php.
-- Source: maintenance/tables.json
-- Do not modify this file directly.
-- See https://www.mediawiki.org/wiki/Manual:Schema_changes
CREATE TABLE site_identifiers (
  si_type TEXT NOT NULL,
  si_key TEXT NOT NULL,
  si_site INT NOT NULL,
  PRIMARY KEY(si_type, si_key)
);
CREATE INDEX site_ids_site ON site_identifiers (si_site);
CREATE INDEX site_ids_key ON site_identifiers (si_key);
CREATE TABLE updatelog (
  ul_key VARCHAR(255) NOT NULL,
  ul_value TEXT DEFAULT NULL,
  PRIMARY KEY(ul_key)
);
CREATE TABLE actor (
  actor_id BIGSERIAL NOT NULL,
  actor_user INT DEFAULT NULL,
  actor_name TEXT NOT NULL,
  PRIMARY KEY(actor_id)
);
CREATE UNIQUE INDEX actor_user ON actor (actor_user);
CREATE UNIQUE INDEX actor_name ON actor (actor_name);
CREATE TABLE user_former_groups (
  ufg_user INT DEFAULT 0 NOT NULL,
  ufg_group TEXT DEFAULT '' NOT NULL,
  PRIMARY KEY(ufg_user, ufg_group)
);
CREATE TABLE bot_passwords (
  bp_user INT NOT NULL,
  bp_app_id TEXT NOT NULL,
  bp_password TEXT NOT NULL,
  bp_token TEXT DEFAULT '' NOT NULL,
  bp_restrictions TEXT NOT NULL,
  bp_grants TEXT NOT NULL,
  PRIMARY KEY(bp_user, bp_app_id)
);
CREATE TABLE comment (
  comment_id BIGSERIAL NOT NULL,
  comment_hash INT NOT NULL,
  comment_text TEXT NOT NULL,
  comment_data TEXT DEFAULT NULL,
  PRIMARY KEY(comment_id)
);
CREATE INDEX comment_hash ON comment (comment_hash);
CREATE TABLE slots (
  slot_revision_id BIGINT NOT NULL,
  slot_role_id SMALLINT NOT NULL,
  slot_content_id BIGINT NOT NULL,
  slot_origin BIGINT NOT NULL,
  PRIMARY KEY(slot_revision_id, slot_role_id)
);
CREATE INDEX slot_revision_origin_role ON slots (
  slot_revision_id, slot_origin, slot_role_id
);
CREATE TABLE site_stats (
  ss_row_id INT NOT NULL,
  ss_total_edits BIGINT DEFAULT NULL,
  ss_good_articles BIGINT DEFAULT NULL,
  ss_total_pages BIGINT DEFAULT NULL,
  ss_users BIGINT DEFAULT NULL,
  ss_active_users BIGINT DEFAULT NULL,
  ss_images BIGINT DEFAULT NULL,
  PRIMARY KEY(ss_row_id)
);
CREATE TABLE user_properties (
  up_user INT NOT NULL,
  up_property TEXT NOT NULL,
  up_value TEXT DEFAULT NULL,
  PRIMARY KEY(up_user, up_property)
);
CREATE INDEX user_properties_property ON user_properties (up_property);
CREATE TABLE log_search (
  ls_field TEXT NOT NULL,
  ls_value VARCHAR(255) NOT NULL,
  ls_log_id INT DEFAULT 0 NOT NULL,
  PRIMARY KEY(ls_field, ls_value, ls_log_id)
);
CREATE INDEX ls_log_id ON log_search (ls_log_id);
CREATE TABLE change_tag (
  ct_id SERIAL NOT NULL,
  ct_rc_id INT DEFAULT NULL,
  ct_log_id INT DEFAULT NULL,
  ct_rev_id INT DEFAULT NULL,
  ct_params TEXT DEFAULT NULL,
  ct_tag_id INT NOT NULL,
  PRIMARY KEY(ct_id)
);
CREATE UNIQUE INDEX change_tag_rc_tag_id ON change_tag (ct_rc_id, ct_tag_id);
CREATE UNIQUE INDEX change_tag_log_tag_id ON change_tag (ct_log_id, ct_tag_id);
CREATE UNIQUE INDEX change_tag_rev_tag_id ON change_tag (ct_rev_id, ct_tag_id);
CREATE INDEX change_tag_tag_id_id ON change_tag (
  ct_tag_id, ct_rc_id, ct_rev_id, ct_log_id
);
CREATE TABLE content (
  content_id BIGSERIAL NOT NULL,
  content_size INT NOT NULL,
  content_sha1 TEXT NOT NULL,
  content_model SMALLINT NOT NULL,
  content_address TEXT NOT NULL,
  PRIMARY KEY(content_id)
);