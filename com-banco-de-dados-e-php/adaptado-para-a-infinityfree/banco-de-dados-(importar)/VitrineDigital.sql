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
INSERT INTO anuncios (categoria_id, titulo, descricao, localizacao, imagem, whatsapp, sobre) VALUES 
-- Categoria 1: Alimentação
(1, 'Sabor Caseiro', 'Comida típica feita no fogão a lenha, marmitex executiva e self-service de qualidade.', 'Centro', 'imgs/alimentos/sabor-caseiro.jpeg', '5545999999999', 'O Restaurante Sabor Caseiro traz há mais de 12 anos o melhor da culinária tradicional brasileira para a sua mesa.'),
(1, 'Bella Pizza Artesanal', 'Pizzas com massa de fermentação natural, ingredientes selecionados e entrega rápida.', 'Bairro Jardim', 'imgs/alimentos/bella-pizza.jpeg', '5545999999999', 'Pizzas com longa fermentação de 48 horas, massa leve, crocante e ingredientes italianos selecionados.'),
(1, 'Burger Prime Grill', 'Hambúrgueres artesanais grelhados no fogo forte, molhos especiais e batatas rústicas.', 'Av. Brasil', 'imgs/alimentos/burger-prime.jpeg', '5545999999999', 'Hambúrgueres artesanais de carne 100% Angus preparados na grelha, acompanhados de porções generosas e milk-shakes.'),
(1, 'Sakura Sushi Bar', 'Combinados de culinária japonesa, sushis frescos, temakis e pratos quentes asiáticos.', 'Alto Alegre', 'imgs/alimentos/sakura-sushi.jpeg', '5545999999999', 'Especializado na verdadeira gastronomia oriental, oferecendo peixes frescos e variados todos os dias em ambiente climatizado.'),
(1, 'Padaria Pão D''Oro', 'Pães quentinhos a toda hora, cafés especiais, tortas doces, salgados e buffet de café da manhã.', 'Vila Nova', 'imgs/alimentos/padaria-pao-doro.jpeg', '5545999999999', 'Tradição em pães especiais, confeitaria fina e salgados. Atendemos também encomendas de bolos para festas e eventos.'),

-- Categoria 2: Automóveis
(2, 'Auto Center Imperial', 'Mecânica geral, alinhamento, balanceamento, troca de óleo e diagnóstico computadorizado.', 'Distrito Industrial', 'imgs/automoveis/auto-center-imperial.jpeg', '5545999999999', 'Oficina completa especializada em injeção eletrônica, freios ABS, suspensão e revisão preventiva.'),
(2, 'Lava Rápido EcoShine', 'Lavagem ecológica a seco, higienização interna de estofados, polimento e vitrificação de pintura.', 'Centro', 'imgs/automoveis/lava-rapido-ecoshine.jpeg', '5545999999999', 'Estética automotiva focada em sustentabilidade com produtos biodegradáveis, higienização interna e cera de carnaúba.'),
(2, 'Pneus & Cia', 'Venda de pneus multimarcas, montagem, cambagem, desempeno de rodas e suspensão completa.', 'Av. das Américas', 'imgs/automoveis/pneus-e-cia.jpeg', '5545999999999', 'O maior estoque de pneus da cidade com alinhamento 3D e balanceamento computadorizado com garantia.'),
(2, 'Funilaria & Pintura Express', 'Reparos rápidos de funilaria, martelinho de ouro, restauração de parachoques e pintura estufa.', 'São Cristóvão', 'imgs/automoveis/funilaria-pintura.jpeg', '5545999999999', 'Recuperação de veículos batidos, polimento técnico e eliminação de amassados sem danificar a pintura original.'),
(2, 'Auto Elétrica Spark', 'Manutenção de alternadores, motores de partida, baterias, ar-condicionado e instalação de som.', 'Bairro Cancelli', 'imgs/automoveis/auto-eletrica-spark.jpeg', '554599999999', 'Soluções em parte elétrica automotiva, socorro para baterias arriadas e manutenção em vidros e travas elétricas.'),

