// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract SimpleStorage {
    string public data;

    function setdata(string memory _data) public {
        data = _data;
    }

    function getdata() view public returns(string memory) {
        return data;
    }
}