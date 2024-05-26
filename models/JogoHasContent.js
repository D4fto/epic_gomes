const db = require('./db');

const JogoHasContent = db.sequelize.define('jogo_has_contents', {
    jogos_id_jogos: {
        type: db.DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false
    },
    ordem: {
        type: db.DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false
    },
    content: {
        type: db.DataTypes.TEXT
    }
})
module.exports = JogoHasContent