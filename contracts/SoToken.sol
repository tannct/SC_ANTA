// SPDX-License-Identifier: MIT

pragma solidity 0.8.3;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";

contract SoToken is ERC20PresetMinterPauser {
    constructor() ERC20PresetMinterPauser("SO", "SO") {
    }
}
