// SPDX-License-Identifier: MIT

pragma solidity 0.8.3;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetFixedSupply.sol";

contract AntaToken is ERC20PresetFixedSupply {
    constructor() ERC20PresetFixedSupply("ANTA", "ANTA", 1000000000*1e18, _msgSender()) {
    }
}
