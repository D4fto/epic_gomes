const db = require('./db');

const UsuarioHasJogos = db.sequelize.define('usuario_has_jogos', {
    usuario_email: {
        type: db.DataTypes.STRING(345),
        primaryKey: true,
        allowNull: false
    },
    jogos_id_jogos: {
        type: db.DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false
    },
    tempo_jogo: {
        type: db.DataTypes.INTEGER
    },
    ultima_sessao: {
        type: db.DataTypes.DATE
    }
})
module.exports = UsuarioHasJogos