-- Categoria 3: Beleza & Estética
(3, 'Espaço Bella Vita', 'Cabelo, maquiagem social e noivas, limpeza de pele profunda e tratamentos corporais.', 'Jardins', 'imgs/beleza-estetica/espaco-bella-vita.jpeg', '5545999999999', 'Salão de beleza e estética completa para cuidados faciais, capilares e corporais.'),
(3, 'Barbearia Vintage Club', 'Cortes masculinos modernos, barba com toalha quente, pigmentação e ambiente exclusivo.', 'Centro', 'imgs/beleza-estetica/barbearia-vintage.jpeg', '5545999999999', 'Barbearia clássica com conceito moderno. Atendimento com bebidas geladas, sinuca e profissionais especialistas.'),
(3, 'Studio Esmalteria Real', 'Manicure, pedicure, banho de gel, fibra de vidro, nail art e spa dos pés relaxante.', 'Vila Industrial', 'imgs/beleza-estetica/esmalteria-real.jpeg', '5545999999999', 'Especialistas em alongamento em fibra de vidro, blindagem de unhas e spa com hidratação profunda.'),
(3, 'Clínica Renovare Estética', 'Depilação a laser, harmonização facial, drenagem linfática, microagulhamento e Botox.', 'Parque Verde', 'imgs/beleza-estetica/clinica-renovare.jpeg', '5545999999999', 'Tecnologias de ponta para estética facial e corporal com acompanhamento profissional qualificado.'),
(3, 'Studio Cílios & Sobrancelhas', 'Extensão de cílios volume russo, design de sobrancelhas com henna e micropigmentação labial.', 'Bairro Tropical', 'imgs/beleza-estetica/cilios-sobrancelhas.jpeg', '5545999999999', 'Realçando a beleza do seu olhar com procedimentos seguros, duradouros e personalizados.'),

-- Categoria 4: Construção
(4, 'Construtora Valor', 'Projetos arquitetônicos, engenharia civil, reformas residenciais e comerciais completas.', 'Centro', 'imgs/construcao/construtora-valor.jpeg', '5545999999999', 'Execução completa de projetos arquitetônicos e reformas residenciais e comerciais.'),
(4, 'Depositão da Construção', 'Do básico ao acabamento: cimento, tijolos, tintas, tubos, conexões e ferramentas com entrega rápida.', 'Bairro Neva', 'imgs/construcao/deposito-construcao.jpeg', '5545999999999', 'Tudo para sua obra com os melhores preços da região e facilidade no pagamento em até 12x.'),
(4, 'EletroVolt Elétrica & Energia', 'Serviços de eletricista predial e industrial, instalação de painéis solares e quadros de força.', 'Bairro Coqueiral', 'imgs/construcao/eletrovolt.jpeg', '5545999999999', 'Projetos elétricos completos, laudos técnicos e instalação de usinas solares fotovoltaicas.'),
(4, 'Marmoraria Requinte', 'Bancadas de cozinha, pias para banheiro, escadas e soleiras em granito, mármore e quartzo.', 'Distrito Industrial', 'imgs/construcao/marmoraria-requinte.jpeg', '5545999999999', 'Corte preciso e acabamento impecável em rochas ornamentais para cozinhas, banheiros e fachadas.'),
(4, 'Vidraçaria Transparência', 'Box de vidro temperado, espelhos sob medida, janelas, portas de alumínio e guarda-corpos.', 'Bairro FAG', 'imgs/construcao/vidracaria-transparencia.jpeg', '5545999999999', 'Soluções modernas em vidros temperados, laminados e esquadrias de alumínio sob medida.'),

-- Categoria 5: Eletrônicos & Informática
(5, 'TechFix Informática', 'Manutenção de notebooks, computadores gamers, formatação, troca de tela e limpeza.', 'Galeria Central', 'imgs/eletronicos-informatica/techfix.jpeg', '5545999999999', 'Assistência técnica especializada em notebooks, formatação, PCs Gamers e upgrades.'),
(5, 'CellPhone Doctor', 'Conserto de smartphones, troca de vidro e bateria, capas, películas e acessórios originais.', 'Centro', 'imgs/eletronicos-informatica/cellphone-doctor.jpeg', '5545999999999', 'Conserto rápido de celulares com peças de alta qualidade, troca de conector de carga e telas no mesmo day.'),
(5, 'GamerZone Store', 'Venda de consoles, jogos novos e usados, cadeiras gamers, periféricos RGB e assistência técnica.', 'Shopping Plaza', 'imgs/eletronicos-informatica/gamerzone.jpeg', '5545999999999', 'A loja definitiva para gamers com montagem personalizada de computadores de alta performance.'),
(5, 'Seguritech Câmeras & Alarmes', 'Instalação de câmeras CFTV Wi-Fi, sensores de presença, portões eletrônicos e fechaduras digitais.', 'Bairro Maria Luiza', 'imgs/eletronicos-informatica/seguritech.jpeg', '5545999999999', 'Proteja sua residência ou comércio com sistemas de monitoramento acessíveis pelo celular.'),
(5, 'Som & Imagem Pro', 'Instalação e automação de home theater, caixas de som de embutir, projetores e Smart TVs.', 'Bairro Country', 'imgs/eletronicos-informatica/som-imagem-pro.jpeg', '5545999999999', 'Projetos de som ambiente para estabelecimentos comerciais e salas de cinema residenciais completas.');