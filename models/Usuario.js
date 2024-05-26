const db = require('./db');
const Usuario = db.sequelize.define('usuarios', {
    email: {
        type: db.DataTypes.STRING(345),
        primaryKey: true,
        allowNull: false
    },
    cpf_cnpj: {
        type: db.DataTypes.STRING(14),
        unique: true
    },
    data_nascimento: {
        type: db.DataTypes.DATEONLY
    },
    senha: {
        type: db.DataTypes.STRING(300)
    },
    nome_usuario: {
        type: db.DataTypes.STRING(64)
    },
    usuario_imagem: {
        type: db.DataTypes.TEXT
    },
    tipo_usuario_id_tipo_usuario: {
        type: db.DataTypes.INTEGER,
        allowNull: false
    },
    status_id_status: {
        type: db.DataTypes.INTEGER,
        allowNull: false
    }
})
const Pedidos = require('./Pedidos')
const Analises = require('./Analises')
const UsuarioHasJogos = require('./UsuarioHasJogos')
Usuario.hasMany(Pedidos, {foreignKey: 'usuario_email'})
Usuario.hasMany(Analises, {foreignKey: 'usuario_email'})
Usuario.hasMany(UsuarioHasJogos, {foreignKey: 'usuario_email'})
module.exports = Usuario