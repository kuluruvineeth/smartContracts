// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract EtherWallet {
    address payable public owner;

    constructor(address payable _owner) {
        owner = _owner;
    }

    function send(address payable to,uint amount) public {
        if(msg.sender == owner){
            to.transfer(amount);
            return;
        }
        revert('sender is not allowed');
    }

    function balanceOf() view public returns(uint){
        return address(this).balance;
    }

    function deposit() payable public {
        
    }
}