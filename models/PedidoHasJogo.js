const db = require('./db');

const PedidoHasJogo = db.sequelize.define('pedido_has_jogos', {
    jogos_id_jogos: {
        type: db.DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false
    },
    pedido_id_pedido: {
        type: db.DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false
    },
    email: {
        type: db.DataTypes.STRING(345)
    }
})
module.exports = PedidoHasJogo