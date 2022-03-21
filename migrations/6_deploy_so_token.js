const SoToken = artifacts.require("SoToken");

module.exports = async function (deployer, network) {
    console.log("you are deploying with the network: ", network);

    await deployer.deploy(SoToken);
};
