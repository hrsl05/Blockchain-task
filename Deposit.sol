//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Deposit{
    uint256 public MinETH = 100 gwei;
    address[] public FromAddressList;
    mapping(address => uint256) public FromAddrAmtMap;
    function depositETH() public payable{
        require(msg.value >= MinETH, "Error");
        FromAddressList.push(msg.sender);
        FromAddrAmtMap[msg.sender] += msg.value;
    }
}
