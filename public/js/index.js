function isMobileDevice() {
    // Verifica se o tamanho da tela é pequeno (geralmente, dispositivos móveis têm telas menores)

    // Verifica se o agente do usuário contém palavras-chave comuns de dispositivos móveis
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
        return true;
    }

    // Se nenhum dos métodos anteriores detectar um dispositivo móvel, retorna falso
    return false;
}
// Adiciona uma classe ao corpo se for um celular
if (isMobileDevice()) {
    document.documentElement.style.setProperty('--cor9', 'blue');
}