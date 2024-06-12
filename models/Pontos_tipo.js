const db = require('./db');

const PontosTipo = db.sequelize.define('pontos_tipos', {
    id_pontos_tipo: {
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
const Erro404 = require('./Erro_404')
PontosTipo.hasMany(Erro404, { foreignKey: 'pontos_tipo_id_pontos_tipo' });

module.exports = PontosTipo