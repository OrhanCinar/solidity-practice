pragma solidity ^0.5.0;

contract ERC20Interface {

    function transferFrom(address _from, address _to, uint _value) public returns (bool success);
    function approve(address _spender, uint _value) public returns (bool success);
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}