const express = require('express');
const app = express();
const web3 = require('./web3'); // Importa el archivo web3.js
const TodoListJson = require('../build/contracts/TodoList.json'); //SmartContrato

const TodoListAddress = '0xD489E262F24c5F51d1f75347DE2e9d9821858428'; // Dirección de tu contrato desplegado
const TodoList = new web3.eth.Contract(TodoListJson.abi, TodoListAddress);

// Endpoint para obtener información del contrato
app.get('/contractInfo', async (req, res) => {
  try {
    const contractInfo = await TodoList.methods.getContractInfo().call({ gas: 30000 }); // Reemplaza con la función de tu contrato
    res.json(contractInfo);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al obtener información del contrato' });
  }
});

// Agrega más endpoints según sea necesario para interactuar con tu contrato

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor en ejecución en http://localhost:${PORT}`);
});
