const HDWalletProvider = require("truffle-hdwallet-provider");
var infura_apikey = "xxx";
var mnemonic = "xxx";

module.exports = {
  networks: {
    develop: {
      host: "127.0.0.1",
      port: 9545,
      gas: 47123880,
      network_id: "*" // Match any network id
    },
    kovan: {
      provider: new HDWalletProvider(mnemonic, "https://kovan.infura.io/"+infura_apikey),
      network_id: 3,
      gas: 4700000
    },
    mainnet: {
      provider: new HDWalletProvider(mnemonic, "https://mainnet.infura.io/"+infura_apikey),
      network_id: 3,
      gas: 4712388,
      gasPrice: 100000000000
    },
  }
};
