// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract preSale is ERC20{
    uint256 private PriceofToken = 100;
    uint256 private ICOstartDate = 1648618224;
    uint256 private ICOendDate = 1651296624;
    uint256 maxSupply = 10000;
    uint256 private funds;
    constructor() ERC20 ("pakToken", "PKT"){}

    function buyTokens(address account, uint256 amount) public payable {
        require(account != address(0), "Invalid address");
        require(block.timestamp<= ICOendDate);
       uint256 tokensTranferred = (amount/ PriceofToken);       
       require(totalSupply()+ tokensTranferred <= maxSupply, "maxsupply reached");
       _mint(account, tokensTranferred);
       funds+=amount;
        
    }

}