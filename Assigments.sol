pragma solidity ^0.5.0;

contract Assigments {
    
    function returnFirstValue(uint a, uint b) internal pure returns (uint){
        return a;
    }
    
    function caller() public pure returns (uint){
        return returnFirstValue({b:4, a:8});
    }
    
    function returnAllValues(uint a, uint b, uint c) private pure returns (uint, uint, uint){
        return (a,b,c);
    }
    
    function callerAll() public pure returns (uint, uint, uint){
        (uint256 x,uint256 y, uint256 z) = returnAllValues(4,5,6);
        
        (x,y) = (y, x);
        (x,,) = returnAllValues(5,10,15);
        (,,z) = returnAllValues(10,20,30);
        return (x,y,z);
        
    }
}