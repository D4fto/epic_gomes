const db = require('./db');
const Jogo = db.sequelize.define('jogos', {
    id_jogos: {
        type: db.DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true
    },
    nome: {
        type: db.DataTypes.STRING(60),
        defaultValue: null
    },
    qtd_vendas: {
        type: db.DataTypes.INTEGER,
        defaultValue: '0'
    },
    cover_img: {
        type: db.DataTypes.TEXT,
        defaultValue: null
    },
    desconto: {
        type: db.DataTypes.DOUBLE,
        defaultValue: '0'
    },
    Data_lancamento: {
        type: db.DataTypes.DATEONLY,
        defaultValue: null
    },
    avaliacao: {
        type: db.DataTypes.FLOAT,
        defaultValue: '-1'
    },
    desenvolvedor: {
        type: db.DataTypes.STRING(200),
        defaultValue: null
    },
    descricao: {
        type: db.DataTypes.TEXT,
        defaultValue: null
    },
    status_id_status: {
        type: db.DataTypes.INTEGER,
        allowNull: false
    }
})
const Precojogo = require('./Preco_jogo')
const JogoHasFiltro = require('./JogoHasFiltro')
const JogoHasContent = require('./JogoHasContent')
const PedidoHasJogo = require('./PedidoHasJogo')
const Analises = require('./Analises')
const UsuarioHasJogos = require('./UsuarioHasJogos')
Jogo.hasMany(Precojogo, { foreignKey: 'jogos_id_jogos' });
Jogo.hasMany(JogoHasFiltro, { foreignKey: 'jogos_id_jogos' });
Jogo.hasMany(JogoHasContent, { foreignKey: 'jogos_id_jogos' });
Jogo.hasMany(PedidoHasJogo, { foreignKey: 'jogos_id_jogos' });
Jogo.hasMany(Analises, { foreignKey: 'jogos_id_jogos' });
Jogo.hasMany(UsuarioHasJogos, { foreignKey: 'jogos_id_jogos' });




module.exports = Jogo