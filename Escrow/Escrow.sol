// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Escrow {
    address public payer;
    address payable public payee;
    address public lawyer;
    uint public amount;

    constructor(address _payer,address payable _payee,uint _amount){
        payer = _payer;
        payee = _payee;
        amount = _amount;
        lawyer = msg.sender;
    }

    function deposit() payable public{
        require(msg.sender == payer,'Sender must be the payer');
        require(address(this).balance<=amount,'Cant send more than escrow amount');
    }

    function release() public{
        require(address(this).balance == amount,'Cannot relase funds before full amount is sent');
        require(msg.sender == lawyer,'only lawyer can release funds');
        payee.transfer(amount);
    }

    function balanceOf() view public returns(uint){
        return address(this).balance;
    }

}