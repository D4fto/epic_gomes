const Sequelize = require('sequelize');
const sequelize = new Sequelize('pedro_henrique_tunes_degasperi_loja_jogos','root','464369', {
    host:'localhost',
    dialect: 'mysql',
    define: {
        timestamps: false,

    }
})
const { DataTypes } = require('sequelize');
module.exports = {
    Sequelize: Sequelize,
    sequelize: sequelize,
    DataTypes: DataTypes
}