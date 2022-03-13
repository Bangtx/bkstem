DROP TABLE IF EXISTS account CASCADE;
CREATE TABLE item
(
  id bigserial NOT NULL,
  name text,
  password text,
  yomi text,
  short_name text,
  default_unit bigint,
  units bigint[],
  search_str text,
  order_num bigint,
  size_group_id bigint,
  quality_group_id bigint,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  created_by bigint,
  modified_at timestamp with time zone,
  modified_by bigint,
  deleted_at timestamp with time zone,
  deleted_by bigint,
  active boolean DEFAULT TRUE,
  CONSTRAINT pkey_item PRIMARY KEY (id)
);
