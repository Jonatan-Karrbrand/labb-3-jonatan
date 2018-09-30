<?php
try {
  $dbh = new PDO("mysql: host=localhost; dbname=fish_store; charset=utf8", "user", "password");
} catch (PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}
?>
