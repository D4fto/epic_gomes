const db = require('./db');

const Pedidos = db.sequelize.define('pedidos', {
    id_pedido: {
        type: db.DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true
    },
    usuario_email: {
        type: db.DataTypes.STRING(345),
        allowNull: false
    },
    data_hora_pedido: {
        type: db.DataTypes.DATE
    },
    status_id_status: {
        type: db.DataTypes.INTEGER,
        allowNull: false,
    }
})
module.exports = Pedidos
const PedidoHasJogo = require('./PedidoHasJogo')
Pedidos.hasMany(PedidoHasJogo, {foreignKey: 'pedido_id_pedido'})