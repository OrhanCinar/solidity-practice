interface ERC223{
     function transfer(address to, uint value) external returns (bool ok);
     event Transfer(address indexed from, address indexed to, uint value, bytes indexed data);
}