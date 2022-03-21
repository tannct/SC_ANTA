const VestingToken = artifacts.require("VestingToken");

module.exports = async function (deployer, network) {
    console.log("you are deploying with the network: ", network);

    await deployer.deploy(VestingToken, "0xE318F05f6F6dBc939687c88C78FE98e7f7d7fb92");
};
