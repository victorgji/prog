<?php
$host = 'sql110.infinityfree.com';
$usuario = 'if0_43348981';
$senha = '';
$banco = 'if0_43348981_vitrine_digital';

try {
    $pdo = new PDO("mysql:host=$host; dbname=$banco; charset=utf8mb4", $usuario, $senha);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Erro de conexão: " . $e->getMessage();
    exit;
}
?>