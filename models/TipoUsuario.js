const db = require('./db');

const TipoUsuario = db.sequelize.define('tipo_usuario', {
    id_tipo_usuario: {
        type: db.DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true
    },
    nome: {
        type: db.DataTypes.STRING(45),
        defaultValue: null
    }
})
const Usuario = require('./Usuario')
TipoUsuario.hasMany(Usuario, { foreignKey: 'tipo_usuario_id_tipo_usuario' });


module.exports = TipoUsuario