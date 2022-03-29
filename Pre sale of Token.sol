// Incomplete
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract preSale is ERC20{
    uint8 private PriceofToken=100;
    uint16 private availableTokens=500;
    uint256 private ICOstartDate=1648618224;
    uint256 private ICOendDate=1651296624;
    constructor() ERC20 ("pakToken", "PKT"){}
   // function validateUser(address account, uint256 amount) public{
     //       address account = _msgSender(); }
      modifier check(uint16 _availableToken , uint8 _priceofToken)
    {
       _;
    }
     function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, amount);
        return true;
    }
}