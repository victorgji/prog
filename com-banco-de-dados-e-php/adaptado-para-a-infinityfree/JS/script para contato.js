function enviarParaWhatsApp(event) {
    // Impede a página de recarregar
    event.preventDefault();

    // Pega os valores digitados nos campos do formulário
    var nome = document.getElementById('nome').value;
    var empresa = document.getElementById('empresa').value;
    var whatsappCliente = document.getElementById('whatsapp').value;
    var descricao = document.getElementById('descrição').value;

    var meuWhatsApp = "55459991115615"; 

    // Monta a mensagem que chegará no meu WhatsApp
    var texto = "Olá! Gostaria de anunciar minha empresa no VitrineDigital.%0A%0A" +
                "*Nome:* " + encodeURIComponent(nome) + "%0A" +
                "*Empresa:* " + encodeURIComponent(empresa) + "%0A" +
                "*Descrição:* " + encodeURIComponent(descricao) + "%0A" +
                "*WhatsApp de Contato:* " + encodeURIComponent(whatsappCliente);

    // Abre o link do WhatsApp com a mensagem pronta
    var url = "https://wa.me/" + meuWhatsApp + "?text=" + texto;
    window.open(url, '_blank');
}
