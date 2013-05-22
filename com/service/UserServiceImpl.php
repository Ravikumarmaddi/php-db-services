<?php

require_once "com/dao/UserDAOImpl.php";

class UserServiceImpl
{
    function getUserDetails($detailsForm){
        $userDaoObject  = new UserDAOImpl();
        $user = $daoObject->getUser($detailsForm);
        return $user;
    }
    function addUser($detailsForm){
        $userDaoObject  = new UserDAOImpl();
        $user = $daoObject->addUser($detailsForm);
        return $user;
    }
    function editUser($detailsForm){
        $userDaoObject  = new UserDAOImpl();
        $user = $daoObject->editUser($detailsForm);
        return $user;
    }
}
?>
