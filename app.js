const express = require('express');
const app = express();
const exphbs = require('express-handlebars');
const multer = require('multer');
const Selects = require('./models/Selects')
const Filtro = require('./models/Filtro')
const FiltroTipo = require('./models/FiltroTipo')
const Usuario = require('./models/Usuario')
const bodyParser = require('body-parser')
var session = require('express-session');
const flash = require('connect-flash')
const argon2 = require('argon2')
const passport = require('passport')
const path = require('path')
require("./config/auth")(passport)
const {authenticated} = require("./helpers/authenticated")
var emailtemp
const SECRET_KEY = process.env.SECRET_KEY;
const SESSION_SECRET = process.env.SESSION_SECRET;
//flash
app.use(session({
    secret: SESSION_SECRET,
    resave: true,
    saveUninitialized: true
}));
app.use(passport.initialize())
app.use(passport.session())
app.use(flash())
//express
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended:false}))
app.use((req,res,next)=>{
    res.locals.success_msg = req.flash("success_msg")
    res.locals.error_msg = req.flash("error_msg")
    res.locals.error = req.flash('error')
    res.locals.user = req.user || null
    res.locals.imgs_local = "/assets/imgs/"
    next()
})


//handlebars
const helpers = {
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
app.engine('handlebars', exphbs.engine({defaultLayout:'default',helpers: helpers}));
app.set('view engine', 'handlebars');
app.set('views', './views');

app.use(express.static('public'))
//multer
const storage = multer.diskStorage({
    destination: function(req, file, cb){
        cb(null,"public/assets/imgs/")
    },
    filename: function(req, file, cb){
        arq=file.originalname.replaceAll(' ','_')+Date.now()+path.extname(file.originalname)
        cb(null, arq)
        if(!req.user){
            Usuario.update({usuario_imagem: arq},{where: {email: emailtemp}}).then((result) => {
                emailtemp = null
            })
        }
        else{
            Usuario.update({usuario_imagem: arq},{where: {email: req.user.email}})
        }
        
    }
});
const upload = multer({storage});

//rotas
    app.get('/home', async (req, res) => {
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
            res.render('home',{
                jogos: jogos2,
                filtros: filtrosm,
                filtrosTipos: filtersTypes,
                has_v:true,
                menu_horizontal: [{nome: 'Home', rota: '/home', ativo: true},{nome: 'Carrinho', rota: '/carrinho', ativo: false},{nome: 'Biblioteca', rota: '/biblioteca', ativo: false}]
            });

        } catch(err){
            res.send('erro: '+err)
            res.end()
        }
    });
    app.get('/carrinho', (req, res) => {
        console.log(req.isAuthenticated())
        if(req.isAuthenticated()){
            res.render('carrinho',{has_v:false,menu_horizontal: [{nome: 'Home', rota: '/home', ativo: false},{nome: 'Carrinho', rota: '', ativo: true},{nome: 'Biblioteca', rota: '/biblioteca', ativo: false}]});
        }
        else{
            res.redirect('/login')
        }
    });
    app.get('/biblioteca', (req, res) => {
        if(req.isAuthenticated()){
            res.render('biblioteca',{has_v:false,menu_horizontal: [{nome: 'Home', rota: '/home', ativo: false},{nome: 'Carrinho', rota: '/carrinho', ativo: false},{nome: 'Biblioteca', rota: '', ativo: true}]});
        }
        else{
            res.redirect('/login')
        }
    });
    app.get('/cadastro', (req,res) => {
        res.render('cadastro',{menu_horizontal: [{nome: 'Home', rota: '/home', ativo: false},{nome: 'Cadastro', rota: '', ativo: true}]})
    })
    app.get('/receba',(req,res) => {
        res.redirect('/')
    })
    app.get('/login', (req,res)=>{

        res.render('login',{menu_horizontal: [{nome: 'Home', rota: '/home', ativo: false},{nome: 'login', rota: '', ativo: true}]})
    })
    app.get('/', (req,res) => {
    res.redirect('/home')
    }) 
    app.post('/cadastro',async (req,res) => {
        var erros = []
        if(!req.body.user_name || typeof req.body.user_name == undefined || req.body.user_name == null){
            erros.push('Usuário não inserido')
        }
        if(!req.body.email || typeof req.body.email == undefined || req.body.email == null){
            erros.push('Email não inserido')
        }
        if(!req.body.senha || typeof req.body.senha == undefined || req.body.senha == null){
            erros.push('Senha não inserida')
        }
        if(req.body.senha != req.body.confirma_senha){
            erros.push('Senhas não batem')
        }
        if(!req.body.nascimento || typeof req.body.nascimento == undefined || req.body.nascimento == null){
            erros.push('Data de nascimento não inserida')
        }
        var email = await Usuario.findOne({attributes:['email'],where: {email: req.body.email}})
        var user = await Usuario.findOne({attributes:['nome_usuario'],where: {nome_usuario: req.body.user_name}})
        if(email!=null){
            erros.push('Email já utilizado')
        }
        if(user!=null){
            erros.push('Usuário já utilizado')
        }
        var hash
        try{
            hash = await argon2.hash(req.body.senha)
            console.log(hash)
        }
        catch{
            erros = ['Ocorreu um erro interno, tente novamente'] 
        }
        if(erros.length > 0){
            res.render('cadastro',{menu_horizontal: [{nome: 'Home', rota: '/home', ativo: false},{nome: 'Cadastro', rota: '', ativo: true}],
            erros:erros,
            user_name:req.body.user_name,
            email:req.body.email,
            senha:req.body.senha,
            confirma_senha:req.body.confirma_senha,
            nascimento:req.body.nascimento})
        }
        else{
            console.log(hash)
            Usuario.create({
                email: req.body.email,
                senha: hash,
                data_nascimento: req.body.nascimento,
                nome_usuario: req.body.user_name,
                tipo_usuario_id_tipo_usuario: 1,
                status_id_status: 3
            }).then((result) => {
                emailtemp = req.body.email 
                is_logged = true
                res.render('cadastro_img',{menu_horizontal: [{nome: 'Home', rota: '/home', ativo: false},{nome: 'Cadastro', rota: '', ativo: true}]})
            }).catch((err) => {
                res.render('cadastro',{menu_horizontal: [{nome: 'Home', rota: '/home', ativo: false},{nome: 'Cadastro', rota: '', ativo: true}],
                erros:err,
                user_name:req.body.user_name,
                email:req.body.email,
                senha:req.body.senha,
                confirma_senha:req.body.confirma_senha,
                nascimento:req.body.nascimento})
            });
        }
        
        
    })
    app.post('/finalizar_cadastro', upload.single("file"), (req,res) =>{
        req.flash("success_msg", "Usuário cadastrado com sucesso!")
        res.redirect('/login')
    })
    app.post('/login', (req,res,next) => {
        passport.authenticate("local", {
            successRedirect: "/conta",
            failureRedirect: '/login',
            failureFlash: true
        })(req, res, next)
    })
    app.get('/conta', authenticated, (req,res)=>{
        res.render('conta',{has_v:false,nome: req.user.nome_usuario,menu_horizontal: [{nome: 'Home', rota: '/home', ativo: false},{nome: 'Carrinho', rota: '/carrinho', ativo: false},{nome: 'Biblioteca', rota: '/biblioteca', ativo: false}]});
    })
    app.get('/logout', (req,res, next) => {
        req.logout((err)=>{
            if(err){
                return next(err)
            }
            req.flash('success_msg', 'Deslogado com sucesso')
            res.redirect('/home')
        })
    })
    app.post('/changedate', authenticated, (req,res)=>{
        Usuario.update({data_nascimento: req.body.data},{where: {email: req.user.email}}).then((result) => {
            req.flash("success_msg", "Data de nascimento alterada com sucesso")
            res.redirect('/conta')
        }).catch((err) => {
            req.flash("error_msg", "Ocorreu um erro interno ao alterar a data de nascimento, error: "+err)
            res.redirect('/conta')
        });
    })
    app.post('/changeuser', authenticated, async (req,res)=>{
        if(await Usuario.findOne({where: {nome_usuario: req.body.name}})==null){
            Usuario.update({nome_usuario: req.body.name},{where: {email: req.user.email}}).then((result) => {
                req.flash("success_msg", "Nome de Usuário alterado com sucesso")
                res.redirect('/conta')
            }).catch((err) => {
                req.flash("error_msg", "Ocorreu um erro interno ao alterar o nome de usuário, error:"+err)
                res.redirect('/conta')
            });
        }
        else{
            req.flash("error_msg", "Nome de usuário já utilizado")
            res.redirect('/conta')
        }
    })
    app.post('/changephoto', authenticated, upload.single("file"), (req,res)=>{
        req.flash("success_msg", "Avatar alterado com sucesso!")
        res.redirect('/conta')
    })
    app.post('/changepassword', authenticated, (req,res)=>{
        res.render('change_password',{menu_horizontal: [{nome: 'Home', rota: '/home', ativo: false},{nome: 'Alterar senha', rota: '', ativo: true}]})
    })
    app.post('/fChangePassword', authenticated, async (req,res) =>{
        let senha = await Usuario.findOne({attributes: ['senha'], where: {email: req.user.email}})
        if(await argon2.verify(senha.dataValues.senha,req.body.senha_atual)){
            try{
                senha = await argon2.hash(req.body.senha)
                console.log()
                await Usuario.update({senha: senha},{where: {email: req.user.email}})
                req.flash("success_msg", "Senha alterada com sucesso")
                res.redirect('/conta')
            }
            catch(error){
                req.flash("error_msg", "ocorreu um erro interno, desculpe :( "+error)
                res.redirect(307, '/changepassword')
            }
        }
        else{
            req.flash("error_msg", "Senha incorreta!")
            res.redirect(307, '/changepassword')
        }
    })
    app.listen(process.env.PORT || 8080); 