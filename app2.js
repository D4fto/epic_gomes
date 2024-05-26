const express = require('express');
const app = express();
const bodyParser = require('body-parser')
//express
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended:false}))
        



app.get('/lol', (req,res) => {
    console.log(req.query)
    res.send("recebido")
})
app.get('/', (req,res) => {
 res.sendFile(__dirname+'/index.html')
}) 
app.listen(8080);