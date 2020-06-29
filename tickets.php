<?php
	//require 'dbconnection.php';
	$conn = mysqli_connect('localhost','root','root','tag');

	if(!$conn){
		die('Could not connect: '.mysqli_connect_error());
	}  else {
		//echo "Connected successfully<br>";
	}

	function getOpenTickets() {
		
		$arr = [];
		$sql = "SELECT ticket_id,number FROM ost_ticket where status_id=1";
		$result = $GLOBALS['conn']->query($sql);
		// if($result) echo "\nQuery successful"; else "\nUnsuccessful";
		$cpc = mysqli_num_rows($result);
		if ($cpc > 0) {
			while($row = $result->fetch_assoc()) {
				// echo $row['ticket_id']." ".$row['number']."<br>";
				// print(json_encode($row));
				array_push($arr,$row);
			}
		}
		echo json_encode($arr);
		// return json_encode($arr);
		//echo 'hello';
	}

	if( isset($_GET['ticketNum']) ) getOpenTickets();
	//echo var_dump($_GET);
	//echo var_dump($_POST);
?>
