const db = require('./db');
const Analises = db.sequelize.define('analises', {
    id_analise: {
        type: db.DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true
    },
    usuario_email: {
        type: db.DataTypes.STRING(200),
        allowNull: false
    },
    jogos_id_jogos: {
        type: db.DataTypes.INTEGER,
        allowNull: false
    },
    texto: {
        type: db.DataTypes.TEXT,
    },
    avaliacao: {
        type: db.DataTypes.INTEGER,
    },
    status_id_status: {
        type: db.DataTypes.INTEGER,
        allowNull: false
    }
}, {
    timestamps: true,
    createdAt: 'createdAt',
    updatedAt: 'updatedAt'
});
// async function insertAnalise() {
//     try {
//         const novaAnalise = await Analises.create({
//             usuario_email: '111@gmail.com',
//             jogos_id_jogos: 620,
//             texto: 'Esta é uma análise de exemplo.',
//             avaliacao: 1,
//             status_id_status: 11
//         });
//         console.log('Nova análise inserida com sucesso:', novaAnalise.toJSON());
//     } catch (error) {
//         console.error('Erro ao inserir nova análise:', error);
//     }
// }

// // Chama a função para inserir a análise
// insertAnalise();
module.exports = Analises