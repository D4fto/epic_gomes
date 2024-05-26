const express = require('express');
const app = express();
const exphbs = require('express-handlebars');
const multer = require('multer');
const Selects = require('./models/Selects')
const Filtro = require('./models/Filtro')
const FiltroTipo = require('./models/FiltroTipo')
const bodyParser = require('body-parser')
const SECRET_KEY = process.env.SECRET_KEY;
const SESSION_SECRET = process.env.SESSION_SECRET;

//express
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended:false}))
        
//handlebars
app.engine('handlebars', exphbs.engine({
    defaultLayout:'default',
    helpers: {
        times: function(n, block) {
            let accum = '';
            for (let i = 0; i < n; ++i) {
                accum += block.fn(i);
            }
            return accum;
        },
        starRating: function(rating) {
            let stars = '';
            for (let i = 0; i < 5; i++) {
                if (rating > i) {
                    stars += '<i class="bi bi-star-fill"></i>';
                } else {
                    stars += '<i class="bi bi-star"></i>';
                }
            }
            return stars;
        },
        doPrice: function(price, desc){
            price2 = price[0].preco_jogo
            if (desc>0){
                return '<p class="preco_antigo">'+price2+'</p><p class="preco_atual">'+(price[0].preco_jogo-price[0].preco_jogo*(desc/100)).toFixed(2)+' <span>'+desc+'%</span></p>'
            }
            else if(price2==0){
                return '<p class="preco_atual">Gratuito para jogar</p>'
            }
            else{
                return '<p class="preco_atual">'+price2.toFixed(2)+'</p>'
            }
        },
        gerarFiltros: function(filtros, tipo, tipo_nome){
            filtroshtml=''
            filtros.forEach(element => {
                if (element.filtro_tipo_id_filtro_tipo == tipo){
                    filtroshtml+='<label for="'+tipo_nome+element.id_filtro+'" ><li><div class="checkbox naoselecionavel"><input class="'+tipo_nome+'_filtro filtro" type="checkbox" name="filtro'+element.id_filtro+'" id="'+tipo_nome+element.id_filtro+'"><label for="'+tipo_nome+element.id_filtro+'">'+element.nome+'</label></div></li></label>'
                }
            });
            return filtroshtml
        }
    }
}));
app.set('view engine', 'handlebars');
app.set('views', './views');

app.use(express.static('public'))
//multer
const storage = multer.diskStorage({
    destination: function(req, file, cb){
        cb(null,"uploads/")
    },
    filename: function(req, file, cb){
        cb(null, file.originalname+Date.now()+path.extname(file.originalname))
    }
});
const upload = multer({storage});

//rotas
app.get('/loja', async (req, res) => {
    let requisicoes=req.query
    let filtrosSelect=[]
    let chaves = Object.keys(requisicoes)
    if (!('spc_offer' in requisicoes)) {
        requisicoes.spc_offer = false;
    }
    if (!('hidef2p' in requisicoes)) {
        requisicoes.hidef2p = false;
    }
    if (!('search_game' in requisicoes)) {
        requisicoes.search_game = '';
    }
    if (!('preco' in requisicoes) || requisicoes.preco==130) {
        requisicoes.preco = -1;
    }
    chaves.forEach((element)=>{
        if (element.includes('filtro')){
            filtrosSelect.push(element.replace('filtro',''))
        }
        else if (requisicoes[element]=='on'){
            requisicoes[element]=true
        } 
    })

    try{
        let jogos = await Selects.select_jogos(requisicoes.search_game,requisicoes.preco,filtrosSelect,requisicoes.hidef2p,requisicoes.spc_offer)
        let filtrosm = await Filtro.findAll({raw:true})
        let filtersTypes= await FiltroTipo.findAll({raw:true})
        let jogos2 = jogos.map(jogos => jogos.get({ plain: true }));
        res.render('loja',{
            jogos: jogos2,
            filtros: filtrosm,
            filtrosTipos: filtersTypes,
            has_v:true,
            menu_horizontal: [{nome: 'Loja', rota: '/loja', ativo: true},{nome: 'Carrinho', rota: '/carrinho', ativo: false},{nome: 'Biblioteca', rota: '/biblioteca', ativo: false}]
        });

    } catch(err){
        res.send('erro: '+err)
        res.end()
    }
});
app.get('/carrinho', (req, res) => {
    res.render('carrinho',{has_v:false,menu_horizontal: [{nome: 'Loja', rota: '/loja', ativo: false},{nome: 'Carrinho', rota: '/carrinho', ativo: true},{nome: 'Biblioteca', rota: '/biblioteca', ativo: false}]});
});
app.get('/biblioteca', (req, res) => {
    res.render('biblioteca',{has_v:false,menu_horizontal: [{nome: 'Loja', rota: '/loja', ativo: false},{nome: 'Carrinho', rota: '/carrinho', ativo: false},{nome: 'Biblioteca', rota: '/biblioteca', ativo: true}]});
});
app.post('/receba',(req,res) => {
    res.redirect('/');
})
app.get('/login', (req,res)=>{
    res.render('login',{menu_horizontal: [{nome: 'login', rota: '', ativo: true}]})
})
app.get('/', (req,res) => {
 res.sendFile(__dirname+'/index.html')
}) 
app.listen(8080);