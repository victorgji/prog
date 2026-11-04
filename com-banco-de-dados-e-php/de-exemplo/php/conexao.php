<?php
$host = 'localhost';
$usuario = 'root';
$senha = '';
$banco = 'vitrine_digital';

try {
    $pdo = new PDO("mysql:host=$host; dbname=$banco; charset=utf8mb4", $usuario, $senha);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Erro de conexão: " . $e->getMessage();
    exit;
}
?>