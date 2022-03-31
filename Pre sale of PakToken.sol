// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract preSale is ERC20 , Ownable{
    uint256 private PriceofToken;
    uint256 private ICOstartTime;
    uint256 private ICOendTime;
    uint256 maxSupply;
    uint256 private funds;

    constructor() ERC20 ("pakToken", "PKT"){

    }
   
   
    function buyTokens(address account, uint256 noToken) public payable {
        require(account != address(0), "Invalid address");
        require((block.timestamp>= ICOstartTime)&&(block.timestamp<= ICOendTime),"Pre sale has been ended");
       uint256 totalPrice = (noToken*PriceofToken);   
       require(msg.value==totalPrice, "Not enough amount");    
       require(totalSupply() + noToken <= maxSupply, "maxsupply reached");
       _mint(account, noToken);
       funds+=msg.value;
        
    }

     // set price of token
    function setPrice(uint256 _tokenprice) public onlyOwner{
    PriceofToken = _tokenprice;
    }
    function getPrice() public view returns (uint256){
        return PriceofToken;
    }

    // set max supply of tokens
     function setMaxSupply(uint256 _supply) public onlyOwner{
      maxSupply = _supply;
    }
    function getMaxsupply() public view returns (uint256){
        return maxSupply;
    }

   // set ICO start time
 function setStartTime(uint256 _time) public onlyOwner{
     ICOstartTime= _time;
    }

 function getStartTime() public view returns (uint256){
     return ICOstartTime;
 }
 // set ICO end time
    function setEndTime(uint256 _time) public onlyOwner{
     ICOendTime= _time;
    }
    function getEndTime() public view returns (uint256){
     return ICOstartTime;
 }

}