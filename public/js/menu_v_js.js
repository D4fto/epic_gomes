const preco_slider = document.getElementById("preco")
    const filtros = document.getElementsByClassName("filtro")
    document.getElementsByClassName("menu_v")[0].addEventListener("input",()=>{
        filtros_chec()
        filtro_collapsable_chec()
        preco_slider_custom()
    })
    function filtros_chec(){
        for(let i=0; i<filtros.length; i++){
            if(filtros[i].checked){
                filtros[i].parentElement.parentElement.parentElement.classList.add("active")
                
            }
            else if(filtros[i].parentElement.parentElement.parentElement.classList.contains("active")){
                filtros[i].parentElement.parentElement.parentElement.classList.remove("active")
            }
        }
    }
    function filtro_collapsable_chec(){
        for(let i=0; i<document.getElementsByClassName("filtros").length; i++){
            console.log(document.getElementsByClassName("filtros")[i].id+"_container")
            if(document.getElementsByClassName("filtros")[i].checked & document.getElementById(document.getElementsByClassName("filtros")[i].id+"_container").style.gridTemplateRows!="1fr"){
                document.getElementById(document.getElementsByClassName("filtros")[i].id+"_container").style.gridTemplateRows="1fr"
            }
            else if(!document.getElementsByClassName("filtros")[i].checked & document.getElementById(document.getElementsByClassName("filtros")[i].id+"_container").style.gridTemplateRows!="0fr"){
                document.getElementById(document.getElementsByClassName("filtros")[i].id+"_container").style.gridTemplateRows="0fr"
    
            }
        }
    }
    function preco_slider_custom(){
        if(preco_slider.value == preco_slider.max){
            document.getElementById("preco_output").style.display='none'
            document.getElementById("qualquer").style.display='block'
            document.getElementById("gratis").style.display='none'
        }
        else if(preco_slider.value == preco_slider.min){
            document.getElementById("preco_output").style.display='none'
            document.getElementById("gratis").style.display='block'
            document.getElementById("qualquer").style.display='none'
        }
        else{
            document.getElementById("preco_output").style.display='block'
            document.getElementById("qualquer").style.display='none'
            document.getElementById("gratis").style.display='none'
        }
        
    }
    
    preco_slider_custom()
    filtro_collapsable_chec()
    filtros_chec()