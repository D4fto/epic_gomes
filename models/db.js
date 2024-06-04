const Sequelize = require('sequelize');
const sequelize = new Sequelize('epic_gomes4','epic_gomes_user4','9sb9PC.CsU2bpQm', {
    host:'db4free.net',
    dialect: 'mysql',
    define: {
        timestamps: false,

    }
})
sequelize.authenticate().then((result) => {
    console.log('conectado com sucesso')
}).catch((err) => {
    console.log(err)
});
const { DataTypes } = require('sequelize');
module.exports = {
    Sequelize: Sequelize,
    sequelize: sequelize,
    DataTypes: DataTypes
}