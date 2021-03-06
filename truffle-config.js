// const HDWalletProvider = require('@truffle/hdwallet-provider');
// const fs = require('fs');
// const mnemonic = fs.readFileSync(".secret").toString().trim();

module.exports = {
  /**
   * $ truffle test --network <network-name>
   */

  networks: {
    development: {
     host: "127.0.0.1",     // Localhost (default: none)
     port: 7545,            // Standard Ethereum port (default: none)
     network_id: "*",       // Any network (default: none)
    },
  },
  // specify the contract files and build path!!
  contracts_directory: './src/contracts/',
  contracts_build_directory: './src/abis',
  // Configure your compilers
  compilers: {
    solc: {
      version: "^0.8.0",   
      optimizer: {
        enabled: 'true',
        runs: 200
      }
    }
  },

  
};
