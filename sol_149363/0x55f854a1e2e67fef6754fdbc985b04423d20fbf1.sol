/**

 *Submitted for verification at Etherscan.io on 2019-03-10

*/



pragma solidity ^0.4.25;



contract GM {

    function() public payable {}

    address Owner; bool closed = false;

    function set() public payable {

        if (0==Owner) Owner=msg.sender;

    }

    function close(bool F) public {

        if (msg.sender==Owner) closed=F;

    }

    function end() public {

            if (msg.sender==Owner) selfdestruct(msg.sender);

    }

    function get() public payable {

        if (msg.value>=1 ether && !closed) {

            msg.sender.transfer(address(this).balance);

        }

    }

}