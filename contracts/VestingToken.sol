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

    constructor(address _antaContractAddress) {
        token = IERC20(_antaContractAddress);
    }

    function claim() external onlyOwner {
        uint256 currentTime = block.timestamp;
        uint256 unlockAmount = getUnlockAmount(currentTime) * 10**18;
        uint256 amount = unlockAmount - claimedAmount;
        token.transfer(msg.sender, amount);

        emit ReleaseLockToken(
            msg.sender,
            unlockAmount,
            claimedAmount,
            currentTime
        );
        claimedAmount += amount;
    }

    function getUnlockAmount(uint256 currentTime)
        public
        view
        virtual
        returns (uint256)
    {
        if (currentTime >= 1653436800 && currentTime < 1653696000) {
            return 27750000;
        } else if (currentTime >= 1653696000 && currentTime < 1654041600) {
            return 33000000;
        } else if (currentTime >= 1654041600 && currentTime < 1656115200) {
            return 41500000;
        } else if (currentTime >= 1656115200 && currentTime < 1657065600) {
            return 58416667;
        } else if (currentTime >= 1657065600 && currentTime < 1658707200) {
            return 68016667;
        } else if (currentTime >= 1658707200 && currentTime < 1661385600) {
            return 106983333;
        } else if (currentTime >= 1661385600 && currentTime < 1664064000) {
            return 145950000;
        } else if (currentTime >= 1664064000 && currentTime < 1666656000) {
            return 184916667;
        } else if (currentTime >= 1666656000 && currentTime < 1669334400) {
            return 223883333;
        } else if (currentTime >= 1669334400 && currentTime < 1671926400) {
            return 262850000;
        } else if (currentTime >= 1671926400 && currentTime < 1674604800) {
            return 300261111;
        } else if (currentTime >= 1674604800 && currentTime < 1677283200) {
            return 337672222;
        } else if (currentTime >= 1677283200 && currentTime < 1679702400) {
            return 375083333;
        } else if (currentTime >= 1679702400 && currentTime < 1708819200) {
            return 412494444;
        } else if (currentTime >= 1708819200 && currentTime < 1684972800) {
            return 449905556;
        } else if (currentTime >= 1684972800 && currentTime < 1687651200) {
            return 487316667;
        } else if (currentTime >= 1687651200 && currentTime < 1690243200) {
            return 524727778;
        } else if (currentTime >= 1690243200 && currentTime < 1692921600) {
            return 552388889;
        } else if (currentTime >= 1692921600 && currentTime < 1695600000) {
            return 580050000;
        } else if (currentTime >= 1695600000 && currentTime < 1698192000) {
            return 607711111;
        } else if (currentTime >= 1698192000 && currentTime < 1700870400) {
            return 632672222;
        } else if (currentTime >= 1700870400 && currentTime < 1703462400) {
            return 657633333;
        } else if (currentTime >= 1703462400 && currentTime < 1706140800) {
            return 682594444;
        } else if (currentTime >= 1706140800 && currentTime < 1708819200) {
            return 707555556;
        } else if (currentTime >= 1708819200 && currentTime < 1711324800) {
            return 732516667;
        } else if (currentTime >= 1711324800 && currentTime < 1714003200) {
            return 757477778;
        } else if (currentTime >= 1714003200 && currentTime < 1716595200) {
            return 782438889;
        } else if (currentTime >= 1716595200 && currentTime < 1719273600) {
            return 807400000;
        } else if (currentTime >= 1719273600 && currentTime < 1721865600) {
            return 824444444;
        } else if (currentTime >= 1721865600 && currentTime < 1724544000) {
            return 841488889;
        } else if (currentTime >= 1724544000 && currentTime < 1727222400) {
            return 858533333;
        } else if (currentTime >= 1727222400 && currentTime < 1729814400) {
            return 875577778;
        } else if (currentTime >= 1729814400 && currentTime < 1732492800) {
            return 892622222;
        } else if (currentTime >= 1732492800 && currentTime < 1735084800) {
            return 909666667;
        } else if (currentTime >= 1735084800 && currentTime < 1737763200) {
            return 926711111;
        } else if (currentTime >= 1737763200 && currentTime < 1740441600) {
            return 942755556;
        } else if (currentTime >= 1740441600 && currentTime < 1742860800) {
            return 956800000;
        } else if (currentTime >= 1742860800 && currentTime < 1745539200) {
            return 964444444;
        } else if (currentTime >= 1745539200 && currentTime < 1748131200) {
            return 968888889;
        } else if (currentTime >= 1748131200 && currentTime < 1750809600) {
            return 973333333;
        } else if (currentTime >= 1750809600 && currentTime < 1753401600) {
            return 977777778;
        } else if (currentTime >= 1753401600 && currentTime < 1756080000) {
            return 982222222;
        } else if (currentTime >= 1756080000 && currentTime < 1758758400) {
            return 986666667;
        } else if (currentTime >= 1758758400 && currentTime < 1761350400) {
            return 991111111;
        } else if (currentTime >= 1761350400 && currentTime < 1764028800) {
            return 995555556;
        } else if (currentTime >= 1764028800) {
            return 1000000000;
        }
        return 0;
    }
}
