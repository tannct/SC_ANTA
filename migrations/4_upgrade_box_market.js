const { upgradeProxy } = require('@openzeppelin/truffle-upgrades');

const BoxMarket = artifacts.require("BoxMarket");

module.exports = async function (deployer, network) {
    console.log("you are deploying with the network: ", network);

    await upgradeProxy("0x08FABAF52F571df600eb2f4CB1D49560676BD139", BoxMarket, { deployer });
};
