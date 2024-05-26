const db = require('./db');

const Precojogo = db.sequelize.define('preco_jogo', {
    jogos_id_jogos: {
        type: db.DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false
    },
    data_preco_jogo: {
        type: db.DataTypes.DATEONLY,
        primaryKey: true,
        allowNull: false
    },
    preco_jogo: {
        type: db.DataTypes.DOUBLE,
    }
})
module.exports = Precojogo