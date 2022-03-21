const { deployProxy } = require('@openzeppelin/truffle-upgrades');

const BoxMarket = artifacts.require("BoxMarket");

module.exports = async function (deployer, network) {
    console.log("you are deploying with the network: ", network);

    await deployProxy(BoxMarket, [], { deployer });
};
