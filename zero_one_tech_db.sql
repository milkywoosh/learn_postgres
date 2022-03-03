-- MANY TO MANY RELATIONSHIP
-- REFERENCE -> https://stackoverflow.com/questions/9789736/how-to-implement-a-many-to-many-relationship-in-postgresql
CREATE TABLE news_article (
    ID_ARTICLE SERIAL PRIMARY KEY,
    CONTENT_ARTICLE TEXT,
    RELEASED_DATE DATE NOT NULL default CURRENT_DATE,
    STATUS_ARTICLE VARCHAR(15) -- DRAFT, DELETE, PUBLISHED
)

CREATE TABLE topic (
    ID_TOPIC SERIAL PRIMARY KEY,
    NAME_TOPIC VARCHAR(100)
)

-- CREATE JOIN TABLE
CREATE TABLE article_and_topic (
    ID_ARTICLE INT REFERENCES news_article(ID_ARTICLE) ON UPDATE CASCADE ON DELETE CASCADE,
    ID_TOPIC INT REFERENCES topic(ID_TOPIC) ON UPDATE CASCADE,
    AMOUNT numeric NOT NULL DEFAULT 1,
    CONSTRAINT article_and_topic_pkey PRIMARY KEY (ID_ARTICLE, ID_TOPIC)
)


INSERT INTO news_article(CONTENT_ARTICLE, STATUS_ARTICLE, RELEASED_DATE) VALUES 
('learning python for beginner', 'draft', CURRENT_DATE),
('golang for backend developer', 'published', CURRENT_DATE),
('website development for lifeeeee', 'delete',  CURRENT_DATE);

INSERT INTO topic(NAME_TOPIC) VALUES 
('programming language'),
('technology'),
('tips';)

INSERT INTO article_and_topic(ID_ARTICLE, ID_TOPIC) VALUES
(2,1),
(2,2),
(2,3);

ALTER TABLE the_table ADD CONSTRAINT constraint_name UNIQUE (thecolumn);
ALTER TABLE topic ADD CONSTRAINT constraint_name UNIQUE (NAME_TOPIC);

-- GET JOIN TABLE DATA
SELECT name_topic, content_article, status_article FROM news_article JOIN article_and_topic
on news_article.ID_ARTICLE = article_and_topic.ID_ARTICLE
JOIN topic
on topic.ID_TOPIC = article_and_topic.ID_TOPIC 
WHERE news_article.status_article = 'draft';
