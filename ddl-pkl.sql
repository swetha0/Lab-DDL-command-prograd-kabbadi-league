-- PROGRESSION - 1


-- 1. **Create table city**
	create table city
    (id NUMBER PRIMARY KEY,
    name varchar(50) NOT NULL
    );
-- 2. **Create table referee**
	create table referee
    (id INT PRIMARY KEY,
    name varchar(50) NOT NULL
    );
-- 3. **Create table innings**
	create table innings
	(id INT PRIMARY KEY,
	innings_number NUMBER(11) NOT NULL
	);
-- 4. **Create table extra_type**
	create table extra_type
	(id NUMBER(11) PRIMARY KEY,
	name varchar(50) NOT NULL
	);
-- 5. **Create table skill**
	create table skill
    (id NUMBER(11) PRIMARY KEY,
    name varchar(50) NOT NULL
    );
-- 6. **Create table team**
	create table team
    (id NUMBER(11) PRIMARY KEY,
    name varchar(50) NOT NULL,
    coach varchar(50) NOT NULL,
    home_city NUMBER,
    captain NUMBER(11) NOT NULL,
    FOREIGN KEY(home_city) REFERENCES city(id)
    );
-- 7. **Create table player**
	create table player
    (id NUMBER(11) PRIMARY KEY,
    name varchar(50) NOT NULL,
    contry varchar(50) NOT NULL,
    skill_id NUMBER(11) NOT NULL,
    team_id NUMBER(11) NOT NULL,
    FOREIGN KEY(skill_id) REFERENCES skill(id),
    FOREIGN KEY(team_id) REFERENCES team(id)
    );
-- 8. **Create table venue**
	create table venue
	(id NUMBER(11) PRIMARY KEY,
	stadium_name varchar(50) NOT NULL,
	city_id NUMBER(11) NOT NULL,
	FOREIGN KEY(city_id) REFERENCES city(id)
	);
-- 9. **Create table event**
	create table event
    (id NUMBER(11) PRIMARY KEY,
    innings_id NUMBER(11) NOT NULL,
    event_no NUMBER(11) NOT NULL,
    raider_id NUMBER(11) NOT NULL,
    raid_points NUMBER(11) NOT NULL,
    defencing_points NUMBER(11) NOT NULL,
    clock_in_seconds NUMBER(11) NOT NULL,
    team_one_score NUMBER(11) NOT NULL,
    team_two_score NUMBER(11) NOT NULL,
    FOREIGN KEY(innings_id) REFERENCES innings(id),
    FOREIGN KEY(raider_id) REFERENCES player(id)
    );
-- 10. **Create table extra_event**
	create table extra_event
    (id NUMBER(11) PRIMARY KEY,
    name varchar(50) NOT NULL
    );
-- 11. **Create table outcome**
	create table outcome
    (id NUMBER(11) PRIMARY KEY,
    status varchar(100) NOT NULL ,
    winner_team_id number(11),
    score number(11),
    player_of_match number(11),
    FOREIGN KEY(winner_team_id) REFERENCES team(id),
    FOREIGN KEY(player_of_match) REFERENCES player(id)
    );
-- 12. **Create table game**
	create table game
    (id number(11),
    game_id date,
    team_id_1 number(11) REFERENCES team(id),
    team_id_2 number(11) REFERENCES team(id),
    venue_id number(11) REFERENCES venue(id),
    outcome_id number(11) REFERENCES outcome(id),
    referee_id_1 number(11) REFERENCES referee(id),
    referee_id_2 number(11) REFERENCES referee(id),
    first_innings_id number(11) REFERENCES innings(id),
    second_innings_id number(11) REFERENCES innings(id),
    primary KEY (id)
    );
-- 13. **Drop table city**
	Drop table city;
-- 14. **Drop table innings**
	Drop table innings;
-- 15. **Drop table skill**
	Drop table skill;
-- 16. **Drop table extra_type**
	Drop table extra_type;