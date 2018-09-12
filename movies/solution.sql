-- Tables with no foreign keys:

CREATE TABLE users(
    userid int PRIMARY KEY, -- user id
    name text -- user name
);
CREATE TABLE movies(
    movieid int PRIMARY KEY, -- movie id
    title text -- user name
);
CREATE TABLE taginfo(
    tagid int PRIMARY KEY, -- tag id
    content text -- tag name
);
CREATE TABLE genres(
    genreid int PRIMARY KEY, -- genre id
    name text -- genre name
);

-- Tables with foreign keys:

CREATE TABLE hasagenre(
    movieid int REFERENCES movies (movieid),
    genreid int REFERENCES genres (genreid)
);
CREATE TABLE ratings(
    PRIMARY KEY(userid, movieid),
    userid int REFERENCES users (userid),
    movieid int REFERENCES movies (movieid),
    rating numeric CHECK (rating <= 5 and rating >= 0),
    timestamp bigint
);
CREATE TABLE tags(
    userid int REFERENCES users (userid),
    movieid int REFERENCES movies (movieid),
    tagid int REFERENCES taginfo (tagid),
    timestamp bigint
);
-- COPY users
--     FROM '/Users/NothingToLose/dbdesign/Coursera-ASU-DBs/course1/assignment1/exampleinput/users.dat'
--     USING DELIMITERS '%';

-- COPY movies
--     FROM '/Users/NothingToLose/dbdesign/Coursera-ASU-DBs/course1/assignment1/exampleinput/movies.dat'
--     USING DELIMITERS '%';

-- COPY taginfo
--     FROM '/Users/NothingToLose/dbdesign/Coursera-ASU-DBs/course1/assignment1/exampleinput/taginfo.dat'
--     USING DELIMITERS '%';

-- COPY genres
--     FROM '/Users/NothingToLose/dbdesign/Coursera-ASU-DBs/course1/assignment1/exampleinput/genres.dat'
--     USING DELIMITERS '%';

-- COPY hasagenre
--     FROM '/Users/NothingToLose/dbdesign/Coursera-ASU-DBs/course1/assignment1/exampleinput/hasagenre.dat'
--     USING DELIMITERS '%';

-- COPY ratings
--     FROM '/Users/NothingToLose/dbdesign/Coursera-ASU-DBs/course1/assignment1/exampleinput/ratings.dat'
--     USING DELIMITERS '%';

-- COPY tags
--     FROM '/Users/NothingToLose/dbdesign/Coursera-ASU-DBs/course1/assignment1/exampleinput/tags.dat'
--     USING DELIMITERS '%';
