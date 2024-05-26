const db = require('./db');

const Status = db.sequelize.define('status', {
    id_status: {
        type: db.DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true
    },
    nome_status: {
        type: db.DataTypes.STRING(45),
        defaultValue: null
    },
    tipo_status_id_tipo_status: {
        type: db.DataTypes.INTEGER,
        allowNull: false
    }
})
const Usuario = require('./Usuario')
const Pedidos = require('./Pedidos')
const Analises = require('./Analises')
const Jogo = require('./Jogo')
Status.hasMany(Usuario, {foreignKey: 'status_id_status'})
Status.hasMany(Pedidos, {foreignKey: 'status_id_status'})
Status.hasMany(Analises, {foreignKey: 'status_id_status'})
Status.hasMany(Jogo, {foreignKey: 'status_id_status'})

module.exports = Status