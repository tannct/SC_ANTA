// SPDX-License-Identifier: MIT

pragma solidity 0.8.3;

import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract BoxMarket is 
    Initializable,
    ContextUpgradeable,
    OwnableUpgradeable
{
    uint256 public priceByAntaToken;
    uint256 public priceByBUSD;

    IERC20Upgradeable public antaTokenIERC20;
    IERC20Upgradeable public busdIERC20;
    uint256 public minBoxs;
    uint256 public maxBoxs;

    enum BuyBoxCurrency{ ANTA, BNB, BUSD }

    // EVENTS
    event BuyBox(
        address buyer,
        string orderId,
        uint256 numbers,
        uint256 price,
        BuyBoxCurrency currency,
        uint256 createdAt
    );

    event ChangePrice(
        uint256 oldPrice,
        uint256 newPrice,
        BuyBoxCurrency currency
    );

    event ChangeMinBoxs(
        uint256 oldValue,
        uint256 newValue
    );

    event ChangeMaxBoxs(
        uint256 oldValue,
        uint256 newValue
    );

    function initialize() public initializer {
        __Ownable_init();
    }

    function buyBoxByAntaToken(uint256 _numbers, string calldata _orderId) external {
        require(_numbers >= minBoxs, "must buy boxs greater than minBoxs");
        require(_numbers <= maxBoxs, "must buy boxs less than maxBoxs");

        uint256 amount = _numbers * priceByAntaToken;
        antaTokenIERC20.transferFrom(_msgSender(), address(this), amount);
        emit BuyBox(
            _msgSender(), _orderId, _numbers, priceByAntaToken, BuyBoxCurrency.ANTA, block.timestamp
        );
    }

    function buyBoxByBUSD(uint256 _numbers, string calldata _orderId) external {
        require(_numbers >= minBoxs, "must buy boxs greater than minBoxs");
        require(_numbers <= maxBoxs, "must buy boxs less than maxBoxs");

        uint256 amount = _numbers * priceByBUSD;
        busdIERC20.transferFrom(_msgSender(), address(this), amount);
        emit BuyBox(
            _msgSender(), _orderId, _numbers, priceByBUSD, BuyBoxCurrency.BUSD, block.timestamp
        );
    }

    function claimBNB() external onlyOwner {
        (bool sent, bytes memory data) = payable(msg.sender).call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
    }

    function claimBUSD() external onlyOwner {
        uint256 remainAmountToken = busdIERC20.balanceOf(address(this));
        busdIERC20.transfer(msg.sender, remainAmountToken);
    }

    function claimAnta() external onlyOwner {
        uint256 remainAmountToken = antaTokenIERC20.balanceOf(address(this));
        busdIERC20.transfer(msg.sender, remainAmountToken);
    }

    function setAntaTokenAddress(address _tokenAddress) external onlyOwner {
        antaTokenIERC20 = IERC20Upgradeable(_tokenAddress);
    }

    function setBusdTokenAddress(address _tokenAddress) external onlyOwner {
        busdIERC20 = IERC20Upgradeable(_tokenAddress);
    }

    function setPriceByAntaToken(uint256 _price) external onlyOwner {
        uint256 oldPrice = priceByAntaToken;
        priceByAntaToken = _price;
        emit ChangePrice(oldPrice, priceByAntaToken, BuyBoxCurrency.ANTA);
    }

    function setPriceByBUSD(uint256 _price) external onlyOwner {
        uint256 oldPrice = priceByBUSD;
        priceByBUSD = _price;
        emit ChangePrice(oldPrice, priceByBUSD, BuyBoxCurrency.BUSD);
    }

    function setMinBoxs(uint256 _minBox) external onlyOwner {
        uint256 oldMinBox = minBoxs;
        minBoxs = _minBox;
        emit ChangeMinBoxs(oldMinBox, minBoxs);
    }

    function setMaxBoxs(uint256 _maxBoxs) external onlyOwner {
        uint256 oldMaxBoxs = _maxBoxs;
        maxBoxs = _maxBoxs;
        emit ChangeMaxBoxs(oldMaxBoxs, maxBoxs);
    }
}
