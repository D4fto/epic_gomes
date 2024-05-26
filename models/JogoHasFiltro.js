const db = require('./db');

const JogoHasFiltro = db.sequelize.define('jogo_has_filtro', {
    jogos_id_jogos: {
        type: db.DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false
    },
    filtros_id_filtro: {
        type: db.DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false
    }
})
module.exports = JogoHasFiltro