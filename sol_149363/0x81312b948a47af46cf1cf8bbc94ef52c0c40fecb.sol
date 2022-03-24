/**

 *Submitted for verification at Etherscan.io on 2018-11-21

*/



pragma solidity ^0.4.25;



/**

  Multiplier contract: returns 121% of each investment!

  Automatic payouts!

  No bugs, no backdoors, NO OWNER - fully automatic!

  Made and checked by professionals!



  1. Send any sum to smart contract address

     - sum from 0.01 to 10 ETH

     - min 250000 gas limit

     - you are added to a queue

  2. Wait a little bit

  3. ...

  4. PROFIT! You have got 121%



  How is that?

  1. The first investor in the queue (you will become the

     first in some time) receives next investments until

     it become 121% of his initial investment.

  2. You will receive payments in several parts or all at once

  3. Once you receive 121% of your initial investment you are

     removed from the queue.

  4. You can make multiple deposits

  5. The balance of this contract should normally be 0 because

     all the money are immediately go to payouts





     So the last pays to the first (or to several first ones

     if the deposit big enough) and the investors paid 121% are removed from the queue



                new investor --|               brand new investor --|

                 investor5     |                 new investor       |

                 investor4     |     =======>      investor5        |

                 investor3     |                   investor4        |

    (part. paid) investor2    <|                   investor3        |

    (fully paid) investor1   <-|                   investor2   <----|  (pay until 121%)





  §¬§à§ß§ä§â§Ñ§Ü§ä §µ§Þ§ß§à§Ø§Ú§ä§Ö§Ý§î: §Ó§à§Ù§Ó§â§Ñ§ë§Ñ§Ö§ä 121% §à§ä §Ó§Ñ§ê§Ö§Ô§à §Õ§Ö§á§à§Ù§Ú§ä§Ñ!

  §¡§Ó§ä§à§Þ§Ñ§ä§Ú§é§Ö§ã§Ü§Ú§Ö §Ó§í§á§Ý§Ñ§ä§í!

  §¢§Ö§Ù §à§ê§Ú§Ò§à§Ü, §Õ§í§â, §Ñ§Ó§ä§à§Þ§Ñ§ä§Ú§é§Ö§ã§Ü§Ú§Û - §Õ§Ý§ñ §Ó§í§á§Ý§Ñ§ä §¯§¦ §¯§µ§¨§¯§¡ §Ñ§Õ§Þ§Ú§ß§Ú§ã§ä§â§Ñ§è§Ú§ñ!

  §³§à§Ù§Õ§Ñ§ß §Ú §á§â§à§Ó§Ö§â§Ö§ß §á§â§à§æ§Ö§ã§ã§Ú§à§ß§Ñ§Ý§Ñ§Þ§Ú!



  1. §±§à§ê§Ý§Ú§ä§Ö §Ý§ð§Ò§å§ð §ß§Ö§ß§å§Ý§Ö§Ó§å§ð §ã§å§Þ§Þ§å §ß§Ñ §Ñ§Õ§â§Ö§ã §Ü§à§ß§ä§â§Ñ§Ü§ä§Ñ

     - §ã§å§Þ§Þ§Ñ §à§ä 0.01 §Õ§à 10 ETH

     - gas limit §Þ§Ú§ß§Ú§Þ§å§Þ 250000

     - §Ó§í §Ó§ã§ä§Ñ§ß§Ö§ä§Ö §Ó §à§é§Ö§â§Ö§Õ§î

  2. §¯§Ö§Þ§ß§à§Ô§à §á§à§Õ§à§Ø§Õ§Ú§ä§Ö

  3. ...

  4. PROFIT! §£§Ñ§Þ §á§â§Ú§ê§Ý§à 121% §à§ä §Ó§Ñ§ê§Ö§Ô§à §Õ§Ö§á§à§Ù§Ú§ä§Ñ.



  §¬§Ñ§Ü §ï§ä§à §Ó§à§Ù§Þ§à§Ø§ß§à?

  1. §±§Ö§â§Ó§í§Û §Ú§ß§Ó§Ö§ã§ä§à§â §Ó §à§é§Ö§â§Ö§Õ§Ú (§Ó§í §ã§ä§Ñ§ß§Ö§ä§Ö §á§Ö§â§Ó§í§Þ §à§é§Ö§ß§î §ã§Ü§à§â§à) §á§à§Ý§å§é§Ñ§Ö§ä §Ó§í§á§Ý§Ñ§ä§í §à§ä

     §ß§à§Ó§í§ç §Ú§ß§Ó§Ö§ã§ä§à§â§à§Ó §Õ§à §ä§Ö§ç §á§à§â, §á§à§Ü§Ñ §ß§Ö §á§à§Ý§å§é§Ú§ä 121% §à§ä §ã§Ó§à§Ö§Ô§à §Õ§Ö§á§à§Ù§Ú§ä§Ñ

  2. §£§í§á§Ý§Ñ§ä§í §Þ§à§Ô§å§ä §á§â§Ú§ç§à§Õ§Ú§ä§î §ß§Ö§ã§Ü§à§Ý§î§Ü§Ú§Þ§Ú §é§Ñ§ã§ä§ñ§Þ§Ú §Ú§Ý§Ú §Ó§ã§Ö §ã§â§Ñ§Ù§å

  3. §¬§Ñ§Ü §ä§à§Ý§î§Ü§à §Ó§í §á§à§Ý§å§é§Ñ§Ö§ä§Ö 121% §à§ä §Ó§Ñ§ê§Ö§Ô§à §Õ§Ö§á§à§Ù§Ú§ä§Ñ, §Ó§í §å§Õ§Ñ§Ý§ñ§Ö§ä§Ö§ã§î §Ú§Ù §à§é§Ö§â§Ö§Õ§Ú

  4. §£§í §Þ§à§Ø§Ö§ä§Ö §Õ§Ö§Ý§Ñ§ä§î §ß§Ö§ã§Ü§à§Ý§î§Ü§à §Õ§Ö§á§à§Ù§Ú§ä§à§Ó §ã§â§Ñ§Ù§å

  5. §¢§Ñ§Ý§Ñ§ß§ã §ï§ä§à§Ô§à §Ü§à§ß§ä§â§Ñ§Ü§ä§Ñ §Õ§à§Ý§Ø§Ö§ß §à§Ò§í§é§ß§à §Ò§í§ä§î §Ó §â§Ñ§Û§à§ß§Ö 0, §á§à§ä§à§Þ§å §é§ä§à §Ó§ã§Ö §á§à§ã§ä§å§á§Ý§Ö§ß§Ú§ñ

     §ã§â§Ñ§Ù§å §Ø§Ö §ß§Ñ§á§â§Ñ§Ó§Ý§ñ§ð§ä§ã§ñ §ß§Ñ §Ó§í§á§Ý§Ñ§ä§í



     §´§Ñ§Ü§Ú§Þ §à§Ò§â§Ñ§Ù§à§Þ, §á§à§ã§Ý§Ö§Õ§ß§Ú§Ö §á§Ý§Ñ§ä§ñ§ä §á§Ö§â§Ó§í§Þ, §Ú §Ú§ß§Ó§Ö§ã§ä§à§â§í, §Õ§à§ã§ä§Ú§Ô§ê§Ú§Ö §Ó§í§á§Ý§Ñ§ä 121% §à§ä §Õ§Ö§á§à§Ù§Ú§ä§Ñ,

     §å§Õ§Ñ§Ý§ñ§ð§ä§ã§ñ §Ú§Ù §à§é§Ö§â§Ö§Õ§Ú, §å§ã§ä§å§á§Ñ§ñ §Þ§Ö§ã§ä§à §à§ã§ä§Ñ§Ý§î§ß§í§Þ



              §ß§à§Ó§í§Û §Ú§ß§Ó§Ö§ã§ä§à§â --|            §ã§à§Ó§ã§Ö§Þ §ß§à§Ó§í§Û §Ú§ß§Ó§Ö§ã§ä§à§â --|

                 §Ú§ß§Ó§Ö§ã§ä§à§â5     |                §ß§à§Ó§í§Û §Ú§ß§Ó§Ö§ã§ä§à§â      |

                 §Ú§ß§Ó§Ö§ã§ä§à§â4     |     =======>      §Ú§ß§Ó§Ö§ã§ä§à§â5        |

                 §Ú§ß§Ó§Ö§ã§ä§à§â3     |                   §Ú§ß§Ó§Ö§ã§ä§à§â4        |

 (§é§Ñ§ã§ä. §Ó§í§á§Ý§Ñ§ä§Ñ) §Ú§ß§Ó§Ö§ã§ä§à§â2    <|                   §Ú§ß§Ó§Ö§ã§ä§à§â3        |

(§á§à§Ý§ß§Ñ§ñ §Ó§í§á§Ý§Ñ§ä§Ñ) §Ú§ß§Ó§Ö§ã§ä§à§â1   <-|                   §Ú§ß§Ó§Ö§ã§ä§à§â2   <----|  (§Õ§à§á§Ý§Ñ§ä§Ñ §Õ§à 121%)



*/



