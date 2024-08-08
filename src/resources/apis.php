<?php
// Reference:
// https://www.leaseweb.com/labs/2015/10/creating-a-simple-rest-api-in-php/

// Use this API for demonstration purposes only


// get the HTTP method, path and body of the request
$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
$input = json_decode(file_get_contents('php://input'),true);

// connect to the mysql database, provide the appropriate credentials
$conn = mysqli_connect('feenix-mariadb.swin.edu.au', 's104357292', '090704', 's104357292_db');

mysqli_set_charset($conn,'utf8');

// initialise the table name accordingly
$table = "units";

// retrieve the search key field name and value from the path
$fld = preg_replace('/[^a-z0-9_]+/i','',array_shift($request));
$key = array_shift($request);

// retrieve the data to prepare set values
if (isset ($input))  {
	$columns = preg_replace('/[^a-z0-9_]+/i','',array_keys($input));
	$values = array_map(function ($value) use ($conn) {
		if ($value===null) return null;
		return mysqli_real_escape_string($conn,(string)$value);
	},array_values($input));

	$set = '';
	for ($i=0;$i<count($columns);$i++) {
		$set.=($i>0?',':'').'`'.$columns[$i].'`=';
		$set.=($values[$i]===null?'NULL':'"'.$values[$i].'"');
	}
}

// create SQL
switch ($method) {
  case 'GET':
    $sql = "select * from `$table`".($key?" WHERE $fld='$key'":''); break;
  case 'PUT':
    $sql = "update `$table` set $set where ".($key?"$fld='$key'":"0=1"); break;
  case 'POST':
    $sql = "insert into `$table` set $set"; break;
  case 'DELETE':
    $sql = "delete from `$table` where ".($key?"$fld='$key'":"0=1"); break;
}

// execute SQL statement
$result = mysqli_query($conn,$sql);
if ($result) {
	if ($method == 'GET') {
		header('Content-Type: application/json');
		echo '[';
		for ($i=0;$i<mysqli_num_rows($result);$i++) {
			echo ($i>0?',':'').json_encode(mysqli_fetch_object($result));
		}
		echo ']';
	} elseif ($method == 'POST') {
		echo mysqli_insert_id($conn);
	} else {
		echo mysqli_affected_rows($conn);
	}
}

// close mysql connection
mysqli_close($conn);
?>
