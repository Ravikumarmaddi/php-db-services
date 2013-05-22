<?php
class BaseDAO{
    function dbi_connect() //$url 
    {

        $DB_DATABASE_NAME = 'UserDB1'
        $DB_USER_NAME = 'root';
        $DB_PASSWORD = 'root123';
        $DB_HOST = '127.0.0.1';
        $description = "Database Name : $DB_DATABASE_NAME  User Name : $DB_USER_NAME Passwrod : $DB_PASSWORD Host : $DB_HOST\n";
        $logger->debug($description);
        try{
            $connection = new mysqli($DB_HOST,$DB_USER_NAME,$DB_PASSWORD,
                $DB_DATABASE_NAME);
            if(mysql_errno()){
                throw new Exception(mysql_error());
            }
        }
        return $connection;
    }
    function dbi_query($query,$object,$debug = 0){
        $browseData = array();
        $result = FALSE;
        $connection = self::dbi_connect();
        try{
            if (!$connection->error){
                if($debug){
                    $start_time  = microtime();
                    $result = $connection->multi_query($query);
                    $end_time    = microtime();
                    $difference  = $end_time - $start_time;
                    $description = "SQL used : $query   Start time : $start_time  ".
                        "End time : $end_time Difference : $difference ".
                        "Number of entries in the resultset : $connection->affected_rows \n";
                    $logger->debug($description);
                }
                else{
                    $result = $connection->multi_query($query);
                }
                if ($result){
                    do{
                        $queryResults = array();
                        if($result = $connection->store_result()){
                            while($row = $result->fetch_assoc()){
                                $queryResults[] = $row; 
                            }
                            $result->close();        
                            $browseData[] = $queryResults;

                        }
                    }while ($connection->next_result());
                }
                else{
                    throw new Exception($connection->error);
                }
            }
            else{
                throw new Exception($connection->error);
            }
            $connection->close();
            $resultObject = $object->mapRow($browseData[0]);

            $resultObject->NO_OF_ROWS_FOUND = $browseData[1][0][DAOConstants::NO_OF_ROWS_FOUND];
            return $resultObject;
        }

        catch(Exception $e){
            $description = $connection->error ."query: ". htmlspecialchars($query).E_USER_ERROR;
            $connection->close();
            return NULL;
        }
    }

}
?>
