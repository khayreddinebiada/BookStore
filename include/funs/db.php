<?php

  include ('include/class/database.php');

  $db = new database("localhost","root","","bokshop");


  function getDetailsProduct ($db,$ID_details){
      $query = "SELECT * FROM Details Where ID_Details = $ID_details";
      $rslt = $db->getRow($query);
      if ($row = mysqli_fetch_assoc ($rslt))
        return $row;
      else
        return false;

  }
