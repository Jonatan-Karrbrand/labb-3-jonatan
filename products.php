<?php

// Kollar api nyckel
if ($_GET['api-key'] == 'abc') {
  access();
}
else {
  echo "Ogiltlig api nyckel";
}

function access() {
  header('Content-Type: application/json');
  include_once('database.php');
  $conn = new PDO("mysql: host=localhost; dbname=fish_store; charset=utf8", "user", "password");

  if ($_GET['id']) {
    $id = "WHERE id = {$_GET['id']}";
  }
  elseif ($_GET['category']) {
    $WHERE = "WHERE category = '{$_GET['category']}'";
  }
  else {
    $WHERE = "WHERE 1";
  }

  if ($_GET['id'] && $_GET['category']) {
    echo "Du kan inte söka efter både id och kategori";
  }

  // Förbereda query
  // Kollar om det är till en eller flera produkter
  if (isset($id)) {
    // Hämtar först en gång för att få reda på vilken tabell att joina till och sedan hämtar resten
    $stmt = $dbh->prepare("
      SELECT *
      FROM products
      $id
    ");
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $category = $result[0]['category'];

    $stmt = $dbh->prepare("
      SELECT *
      FROM products
      JOIN $category
      ON products.id = $category.product_id
      $id
    ");
  }
  else {
    $stmt = $dbh->prepare("
    SELECT *
    FROM products
    $WHERE
    ");
  }

  // Kör, fetch, gör till JSON, skriv ut
  $stmt->execute();
  $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
  $result = json_encode($result);
  echo $result;

  // Uppdater pris
  if ($_GET['id'] && $_GET['update-price']) {
    $price = $_GET['update-price'];
    $id = $_GET['id'];

    try {
      // set the PDO error mode to exception
      $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

      $sql = "UPDATE products SET price='$price' WHERE id=$id";

      // Prepare statement
      $stmt = $conn->prepare($sql);

      // execute the query
      $stmt->execute();
    }
    catch(PDOException $e) {
      echo $sql . "<br>" . $e->getMessage();
    }
  }

  // Delete
  if ($_GET['id'] && $_GET['delete']) {
    $id = $_GET['id'];

    try {
      // set the PDO error mode to exception
      $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

      // sql to delete a record
      $sql = "DELETE FROM products WHERE id=$id";

      // use exec() because no results are returned
      $conn->exec($sql);
    }
    catch(PDOException $e) {
      echo $sql . "<br>" . $e->getMessage();
    }
  }
}
?>
