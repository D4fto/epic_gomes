module.exports = {
    normalizar: function normalizar(str){
        return str.replaceAll(' ','_').replaceAll(/[^a-zA-Z0-9_]/g,'')
    }
}