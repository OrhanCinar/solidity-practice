pragma solidity ^0.5.0;

contract Assembly{
    
    function asmLoops()public returns (uint _r){
        assembly{
            let i := 0
            loop:
            i := add(i, 1)
            _r := add(_r, 1)
            jumpi(loop, lt(i, 10))
        }
    }
    
    function asmConditional(uint _v) public returns (uint _r){
        assembly{
            switch _v
            case 5 {
                _r := 55
            }
            case 6 {
                _r := 66
            }
            default {
                _r := 11
            }
        }
    }
    
    function asmReturns(uint _v) public returns (uint){
        assembly {
            let _ptr := add(msize(), 1)
            mstore(_ptr, _v)
            return(_ptr, 0x20)
        }
    }
}