const express = require('express');
const app = express();

// Rota para lidar com o envio do formulário
app.get('/submit-form', (req, res) => {
  const formData = req.query; // Aqui estão os dados do formulário

  console.log(formData); // Exemplo: { name: 'John', email: 'john@example.com' }

  // Faça algo com os dados do formulário, como salvar em um banco de dados

  res.send('Formulário recebido com sucesso!');
});

// Rota para servir o formulário HTML
app.get('/', (req, res) => {
  res.send(`
    <form action="/submit-form" method="get">
      <label for="name">Name:</label><br>
      <input type="text" id="name" name="name"><br>
      <label for="email">Email:</label><br>
      <input type="email" id="email" name="email"><br><br>
      <button type="submit">Submit</button>
    </form>
  `);
});

// Iniciar o servidor
app.listen(8080, () => {
  console.log('Servidor está rodando na porta 3000');
});
