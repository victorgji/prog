// ==========================================================================
// JAVASCRIPT DO FRONT-END (Filtro Dinâmico de Categorias)
// ==========================================================================
document.addEventListener('DOMContentLoaded', () => {
    // Seleciona todos os botões de filtro (pills) e todos os cards de anúncios
    const filterButtons = document.querySelectorAll('.category-pills .pill-label');
    const adCards = document.querySelectorAll('.ads-grid .card');

    // Itera sobre cada botão de categoria para escutar o evento de clique
    filterButtons.forEach(button => {
        button.addEventListener('click', () => {
            // Remove a classe 'active' de todos os botões de filtro
            filterButtons.forEach(btn => btn.classList.remove('active'));
            
            // Adiciona a classe 'active' apenas no botão que foi clicado
            button.classList.add('active');

            // Lê o valor do filtro a partir do atributo data-filter do botão
            const filterCategory = button.getAttribute('data-filter');

            // Avalia cada card de anúncio para decidir se deve exibi-lo ou ocultá-lo
            adCards.forEach(card => {
                // Se o filtro for 'all' ou se o card possuir a classe correspondente à categoria
                if (filterCategory === 'all' || card.classList.contains(filterCategory)) {
                    card.style.display = 'flex';
                    
                    // Pequeno efeito visual de transição suave (fade-in e escala)
                    card.style.opacity = '0';
                    card.style.transform = 'translateY(10px)';
                    setTimeout(() => {
                        card.style.opacity = '1';
                        card.style.transform = 'translateY(0)';
                    }, 50);
                } else {
                    // Oculta o card caso não pertença à categoria selecionada
                    card.style.display = 'none';
                }
            });
        });
    });
});