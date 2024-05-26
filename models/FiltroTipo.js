const db = require('./db');

const FiltroTipo = db.sequelize.define('filtro_tipo', {
    id_filtro_tipo: {
        type: db.DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true
    },
    tipo_nome: {
        type: db.DataTypes.STRING(45),
        defaultValue: null
    }
})
const Filtro = require('./Filtro')
FiltroTipo.hasMany(Filtro, { foreignKey: 'filtro_tipo_id_filtro_tipo' });


module.exports = FiltroTipo