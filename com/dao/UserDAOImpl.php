<?php
 
 require_once "com/dao/phpdbc/BaseDAO.php";
 require_once "com/user/dao/model/User.php";
  
 class UserDAOImpl extends BaseDAO{
 	function getUser($detailsForm){
        $sql = "SELECT u.name,ar.name".
               "from user ".
               "JOIN userToAdminRole on uar (u.userID = uar.userID) ".
               "join adminRoles ar on (ar.adminRoleID = uar.adminRoleID) ".
 		return parent :: dbi_query($sql,new BoxRowMapper());
    }
 	function addUser($detailsForm){
 		$name         = $detailsForm->getName();
 		$department   = $detailsForm->getDepartment();
 		$adminRole    = $detailsForm->getRole();
        $sql = "call addUser($name,$department,$adminRole)";
 		return parent :: dbi_query($sql);
    }
    function editUser($detailsForm){
 		$name         = $detailsForm->getName();
 		$department   = $detailsForm->getDepartment();
 		$adminRole    = $detailsForm->getRole();
        $sql = "UPDATE userToAdminRole uar JOIN userinfo u ON (u.userID = uar.userID) ".
            "join adminRoles ar on (ar.adminRoleID = uar.adminRoleID) set ".
            "uar.adminRoleID =1 where u.name='$name' ";
 		return parent :: dbi_query($sql);
    }
}
?>
