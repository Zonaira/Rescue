<?php

require 'db.php';
$db = new Database();
header("Content-Type: application/json");



if($_REQUEST['type'] == "login"){

  $email    = $_GET['email'];
  $password = $_GET['password']; 

  $sql = "SELECT * FROM users WHERE email='$email' AND password='$password'";
  $result = $db->select($sql);
  $row = iterator_count($result);
  $response = array();

  if($row > 0){

    foreach ($result as $key) {

      $code    = "login_success";
         $message = "login Successfull";
         array_push($response, array(
                    "code"=>$code,
                    "message"=>$message,
                    "id"=>$key['id'], 
                    "name"=>$key['name'],
                    "email"=>$key['email'],
                    "password"=>$key['password'],
                    "contact"=>$key['contact'], 
                    "type"=>$key['type']
                   ));

       }
      
    echo json_encode($response);

  }

  else{
    $code    = "login_fail";
    $message = "Email or password incorrect";


     array_push($response, array(
                    "code"=>$code,
                    "message"=>$message
                   ));

    echo json_encode($response);
  }

}



if($_REQUEST['type'] == "register"){

  $name      = $_REQUEST['name'];
  $email     = $_REQUEST['email'];
  $password  = $_REQUEST['password'];
  $contact   = $_REQUEST['contact'];
  $cnic      = $_REQUEST['cnic'];
  $type      = "user";

  $sql = "INSERT INTO users(name, email, password, contact, cnic, type) VALUES ('$name', '$email', '$password', '$contact', '$cnic', '$type')";
  $result = $db->query($sql);
  $response = array();

  $code = "register_success";
  $message = "Registeration Successfull";
  array_push($response, array(
                  "code"=>$code, 
                  "message"=>$message
                   ));

  echo json_encode($response);

}



if($_REQUEST['type'] == "makeRequest"){

  $user_id    = $_REQUEST['user_id'];
  $type_id    = $_REQUEST['type_id'];
  $lat        = $_REQUEST['lat'];
  $lon        = $_REQUEST['lon'];
  $image      = $_REQUEST['image'];
  $description= $_REQUEST['description'];
  $time_stamp = date("d-M-Y H:m:s");

  $uploadfolder = "accident_image";
  $name = $user_id.$time_stamp;
  $imagename = $name;
  $basePath="http://localhost/rescue/";
  $upload_path = "$uploadfolder/$name.jpeg";


  $response = array();

  if(file_put_contents($upload_path, base64_decode($image))){
     $code = "request_success";
     $message = "Data Uploaded successfull";
     $sql = "INSERT INTO request(t_id, user_id, lat, lon, description, img, time_stamp) VALUES('$type_id', '$user_id', '$lat', '$lon', '$description','$basePath$upload_path', '$time_stamp')";
     $result = $db->select($sql);

     array_push($response, array("code"=>$code,"message"=>$message));
     echo json_encode($response);
  }
  else{
     $code = "request_fail";
     $message = "Your request cannot be procced at this moment, please try again later";
     array_push($response, array("code"=>$code,"message"=>$message));
     echo json_encode($response);
  }

  echo json_encode($response);

}


if($_REQUEST['type'] == "getRequests"){

  $sql = "SELECT r.id, u.name AS 'user_name', rt.name AS 'request_type', lat, lon, description, r.img, time_stamp FROM users u, request_type rt, request r WHERE r.user_id=u.id AND r.t_id=rt.id";
  $result = $db->select($sql);
  $response = array();

  foreach ($result as $key) {
    array_push($response, array(
                  "request_id"=>$key['id'],
                  "user_name"=>$key['user_name'],
                  "request_type"=>$key['request_type'],
                  "latitude"=>$key['lat'],
                  "longitude"=>$key['lon'],
                  "description"=>$key['description'],
                  "image"=>$key['img'],
                  "time_stamp"=>$key['time_stamp']
                   ));
  }
  echo json_encode($response);

}


if($_REQUEST['type'] == "getUserRequests"){

  $id = $_REQUEST['id'];

  $sql = "SELECT r.id, u.name AS 'user_name', rt.name AS 'request_type', lat, lon, description, r.img, time_stamp FROM users u, request_type rt, request r WHERE r.user_id=u.id AND r.t_id=rt.id AND r.user_id='$id'";
  $result = $db->select($sql);
  $response = array();

  foreach ($result as $key) {
    array_push($response, array(
                  "request_id"=>$key['id'],
                  "user_name"=>$key['user_name'],
                  "request_type"=>$key['request_type'],
                  "latitude"=>$key['lat'],
                  "longitude"=>$key['lon'],
                  "description"=>$key['description'],
                  "image"=>$key['img'],
                  "time_stamp"=>$key['time_stamp']
                   ));
  }
  echo json_encode($response);

}



if($_REQUEST['type'] == "markAttendance"){

  $sc_id = $_REQUEST['sc_id'];
  $status = "Present";
  $date = date("d-m-Y");

  $sql = "INSERT INTO student_attendance(sc_id, status, date) VALUES('$sc_id', '$status', '$date')";
  $result = $db->query($sql);
  $response = array();

  
    array_push($response, array(
                  "code"=>"mark_success",
                  "message"=>"Attendance Marked Successfully"
                   ));

  echo json_encode($response);

}



if($_REQUEST['type'] == "logout"){

  $id = $_REQUEST['id'];

  $sql = "UPDATE users SET user_status='logout' WHERE user_id=".$id;
  $result = $db->query($sql);
  $response = array();

  
    array_push($response, array(
                  "code"=>"logout_success",
                  "message"=>"Logged Out Successfully"
                   ));

  echo json_encode($response);

}



?>