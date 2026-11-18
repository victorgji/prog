CREATE DATABASE IF NOT EXISTS vitrine_digital CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE vitrine_digital;

-- Tabela de Categorias
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    slug VARCHAR(50) NOT NULL, 
    icone VARCHAR(50) NOT NULL 
);

-- Tabela de Anúncios
CREATE TABLE anuncios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT NOT NULL,
    localizacao VARCHAR(100) NOT NULL,
    imagem VARCHAR(255) NOT NULL,
    whatsapp VARCHAR(20) NOT NULL,
    sobre TEXT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Inserindo Categorias
INSERT INTO categorias (nome, slug, icone) VALUES 
('Alimentação', 'cat-alimentacao', 'fa-utensils'),
('Automóveis', 'cat-automoveis', 'fa-car'),
('Beleza & Estética', 'cat-beleza', 'fa-scissors'),
('Construção', 'cat-construcao', 'fa-helmet-safety'),
('Eletrônicos & Info', 'cat-eletronicos', 'fa-laptop');

-- Inserindo todos os Anúncios / Estabelecimentos com imagens locais na pasta "imgs"

--exemplos

INSERT INTO anuncios (categoria_id, titulo, descricao, localizacao, imagem, whatsapp, sobre) VALUES 
-- Categoria 1: Alimentação
--(1, 'Sabor Caseiro', 'Comida típica feita no fogão a lenha, marmitex executiva e self-service de qualidade.', 'Centro', 'imgs/alimentos/sabor-caseiro.jpeg', '5545999999999', 'O Restaurante Sabor Caseiro traz há mais de 12 anos o melhor da culinária tradicional brasileira para a sua mesa.'),
(2, 'Caetano Pneus e Acessórios', 'Soluções completas e ágeis para o seu veículo no bairro Santa Felicidade, Cascavel! Especialistas em serviços de borracharia, manutenção de excelência e comércio das melhores opções em rodas e acessórios automotivos da região.', 'R. Srg. Jose Bernardo Rosa, N° 199 Santa Felicidade-Cascavel-PR', 'imgs/automoveis/caetano-pneus.jpeg', '554598104186', 'nossa loja é o destino certo para quem busca segurança, desempenho e estilo para o carro. Somos referência em serviços completos de borracharia, oferecendo manutenções e reparos precisos com um atendimento rápido e de confiança. Além de cuidar da estrutura e da segurança do seu veículo, contamos com um catálogo diversificado de rodas e acessórios automotivos de alta qualidade para quem deseja personalizar e valorizar o automóvel. Nosso compromisso diário é aliar excelência técnica, transparência e preço justo, garantindo que você rode sempre com tranquilidade e conforto.');