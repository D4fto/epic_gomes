const localStrategy = require("passport-local").Strategy
const argon2 = require("argon2")
const Usuario =  require("../models/Usuario")

module.exports = function(passport){
    passport.use(new localStrategy({usernameField: 'email', passwordField: 'senha'}, (email, senha, done) => {
        Usuario.findOne({where: {email: email}}).then((usuario) => {
            if(!usuario){
                return done(null, false, {message: "Email não cadastrado"})
            }
            argon2.verify(usuario.senha, senha).then((batem) => {
                if(batem){
                    return done(null, usuario)
                }
                else{
                    return done(null, false, {message: "Senha incorreta"})
                }
            })

        })
    }))
    passport.serializeUser((usuario, done) => {
        done(null, usuario.email)
    })
    passport.deserializeUser((email, done)=>{
        Usuario.findByPk(email).then((usuario) => {
            done(null, usuario)
        })
    })
}