const AntaToken = artifacts.require("AntaToken");

module.exports = async function (deployer, network) {
    console.log("you are deploying with the network: ", network);

    await deployer.deploy(AntaToken);
};
