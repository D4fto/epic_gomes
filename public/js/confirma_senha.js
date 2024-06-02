const senha = document.getElementById('senha')
const confirma_senha = document.getElementById('confirma_senha')
function verificar_coerencia(){
    let valor_senha=senha.value
    let valor_confirma=confirma_senha.value
    if(valor_senha!=valor_confirma){
        confirma_senha.setCustomValidity('Senhas não conferem')
    }
    else{
        confirma_senha.setCustomValidity('')
    }
    confirma_senha.reportValidity()
}
function verifica_senha(){
    let valor_senha=senha.value
    // let valor_confirma=confirma_senha.value
    console.log(!/[A-Z]/.test(valor_senha))
    if(valor_senha.length<8 || !/\d/.test(valor_senha) || !/[A-Z]/.test(valor_senha) || !/[a-z]/.test(valor_senha)){
        error_msg = ''
        if(valor_senha.length<8){
            error_msg+='A senha deve conter ao menos 8 caracteres\n'
        }
        if(!/\d/.test(valor_senha)){
            error_msg+='A senha deve conter ao menos 1 número\n'
        }
        if(!/[A-Z]/.test(valor_senha)){
            error_msg+='A senha deve conter ao menos 1 letra maiúscula\n'
        }
        if(!/[a-z]/.test(valor_senha)){
            error_msg+='A senha deve conter ao menos 1 letra minúscula\n'
        }
        senha.setCustomValidity(error_msg)
    }
    else{
        senha.setCustomValidity('')
    }
    // if(valor_senha===valor_confirma){
    //     confirma_senha.setCustomValidity('')
    // }
    // if(valor_confirma!=''){
    //     confirma_senha.reportValidity()
    // }
    senha.reportValidity()
}