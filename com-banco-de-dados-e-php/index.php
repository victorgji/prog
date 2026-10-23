<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>VitrineDigital - Portal de Anúncios e Serviços Locais</title>
        
        <!-- Importação de ícones (FontAwesome) e fontes (Google Fonts Inter) -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

        <!-- Folha de estilo externa -->
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body id="inicio">

        <!-- CABEÇALHO DA PÁGINA -->
        <header>
            <div class="header-container">
                <a href="#inicio" class="logo">
                    <div class="logo-icon">
                        <i class="fa-solid fa-store"></i>
                    </div>
                    <span>VitrineDigital</span>
                </a>
                <nav>
                    <ul class="nav-menu">
                        <li><a href="#inicio" class="nav-link">Início</a></li>
                        <li><a href="#categorias" class="nav-link">Categorias</a></li>
                        <li><a href="#anunciantes" class="nav-link">Anunciantes</a></li>
                        <li><a href="#contato" class="nav-link">Contato</a></li>
                        <li><a href="#anuncie" class="nav-link nav-btn">Anuncie Aqui</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <!-- SEÇÃO HERO (Apresentação Principal) -->
        <section class="hero">
            <div class="hero-content">
                <div class="hero-badge">
                    <i class="fa-solid fa-sparkles"></i> Sua Vitrine Comercial Online
                </div>
                <h1>Ache tudo o que precisa perto de você</h1>
                <p>Conectando os melhores restaurantes, serviços, comércios e profissionais da cidade em um único lugar visual e moderno.</p>
            </div>
        </section>

        <!-- SEÇÃO PRINCIPAL DE CONTEÚDO E FILTROS -->
        <main class="container" id="categorias">
            <div class="section-header">
                <h2 class="section-title">Explore por Categorias</h2>
                <p class="section-subtitle">Filtre os melhores estabelecimentos da cidade com um clique</p>
            </div>

            <?php
            // Inclui a conexão apontando para a pasta 'php'
            include 'php/conexao.php';
            // Pega a categoria selecionada na URL (se houver)
            $categoria_atual = isset($_GET['cat']) ? $_GET['cat'] : 'all';
            ?>

            <!-- Botões interativos de Filtro por Categoria -->
            <div class="category-pills">
                <a href="index.php" class="pill-label <?php echo ($categoria_atual == 'all') ? 'active' : ''; ?>">
                    <i class="fa-solid fa-grid-2"></i> Todas
                </a>
                
                <?php
                $stmt_cat = $pdo->query("SELECT * FROM categorias");
                while($cat = $stmt_cat->fetch(PDO::FETCH_ASSOC)) {
                    $ativo = ($categoria_atual == $cat['slug']) ? 'active' : '';
                    echo '<a href="index.php?cat='.$cat['slug'].'" class="pill-label '.$ativo.'">';
                    echo '<i class="fa-solid '.$cat['icone'].'"></i> '.$cat['nome'];
                    echo '</a>';
                }
                ?>
            </div>

            <div class="section-header" id="anunciantes">
                <h2 class="section-title">Anúncios em Destaque</h2>
            </div>

            <!-- GRADE DE CARTÕES DOS ANUNCIANTES -->
            <div class="ads-grid">
                <?php
                // Prepara a consulta SQL com base no filtro selecionado
                if ($categoria_atual != 'all') {
                    $sql = "SELECT a.*, c.slug as cat_slug, c.nome as cat_nome 
                            FROM anuncios a 
                            JOIN categorias c ON a.categoria_id = c.id 
                            WHERE c.slug = :slug";
                    $stmt = $pdo->prepare($sql);
                    $stmt->execute(['slug' => $categoria_atual]);
                } else {
                    $sql = "SELECT a.*, c.slug as cat_slug, c.nome as cat_nome 
                            FROM anuncios a 
                            JOIN categorias c ON a.categoria_id = c.id";
                    $stmt = $pdo->query($sql);
                }

                // Exibe os anúncios encontrados
                while($anuncio = $stmt->fetch(PDO::FETCH_ASSOC)) {
                ?>
                    <article class="card <?php echo $anuncio['cat_slug']; ?>">
                        <div class="card-header">
                            <img src="<?php echo $anuncio['imagem']; ?>" alt="<?php echo $anuncio['titulo']; ?>" class="card-img">
                            <div class="card-header-text">
                                <h3 class="card-title"><?php echo $anuncio['titulo']; ?></h3>
                                <span class="card-badge"><?php echo $anuncio['cat_nome']; ?></span>
                            </div>
                        </div>
                        <div class="card-body">
                            <p class="card-desc"><?php echo $anuncio['descricao']; ?></p>
                        </div>
                        <div class="card-footer">
                            <span class="card-location"><i class="fa-solid fa-location-dot"></i> <?php echo $anuncio['localizacao']; ?></span>
                            <a href="#modal-<?php echo $anuncio['id']; ?>" class="card-btn">Ver Anúncio <i class="fa-solid fa-arrow-right"></i></a>
                        </div>
                    </article>
                <?php } ?>
            </div>
        </main>

        <!-- MODAIS INDIVIDUAIS DOS ANUNCIANTES -->
        <?php
        // Consulta novamente para gerar os modais correspondentes
        $stmt_modals = $pdo->query("SELECT * FROM anuncios");
        while($mod = $stmt_modals->fetch(PDO::FETCH_ASSOC)) {
        ?>
            <div class="modal-overlay" id="modal-<?php echo $mod['id']; ?>">
                <div class="modal-card">
                    <a href="#anunciantes" class="modal-close">&times;</a>
                    <div class="modal-header-bg"></div>
                    <div class="modal-body">
                        <img src="<?php echo $mod['imagem']; ?>" alt="<?php echo $mod['titulo']; ?>" class="modal-avatar">
                        <div class="modal-title-area">
                            <h2 class="modal-title"><?php echo $mod['titulo']; ?></h2>
                            <div class="modal-meta">
                                <span class="modal-meta-item"><i class="fa-solid fa-location-dot"></i> <?php echo $mod['localizacao']; ?></span>
                            </div>
                        </div>
                        <div class="modal-section">
                            <h3 class="modal-section-title">Sobre a Empresa</h3>
                            <p><?php echo $mod['sobre']; ?></p>
                        </div>
                        <div class="modal-actions">
                            <a href="https://wa.me/<?php echo $mod['whatsapp']; ?>" target="_blank" class="btn-whatsapp">
                                <i class="fa-brands fa-whatsapp"></i> Contato via WhatsApp
                            </a>
                            <a href="#anunciantes" class="btn-outline">Voltar</a>
                        </div>
                    </div>
                </div>
            </div>
        <?php } ?>

        <!-- ÁREA "ANUNCIE CONOSCO" -->
        <section class="container" id="anuncie">
            <div class="advertise-section">
                <div class="advertise-info">
                    <h2>Quer divulgar sua empresa aqui?</h2>
                    <p>Junte-se a centenas de comércios e profissionais que diariamente conquistam novos clientes através da nossa vitrine digital.</p>

                    <ul class="benefit-list">
                        <li class="benefit-item"><i class="fa-solid fa-circle-check"></i> Anúncio com visual moderno e cativante</li>
                        <li class="benefit-item"><i class="fa-solid fa-circle-check"></i> Página individual própria com fotos e dados</li>
                        <li class="benefit-item"><i class="fa-solid fa-circle-check"></i> Botão direto para o seu WhatsApp corporativo</li>
                    </ul>
                </div>

                <div class="ad-form">
                    <form action="#inicio" method="get">
                        <div class="form-group">
                            <label class="form-label" for="nome">Seu Nome *</label>
                            <input type="text" id="nome" name="nome" class="form-control" placeholder="Ex: Carlos Silva" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="empresa">Nome da Empresa *</label>
                            <input type="text" id="empresa" name="empresa" class="form-control" placeholder="Ex: Mercado Central" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="whatsapp">Telefone / WhatsApp *</label>
                            <input type="tel" id="whatsapp" name="whatsapp" class="form-control" placeholder="(00) 90000-0000" required>
                        </div>

                        <button type="submit" class="btn-submit">
                            <i class="fa-solid fa-paper-plane"></i> Quero Anunciar Minha Empresa
                        </button>
                    </form>
                </div>
            </div>
        </section>

        <!-- RODAPÉ -->
        <footer id="contato">
            <div class="footer-grid">
                <div class="footer-brand">
                    <a href="#inicio" class="logo" style="color:#ffffff;">
                        <div class="logo-icon">
                            <i class="fa-solid fa-store"></i>
                        </div>
                        <span>VitrineDigital</span>
                    </a>
                    <p>O maior portal de anúncios e vitrine digital de comércios e prestadores de serviços locais da região.</p>
                </div>

                <div>
                    <h4 class="footer-title">Navegação</h4>
                    <ul class="footer-links">
                        <li><a href="#inicio">Início</a></li>
                        <li><a href="#categorias">Categorias</a></li>
                        <li><a href="#anunciantes">Anunciantes</a></li>
                        <li><a href="#anuncie">Anuncie Conosco</a></li>
                    </ul>
                </div>

                <div>
                    <h4 class="footer-title">Atendimento</h4>
                    <ul class="footer-links">
                        <li><a href="https://wa.me/5545999999999" target="_blank"><i class="fa-brands fa-whatsapp"></i> (45) 99999-9999</a></li>
                        <li><a href="mailto:contato@vitrinedigital.com.br"><i class="fa-solid fa-envelope"></i> contato@vitrinedigital.com.br</a></li>
                    </ul>
                </div>
            </div>

            <div class="footer-bottom">
                <p>&copy; 2026 VitrineDigital - Todos os direitos reservados.</p>
            </div>
        </footer>

    </body>
</html>