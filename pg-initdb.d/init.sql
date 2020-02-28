CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS posts(
id UUID DEFAULT uuid_generate_v4() ,
title VARCHAR(255) NOT NULL,
content VARCHAR(255) NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT LOCALTIMESTAMP ,
PRIMARY KEY (id)
);

-- CREATE SEQUENCE comments_id_seq;

CREATE TABLE IF NOT EXISTS comments(
-- id INTEGER NOT NULL PRIMARY KEY DEFAULT nextval('comments_id_seq') ,
id UUID DEFAULT uuid_generate_v4() ,
post_id UUID ,
content VARCHAR(255) NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT LOCALTIMESTAMP ,
PRIMARY KEY (id),
FOREIGN KEY (post_id) REFERENCES posts(id)
);

-- ALTER SEQUENCE comments_id_seq OWNED BY comments.id;