DELIMITER //
DROP PROCEDURE if exists addUser //
CREATE PROCEDURE addUser (name varchar(64),department varchar(64),role
    varchar(64))
     BEGIN      
        set @name = name;
        set @dep = department;
        set @role = role;
        INSERT INTO userinfo (name,depID) values(@name,(select depID from
                department where name = @dep));

        INSERT INTO  userToAdminRole (userID,adminRoleID) values ((select userID
                from userinfo where name = @name),(select adminRoleID from
                adminRoles where name = @role));
    
END//

DELIMITER ;

