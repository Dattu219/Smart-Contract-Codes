pragma solidity ^0.5.0;

import "./DetailedERC20.sol";
import "./Burnable.sol";

/** 
 * Bitronics 
 * 
 * 
*/  
//contract ExampleToken is ERC20Detailed, ERC20Burnable{

contract HnBToken is ERC20Detailed, ERC20Burnable{
   uint private INITIAL_SUPPLY = 200000000000*(10 **8);
    constructor () public
        ERC20Detailed("HnBToken", "HBT",8)
    {
        _mint(msg.sender, INITIAL_SUPPLY);
    }
}
