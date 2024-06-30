<?php 
 $database_url = getenv('DATABASE_URL') ?: postgresql://userdetails_user:7i0TzF6FHVLDGSJoM4aASrMtnL1mtL8K@dpg-cq0ma6aju9rs73avjckg-a/userdetails
 $parsed_url = parse_url($database_url);
 
 $host = $parsed_url['host'];
 $dbname = substr($parsed_url['path'], 1);
 $user = $parsed_url['user'];
 $pass = $parsed_url['pass'];
 
 $mysqli = new mysqli($host, $user, $pass, $dbname);
 
//  $con = mysqli_connect("localhost","root","","task") or die("Couldn't connect");

?>