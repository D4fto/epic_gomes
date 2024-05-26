const Jogo = require('./Jogo')
const PrecoJogo = require('./Preco_jogo')
const sequelize = require('./db')
const JogoHasFiltro = require('./JogoHasFiltro')
  
function select_jogos(pesquisa="",preco=-1,filtros=[],hidef2p=false,spc_offers=false){
  let includes = [{
    model: PrecoJogo,
    attributes: ['preco_jogo'],
    duplicating: false,
    where: sequelize.Sequelize.literal(`data_preco_jogo = (SELECT MAX(data_preco_jogo) FROM preco_jogos WHERE preco_jogos.jogos_id_jogos = jogos.id_jogos)`)
  }]
  if (filtros.length > 0){
    primeiro = filtros.shift()
    let filtrosclause="`jogos`.`id_jogos` = `jogo_has_filtros`.`jogos_id_jogos` AND `jogo_has_filtros`.`filtros_id_filtro` = "+primeiro
    
    filtros.forEach(element => {
      filtrosclause+=" INNER JOIN `jogo_has_filtros` AS `jhf"+element+"` ON `jogos`.`id_jogos` = `jhf"+element+"`.`jogos_id_jogos` AND `jhf"+element+"`.`filtros_id_filtro` = "+element
    });
    includes.push({
      model: JogoHasFiltro,
      where: sequelize.Sequelize.literal(filtrosclause),
      attributes: []
    },)
  }
  let wherefinal = {
    status_id_status: 1
  };
  if (pesquisa !== "") {
    wherefinal.nome = { [sequelize.Sequelize.Op.substring]: pesquisa };
  }
  filtrar_preco = {}
  if (preco != -1 || hidef2p) {
    let hide=-1
    let precificar="or 1=1"
    if (hidef2p){
      hide=0
    }
    if (preco != -1){
      precificar="`preco_jogos`.`preco_jogo`-`preco_jogos`.`preco_jogo`*(`jogos`.`desconto`/100) <= "+preco
    }
    wherefinal['$preco_jogos.preco_jogo$'] = { 
      [sequelize.Sequelize.Op.and]: [{
        [sequelize.Sequelize.Op.or]: [{[sequelize.Sequelize.Op.lte]: preco},sequelize.Sequelize.literal(precificar)]
      },
      {

        [sequelize.Sequelize.Op.gt]: hide 
      }
      ]
    };
  }
  
  if (spc_offers) {
    wherefinal.desconto = { [sequelize.Sequelize.Op.gt]: 0 };
  }
  return Jogo.findAll({
    attributes: [
      'id_jogos',
      'nome',
      'cover_img',
      'desconto',
      'avaliacao',
      'desenvolvedor',
      'descricao',
      [sequelize.Sequelize.literal('(qtd_vendas * 0.1) * (desconto + 1) * (avaliacao * 10)'), 'score'],],
      include: includes,
      where: wherefinal,
      group: ['id_jogos', 'preco_jogos.data_preco_jogo'],
      order: sequelize.Sequelize.literal('score DESC')
    })   
  }
  
module.exports = { select_jogos }


