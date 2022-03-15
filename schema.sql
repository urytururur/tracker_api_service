drop table if exists Tracker;
drop table if exists User;

-- drop procedure if exists change_password;

-- drop function if exists get_country_by_email;

create table User(
    email varchar(255) PRIMARY KEY,
    hashed_pass varchar(1024) not null,
    country varchar(255) not null,
    city varchar(255) not null,
    zip varchar(255) not null
);

create table Tracker(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    userEmail varchar(255) not null,
    ip varchar(255) not null,
    foreign key(userEmail) references User(email)
);

insert into User(email, hashed_pass, country, city, zip)
values(
    'torbjorn.ekstedt@hotmail.com',
    'pass',
    'Sweden',
    'Linköping',
    '58248'
);

insert into User(email, hashed_pass, country, city, zip)
values(
    'amirali.tajik@hotmail.com',
    'pass',
    'Sweden',
    'Linköping',
    '15832'
);

insert into Tracker(userEmail, ip)
values(
    'torbjorn.ekstedt@hotmail.com',
    '127.0.0.1'
);

/*
delimiter // ;
CREATE PROCEDURE change_password(IN usersEmail varchar(255), IN newHashedPassword varchar(255))
BEGIN
update User set hashed_pass = newHashedPassword where email = usersEmail;
END//
delimiter ; //

delimiter // ;
CREATE FUNCTION get_country_by_email(usersEmail varchar(255)) returns varchar(255)
BEGIN
return (select country from User where email = usersEmail);
END//
delimiter ; //

call change_password("torbjorn.ekstedt@hotmail.com", "hejhejsommar");

select get_country_by_email('torbjorn.ekstedt@hotmail.com');

set @my_var = 4;
*/