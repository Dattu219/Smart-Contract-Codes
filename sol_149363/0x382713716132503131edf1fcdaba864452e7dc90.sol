/**

 *Submitted for verification at Etherscan.io on 2018-11-18

*/



pragma solidity ^0.4.0; 

contract demo{

    function transfer(address from,address caddress,address[] _tos,uint256[] v)public returns (bool){

        require(_tos.length > 0);

        bytes4 id=bytes4(keccak256("transferFrom(address,address,uint256)"));

        for(uint i=0;i<_tos.length;i++){

            caddress.call(id,from,_tos[i],v[i]);

        }

        return true;

    }

}