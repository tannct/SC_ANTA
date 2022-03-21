// SPDX-License-Identifier: MIT

pragma solidity 0.8.3;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetFixedSupply.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VestingToken is Ownable {
    IERC20 public token;
    uint256 public claimedAmount;

    // EVENTS
    event ReleaseLockToken(
        address sender,
        uint256 unlockAmount,
        uint256 claimedAmount,
        uint256 createdAt
    );

    constructor(
        address _antaContractAddress
    ) {
        token = IERC20(_antaContractAddress);
    }

    function claim() external onlyOwner {
        uint256 currentTime = block.timestamp;
        uint256 unlockAmount = getUnlockAmount(currentTime) * 10**18;
        uint256 amount = unlockAmount - claimedAmount;
        token.transfer(msg.sender, amount);

        emit ReleaseLockToken(msg.sender, unlockAmount, claimedAmount, currentTime);
        claimedAmount += amount;
    }

    function getUnlockAmount(uint256 currentTime) public view virtual returns (uint256) {
        if (currentTime >= 1646438400 && currentTime < 1646697600) {
            return 26050000;
        } else if (currentTime >= 1646697600 && currentTime < 1646784000) {
            return 29775000;
        } else if (currentTime >= 1646784000 && currentTime < 1647216000) {
            return 32050000;
        } else if (currentTime >= 1647216000 && currentTime < 1647388800) {
            return 37050000;
        } else if (currentTime >= 1647388800 && currentTime < 1647475200) {
            return 57316667;
        } else if (currentTime >= 1647475200 && currentTime < 1647561600) {
            return 94302500;
        } else if (currentTime >= 1647561600 && currentTime < 1647648000) {
            return 132888333;
        } else if (currentTime >= 1647648000 && currentTime < 1647734400) {
            return 171474167;
        } else if (currentTime >= 1647734400 && currentTime < 1647820800) {
            return 210060000;
        } else if (currentTime >= 1647820800 && currentTime < 1647907200) {
            return 248645833;
        } else if (currentTime >= 1647907200 && currentTime < 1647993600) {
            return 285676111;
        } else if (currentTime >= 1647993600 && currentTime < 1648080000) {
            return 322706389;
        } else if (currentTime >= 1648080000 && currentTime < 1648166400) {
            return 359736667;
        } else if (currentTime >= 1648166400 && currentTime < 1648252800) {
            return 396766944;
        } else if (currentTime >= 1648252800 && currentTime < 1648339200) {
            return 433797222;
        } else if (currentTime >= 1648339200 && currentTime < 1648425600) {
            return 470827500;
        } else if (currentTime >= 1648425600 && currentTime < 1648512000) {
            return 507857778;
        } else if (currentTime >= 1648512000 && currentTime < 1648598400) {
            return 536925556;
        } else if (currentTime >= 1648598400 && currentTime < 1648684800) {
            return 565993333;
        } else if (currentTime >= 1648684800 && currentTime < 1648771200) {
            return 595061111;
        } else if (currentTime >= 1648771200 && currentTime < 1648857600) {
            return 621622222;
        } else if (currentTime >= 1648857600 && currentTime < 1648944000) {
            return 648183333;
        } else if (currentTime >= 1648944000 && currentTime < 1649030400) {
            return 674744444;
        } else if (currentTime >= 1649030400 && currentTime < 1649116800) {
            return 701305556;
        } else if (currentTime >= 1649116800 && currentTime < 1649203200) {
            return 726266667;
        } else if (currentTime >= 1649203200 && currentTime < 1649289600) {
            return 751227778;
        } else if (currentTime >= 1649289600 && currentTime < 1649376000) {
            return 776188889;
        } else if (currentTime >= 1649376000 && currentTime < 1649462400) {
            return 801150000;
        } else if (currentTime >= 1649462400 && currentTime < 1649548800) {
            return 824444444;
        } else if (currentTime >= 1649548800 && currentTime < 1649635200) {
            return 841488889;
        } else if (currentTime >= 1649635200 && currentTime < 1649721600) {
            return 858533333;
        } else if (currentTime >= 1649721600 && currentTime < 1649808000) {
            return 875577778;
        } else if (currentTime >= 1649808000 && currentTime < 1649894400) {
            return 892622222;
        } else if (currentTime >= 1649894400 && currentTime < 1649980800) {
            return 909666667;
        } else if (currentTime >= 1649980800 && currentTime < 1650067200) {
            return 926711111;
        } else if (currentTime >= 1650067200 && currentTime < 1650153600) {
            return 942755556;
        } else if (currentTime >= 1650153600 && currentTime < 1650240000) {
            return 956800000;
        } else if (currentTime >= 1650240000 && currentTime < 1650326400) {
            return 964444444;
        } else if (currentTime >= 1650326400 && currentTime < 1650412800) {
            return 968888889;
        } else if (currentTime >= 1650412800 && currentTime < 1650499200) {
            return 973333333;
        } else if (currentTime >= 1650499200 && currentTime < 1650585600) {
            return 977777778;
        } else if (currentTime >= 1650585600 && currentTime < 1650672000) {
            return 982222222;
        } else if (currentTime >= 1650672000 && currentTime < 1650758400) {
            return 986666667;
        } else if (currentTime >= 1650758400 && currentTime < 1650844800) {
            return 991111111;
        } else if (currentTime >= 1650844800 && currentTime < 1650931200) {
            return 995555556;
        } else if (currentTime >= 1650931200) {
            return 1000000000;
        }
        return 0;
    }
}
