//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Deposit{
    uint256 public MinETH = 0 gwei;
    address[] public FromAddressList;
    mapping(address => uint256) public FromAddrAmtMap;
    function depositETH() public payable{
        require(msg.value >= MinETH, "Error");
        FromAddressList.push(msg.sender);
        FromAddrAmtMap[msg.sender] += msg.value;
    }

    function withdrawCrypto(uint256 _CryptoAmount) public {
        (bool callSuccess, ) = payable(msg.sender).call{value: _CryptoAmount}("");
        require(callSuccess, "My Call failed");
    }
    
    function getBalance(address contractAddress) public view returns(uint){
        return contractAddress.balance;
    }

   
    function currentBalance() public view returns (uint) {
        return address(this).balance; 
    }

    receive() external payable {}

}
