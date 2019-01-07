pragma solidity ^0.5.0;

contract Casino {
    
    uint private start;
    uint private buyPeriod = 1000;
    uint private verifyPeriod = 100;
    uint private checkPeriod = 100;
    uint private winnerSeed;
    bool private hasWinner;
    address private winner;
    
    mapping(address => uint) private  _tickets;
    mapping(address => uint) private _winnings;
    
    address[] _entries;
    address[] _verified;
    
    constructor () public{
        start = block.timestamp;
    }
    
    function unsafeEntry(uint _number, uint _salt) public payable returns (bool) {
        return buyTicket(this.generateHash(_number, _salt));
    }
    
    function generateHash(uint _number, uint _salt) public pure returns(bytes memory ){
        return bytes(abi.encodePacked(_number, _salt));
    }
    
    function buyTicket(uint hash) public payable returns (bool){
       
        require(1 ether == msg.value);
        require(_tickets[msg.sender] == 0);
        
        _tickets[msg.sender] = hash;
        _entries.push(msg.sender);
        return true;
    }
    
    function verifyTicket(uint _number, uint _salt) public returns(bool) {
         require(block.timestamp >= start + buyPeriod);
         require(block.timestamp < start + buyPeriod + verifyPeriod);
         require(_tickets[msg.sender] > 0);
         require(_salt > _number);
         require(generateHash(_number, _salt) == _tickets[msg.sender]);
         
         winnerSeed =  winnerSeed ^ _salt ^ uint(msg.sender);
         
         _verified.push(msg.sender);
    }
    
    function checkWinner() public returns (bool){
         require(block.timestamp >= start + buyPeriod + verifyPeriod);
         require(block.timestamp < start + buyPeriod + verifyPeriod + checkPeriod);
         
         if (!hasWinner){
            winner = _verified[winnerSeed % _verified.length];
            _winnings[winner] = _verified.length - 10 ether;
            hasWinner = true;
         }
         
         return msg.sender == winner;
    }
    
    function claim() public {
        require(_winnings[msg.sender] > 0);
        msg.sender.transfer(_winnings[msg.sender]);
        _winnings[msg.sender] = 0;            
    }
}