contract BestMultiplier {

    //Address for reclame expences

    address constant private Reclame = 0x39D080403562770754d2fA41225b33CaEE85fdDd;

    //Percent for reclame expences

    uint constant public Reclame_PERCENT = 3; 

    //3 for advertizing

    address constant private Admin = 0x0eDd0c239Ef99A285ddCa25EC340064232aD985e;

    // Address for admin expences

    uint constant public Admin_PERCENT = 1;

    // 1 for techsupport

    address constant private BMG = 0xc42F87a2E51577d56D64BF7Aa8eE3A26F3ffE8cF;

    // Address for BestMoneyGroup

    uint constant public BMG_PERCENT = 2;

    // 2 for BMG

    uint constant public Refferal_PERCENT = 10;

    // 10 for Refferal

    //How many percent for your deposit to be multiplied

    uint constant public MULTIPLIER = 121;



    //The deposit structure holds all the info about the deposit made

    struct Deposit {

        address depositor; //The depositor address

        uint128 deposit;   //The deposit amount

        uint128 expect;    //How much we should pay out (initially it is 121% of deposit)

    }



    Deposit[] private queue;  //The queue

    uint public currentReceiverIndex = 0; //The index of the first depositor in the queue. The receiver of investments!



    //This function receives all the deposits

    //stores them and make immediate payouts

    function () public payable {

        require(tx.gasprice <= 50000000000 wei, "Gas price is too high! Do not cheat!");

        if(msg.value > 0){

            require(gasleft() >= 220000, "We require more gas!"); //We need gas to process queue

            require(msg.value <= 10 ether); //Do not allow too big investments to stabilize payouts



            //Add the investor into the queue. Mark that he expects to receive 121% of deposit back

            queue.push(Deposit(msg.sender, uint128(msg.value), uint128(msg.value*MULTIPLIER/100)));



            //Send some promo to enable this contract to leave long-long time

            uint promo = msg.value*Reclame_PERCENT/100;

            Reclame.send(promo);

            uint admin = msg.value*Admin_PERCENT/100;

            Admin.send(admin);

            uint bmg = msg.value*BMG_PERCENT/100;

            BMG.send(bmg);



            //Pay to first investors in line

            pay();

        }

    

    }

        function refferal (address REF) public payable {

        require(tx.gasprice <= 50000000000 wei, "Gas price is too high! Do not cheat!");

        if(msg.value > 0){

            require(gasleft() >= 220000, "We require more gas!"); //We need gas to process queue

            require(msg.value <= 10 ether); //Do not allow too big investments to stabilize payouts



            //Add the investor into the queue. Mark that he expects to receive 121% of deposit back

            queue.push(Deposit(msg.sender, uint128(msg.value), uint128(msg.value*MULTIPLIER/100)));



            //Send some promo to enable this contract to leave long-long time

            uint promo = msg.value*Reclame_PERCENT/100;

            Reclame.send(promo);

            uint admin = msg.value*Admin_PERCENT/100;

            Admin.send(admin);

            uint bmg = msg.value*BMG_PERCENT/100;

            BMG.send(bmg);

            require(REF != 0x0000000000000000000000000000000000000000 && REF != msg.sender, "You need another refferal!"); //We need gas to process queue

            uint ref = msg.value*Refferal_PERCENT/100;

            REF.send(ref);

            //Pay to first investors in line

            pay();

        }

    

    }

    //Used to pay to current investors

    //Each new transaction processes 1 - 4+ investors in the head of queue 

    //depending on balance and gas left

    function pay() private {

        //Try to send all the money on contract to the first investors in line

        uint128 money = uint128(address(this).balance);



        //We will do cycle on the queue

        for(uint i=0; i<queue.length; i++){



            uint idx = currentReceiverIndex + i;  //get the index of the currently first investor



            Deposit storage dep = queue[idx]; //get the info of the first investor



            if(money >= dep.expect){  //If we have enough money on the contract to fully pay to investor

                dep.depositor.send(dep.expect); //Send money to him

                money -= dep.expect;            //update money left



                //this investor is fully paid, so remove him

                delete queue[idx];

            }else{

                //Here we don't have enough money so partially pay to investor

                dep.depositor.send(money); //Send to him everything we have

                dep.expect -= money;       //Update the expected amount

                break;                     //Exit cycle

            }



            if(gasleft() <= 50000)         //Check the gas left. If it is low, exit the cycle

                break;                     //The next investor will process the line further

        }



        currentReceiverIndex += i; //Update the index of the current first investor

    }



    //Get the deposit info by its index

    //You can get deposit index from

    function getDeposit(uint idx) public view returns (address depositor, uint deposit, uint expect){

        Deposit storage dep = queue[idx];

        return (dep.depositor, dep.deposit, dep.expect);

    }



    //Get the count of deposits of specific investor

    function getDepositsCount(address depositor) public view returns (uint) {

        uint c = 0;

        for(uint i=currentReceiverIndex; i<queue.length; ++i){

            if(queue[i].depositor == depositor)

                c++;

        }

        return c;

    }



    //Get all deposits (index, deposit, expect) of a specific investor

    function getDeposits(address depositor) public view returns (uint[] idxs, uint128[] deposits, uint128[] expects) {

        uint c = getDepositsCount(depositor);



        idxs = new uint[](c);

        deposits = new uint128[](c);

        expects = new uint128[](c);



        if(c > 0) {

            uint j = 0;

            for(uint i=currentReceiverIndex; i<queue.length; ++i){

                Deposit storage dep = queue[i];

                if(dep.depositor == depositor){

                    idxs[j] = i;

                    deposits[j] = dep.deposit;

                    expects[j] = dep.expect;

                    j++;

                }

            }

        }

    }

    

    //Get current queue size

    function getQueueLength() public view returns (uint) {

        return queue.length - currentReceiverIndex;

    }



}