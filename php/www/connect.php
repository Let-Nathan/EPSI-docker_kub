<?php
    $host = getenv("DB_HOST") ?: "db";
    $username = getenv("DB_USER") ?: "root";
    $password = getenv("DB_PASS") ?: "root";
    $dbname = getenv("DB_NAME") ?: "gestion_produits";
    $sgbd = getenv("DB_TYPE") ?: "mysql"; // mysql ou pgsql

    try {
        $dsn = "$sgbd:host=$host;dbname=$dbname";

        // Connexion PDO
        $db = new PDO($dsn, $username, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        die("Erreur de connexion à la base de données : " . $e->getMessage());
    }
?>