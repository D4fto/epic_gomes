function isMobileDevice() {
    // Verifica se o tamanho da tela é pequeno (geralmente, dispositivos móveis têm telas menores)
    if (window.matchMedia("(max-width: 767px)").matches) {
        return true;
    }

    // Verifica se o agente do usuário contém palavras-chave comuns de dispositivos móveis
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
        return true;
    }

    // Se nenhum dos métodos anteriores detectar um dispositivo móvel, retorna falso
    return false;
}
// Adiciona uma classe ao corpo se for um celular
if (isMobileDevice()) {
    document.documentElement.style.setProperty('--100vw', '100vw');
}
function normalizar(str){
    return str.replaceAll(' ','_').replaceAll(/[^a-zA-Z0-9_]/g,'')
}