const db = require('./db');

const TipoStatus = db.sequelize.define('tipo_status', {
    id_tipo_status: {
        type: db.DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true
    },
    nome_tipo_status: {
        type: db.DataTypes.STRING(45),
        defaultValue: null
    }
})
const Status = require('./Status')
TipoStatus.hasMany(Status, { foreignKey: 'tipo_status_id_tipo_status' });

module.exports = TipoStatus