pragma solidity ^0.5.0;

contract DataTypes{
    
    bool myBool = false;
    
    int8 myInt = -128;
    
    uint8 myUInt = 255;
    
    string myString;
    
    uint8[] myStringArr;
    
    //fixed256x8 myFixed = 1;
    
    enum Action {ADD, REMOVE, UPDATE}
    
    Action myAction = Action.ADD;
    
    address myAddres;
    
    uint[] myIntArr = [1,2,3];
    
    function arrFunc() internal {
        myIntArr.push(1);
        myIntArr.length;
    }
    
    
    struct Account{
        uint balance;
        uint dailyLimit;
    }
    
    Account myAccount;
    
    function structFunc() internal {
        myAccount.balance = 100;
    }
    
    mapping (address => Account) _account;
    
    function mappingFunc() internal {
        _account[msg.sender].balance += msg.value;
    }
    
    function getBalance() internal returns (uint){
        return _account[msg.sender].balance;
    }
}