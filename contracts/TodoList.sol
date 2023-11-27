// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoList {
  // Variables que tiene una tarea
  struct Task{
    uint id;
    string content;
    bool completed;
  }

  // Estructuras de eventos: 
  //    Para después emitir los eventos a la blockchain cuando sucedan
  event taskCreated(
    uint id,
    string content,
    bool completed
  );

  event taskCompleted(
    uint id,
    bool completed
  );

  // CONSTRUCTOR: 
  //    función que se ejecutará cuando se despligue el contrato en la BlockChain
  constructor(){
    createTask("Contrato desplegado! ");
  }

  // MAPPING: recibe clave y emite otro tipo de dato (una address --> un entero) 
  //    Para que cada billetera de Ethereum tenga su propia TodoList
  // Función mapping que devuelve otra función mapping
  mapping(address => mapping(uint => Task)) public tasks;
  // Función mapping que devuelve un número entero (nº tareas que tiene una billetera)
  mapping(address => uint) public tasksCount;

  // FUNCIONES:
  // Función para crear Tareas: recibe el contenido de la tarea
  function createTask(string memory _content) public{
    uint taskCount = tasksCount[msg.sender];                          // Obtenemos el id de la tarea mediante la función mapping tasksCount
    tasks[msg.sender][taskCount] = Task(taskCount, _content, false);  // completed = false siempre que se crea una tarea
    emit taskCreated(taskCount, _content, false);                     // Emitimos un evento para que se registre la tarea en la BlockChain
    tasksCount[msg.sender] ++;                                        // Aumentamos el número de tareas que tiene la billetera
  }

  // Función para cambiar el estado de las tareas: recibe el ID de la tarea a completar
  function toggleCompleted(uint _id) public{
    Task memory task = tasks[msg.sender][_id];  // Obtenemos la tarea completa mediante función mapping, pasamos dir. billetera y id tarea
    task.completed = !task.completed;           // Cambiamos el estado de la variable completed
    tasks[msg.sender][_id] = task;              // Guardamos los cambios en la tarea
    emit taskCompleted(_id, task.completed);    // Emitimos un evento de que se ha cambiado el estado para que se registre en la BlockChain 
  }

  // Función que devuelve la información sobre el contrato
  // function getContractInfo() public view returns (string memory, address, uint) { // public view --> No modifica el estado del contrato
  //   return("TodoList SmartContract", address(this), tasksCount[msg.sender]);     
  // }

  event ContractInfoRequested(address requester, uint tasksCount);

  function getContractInfo() public returns (string memory, address, uint) {
    emit ContractInfoRequested(msg.sender, tasksCount[msg.sender]);
    return("TodoList SmartContract", address(this), tasksCount[msg.sender]);
  }

  /*
  string public name = "Carlos";
 
  constructor() {
    // Agregar assert con detalles
    assert(bytes(name).length > 0);
  }
  */
}
