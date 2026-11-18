<?php
$host = '';
$usuario = '';
$senha = '';
$banco = '';

try {
    $pdo = new PDO("mysql:host=$host; dbname=$banco; charset=utf8mb4", $usuario, $senha);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Erro de conexão: " . $e->getMessage();
    exit;
}
?>