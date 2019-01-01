pragma solidity ^0.4.0;

contract Random {
    
    function usafeBlockRandom() public returns (uint){
        return uint(block.blockhash(block.number-1)) % 10;
    }
    
    uint private _baseIncrement;
    
    function usafeIncrementRandom() public returns (uint){
        return uint(sha3(_baseIncrement++)) % 100;
    }
}