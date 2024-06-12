const db = require('./db');

const Error404 = db.sequelize.define('erro_404', {
    nome: {
        type: db.DataTypes.STRING(5),
        primaryKey: true,
        allowNull: false,
    },
    createdAt: {
        type: db.DataTypes.DATE,
        primaryKey: true,
        allowNull: false,
    },
    pontos: {
        type: db.DataTypes.INTEGER,
    },
    precisao: {
        type: db.DataTypes.FLOAT,
    },
    pontos_tipo_id_pontos_tipo: {
        type: db.DataTypes.INTEGER,
        allowNull: false
    }
}, {
    timestamps: true,
    createdAt: 'createdAt',
    updatedAt: 'updatedAt',
    freezeTableName: true
})
module.exports = Error404