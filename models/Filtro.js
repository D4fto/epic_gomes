const db = require('./db');

const Filtro = db.sequelize.define('filtros', {
    id_filtro: {
        type: db.DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true
    },
    nome: {
        type: db.DataTypes.STRING(60),
        defaultValue: null
    },
    filtro_tipo_id_filtro_tipo: {
        type: db.DataTypes.INTEGER,
        allowNull: false
    }
})
const JogoHasFiltro = require('./JogoHasFiltro')
Filtro.hasMany(JogoHasFiltro, { foreignKey: 'jogos_id_jogos' });


module.exports = Filtro