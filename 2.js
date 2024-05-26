(async ()=> {
    const Jogo = require('./models/Jogo');
    const jogos = Jogo.findAll({raw: true})
    return jogos
})();
