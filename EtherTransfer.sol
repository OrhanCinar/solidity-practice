pragma solidity ^0.5.0;


contract EtherTransferTo{
    function () external payable {
        
    }
    
    function getBalance() public returns (uint){
        return address(this).balance;
    }
}

contract EtherTransferFrom {
    EtherTransferTo private _instance;


    constructor() internal {
        _instance = new EtherTransferTo();        
    }
    
    function getBalance() public returns (uint){
        return address(this).balance;
    }
    
    
    function getBalanceOfInstance() external returns (uint){
        return _instance.getBalance();
    }
    
    function () external payable {
        address(_instance).send(msg.value);
    }
}