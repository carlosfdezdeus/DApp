## Pasos para la creación de la DAPP
1) Instalar Node:
    - bash% brew install node

2) Instalar Truffle Suite:
    - bash% cd to-do-list
    - bash% npm install -g truffle

3) Iniciar un proyecto de Truffle
    - bash% truffle init

4) Instalar Ganache: 
    - bash% wget "https://github.com/trufflesuite/ganache-ui/releases/download/v2.7.1/Ganache-2.7.1-mac.dmg"
    - bash% hdiutil attach Ganache-2.7.1-mac.dmg
    - bash% rm -r Ganache-2.7.1-mac.dmg
    - bash% cd Volumes/Ganache\ 2.7.1 
    - bash% cp -R Ganache.app /Applications
    - bash% cd ..
    - bash% hdiutil detach /Volumes/Ganache\ 2.7.1 
    - bash% npm install -g ganache

5) Iniciar un bloque de la red de Ethereum en local con Ganache:
    - Quiskstart en la app

6) Configuración del fichero 'truffle-config.js'
    - Descomentar el 'development: { ... }'
        Cambiar el port al de la BlockChain: 'port: 7545'
        Cambiar el network id: 'network_id: "5777"'
    - Descomentar y cambiar settings (está dentro de 'compilers: { ... }')
        settings: {
            optimizer: {
                enabled: true,
                runs: 200
            },
            //evmVersion: "bysamtium"
        }

7) Creamos un smartContract en Solidity: .../Dapps/todo-list/contracts/TodoList.sol

8) En caso de que no se haya creado un .js en /to-do-list/migrations
    - Crear un migrations.js
    - Añadir el contrato 

9) Crear el archivo de migración: .../Dapps/todo-list/migrations/1_initial_migration.js

10) Compilar el smartContract:
    - bash% truffle compile

11) Agregamos los contracts a la red Local de Ganache:
    - bash% truffle migrate --reset
    
12) Comprobamos si podemos obtener información del contrato
    1) Abrimos una consola de truffle:
        - $bash\% truffle console$
    2) Creamos una instancia de nuestro smartContract
        - $truffle(development)> todoListContract = await TodoList.deployed()$
    3) Vemos la información del contrato:   #(puede ser que en el paso 2 se haya mostrado la información)#
        - $truffle(development)> todoListContract$    
    4) Acceso a variables y funciones públicas del contrato
        - $truffle(development)> name = await todoListContract.name()$
    5) Vemos la información del nombre:     #(puede ser que en el paso 4 se haya mostrado la información)#
        - $truffle(development)> name
    6) Vemos el balance de la cuenta en la que se cargan las comisiones de los contratos:
        - $truffle(development)> account = '0x442Bec53246e97a134aADe2899C84e3E0C10aDA1'$
        - $truffle(development)> web3.eth.getBalance(account)$

13) Comprobamos que las funciones mapping funcionan:
    1) taskCount(account)
        Comprobamos la función mapping:
        - $truffle(development)> taskCount = await todoListContract.tasksCount(account)$
        La pasamos a entero:
        - $truffle(development)> taskCount.toNumber()$
    2) tasks(account, id)
        Comprobamos la función mapping:
        - $truffle(development)> theTask = await todoListContract.tasks(account, 0)$  
            Aqui podemos ver el resultado del contrato desplegado, que no está completed, ...
        Miro el primer elemento del array de la tarea:
        - $truffle(development)> theTaks[1]$



## Mapping Function
![Alt text](image.png)!
![Alt text](image-2.png)



# FrontEnd:

1) Instalación de chakra-ui
    - $bash\% npm i @chakra-ui/react @chakra-ui/next-js @emotion/react @emotion/styled framer-motion$

2) Creación app/_app.tsx

3) Creación app/index.tsx

4) Creación de la carpeta src/funcs.js 

5) Instalación del paquete @truffle/contract de truffle para interactuar con los smartContracts
    - $bash\% npm i @truffle/contract$


## Configuración MetaMask:

1) Creación de una Red de prueba
    - Configuración -> Avanzado -> Redes:
        Nombre de la red: 
            Ganache
        Nueva dirección URL de RPC:
            HTTP://127.0.0.1:7545
        Identificador de cadena:
            1337

/*
    "/not-found": [
       "static/chunks/webpack.js",
       "static/chunks/main-app.js",
       "static/chunks/app/not-found.js"
     ]
    */