var IoTeXNetwork = artifacts.require("IoTeXNetwork");

module.exports = function(deployer) {
  deployer.deploy(IoTeXNetwork, 10000000000000000000000000000);  
};
