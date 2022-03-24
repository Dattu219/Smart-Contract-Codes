/**

 *Submitted for verification at Etherscan.io on 2018-11-05

*/



pragma solidity ^0.4.25;



/**

  Telegram: https://t.me/multixpro

  

  Multiplier contract: returns 125% of each investment!

  Automatic payouts!

  No bugs, no backdoors, NO OWNER - fully automatic!

  Made and checked by professionals!



  1. Send any sum to smart contract address

     - sum from 0.01 to 0.5 ETH

     - min 250000 gas limit

     - you are added to a queue

  2. Wait a little bit

  3. ...

  4. PROFIT! You have got 125%



  How is that?

  1. The first investor in the queue (you will become the

     first in some time) receives next investments until

     it become 125% of his initial investment.

  2. You will receive payments in several parts or all at once

  3. Once you receive 125% of your initial investment you are

     removed from the queue.

  4. You can make multiple deposits

  5. The balance of this contract should normally be 0 because

     all the money are immediately go to payouts





     So the last pays to the first (or to several first ones

     if the deposit big enough) and the investors paid 125% are removed from the queue



                new investor --|               brand new investor --|

                 investor5     |                 new investor       |

                 investor4     |     =======>      investor5        |

                 investor3     |                   investor4        |

    (part. paid) investor2    <|                   investor3        |

    (fully paid) investor1   <-|                   investor2   <----|  (pay until 125%)





  §¬§à§ß§ä§â§Ñ§Ü§ä §µ§Þ§ß§à§Ø§Ú§ä§Ö§Ý§î: §Ó§à§Ù§Ó§â§Ñ§ë§Ñ§Ö§ä 125% §à§ä §Ó§Ñ§ê§Ö§Ô§à §Õ§Ö§á§à§Ù§Ú§ä§Ñ!

  §¡§Ó§ä§à§Þ§Ñ§ä§Ú§é§Ö§ã§Ü§Ú§Ö §Ó§í§á§Ý§Ñ§ä§í!

  §¢§Ö§Ù §à§ê§Ú§Ò§à§Ü, §Õ§í§â, §Ñ§Ó§ä§à§Þ§Ñ§ä§Ú§é§Ö§ã§Ü§Ú§Û - §Õ§Ý§ñ §Ó§í§á§Ý§Ñ§ä §¯§¦ §¯§µ§¨§¯§¡ §Ñ§Õ§Þ§Ú§ß§Ú§ã§ä§â§Ñ§è§Ú§ñ!

  §³§à§Ù§Õ§Ñ§ß §Ú §á§â§à§Ó§Ö§â§Ö§ß §á§â§à§æ§Ö§ã§ã§Ú§à§ß§Ñ§Ý§Ñ§Þ§Ú!



  1. §±§à§ê§Ý§Ú§ä§Ö §Ý§ð§Ò§å§ð §ß§Ö§ß§å§Ý§Ö§Ó§å§ð §ã§å§Þ§Þ§å §ß§Ñ §Ñ§Õ§â§Ö§ã §Ü§à§ß§ä§â§Ñ§Ü§ä§Ñ

     - §ã§å§Þ§Þ§Ñ §à§ä 0.01 §Õ§à 0.5 ETH

     - gas limit §Þ§Ú§ß§Ú§Þ§å§Þ 250000

     - §Ó§í §Ó§ã§ä§Ñ§ß§Ö§ä§Ö §Ó §à§é§Ö§â§Ö§Õ§î

  2. §¯§Ö§Þ§ß§à§Ô§à §á§à§Õ§à§Ø§Õ§Ú§ä§Ö

  3. ...

  4. PROFIT! §£§Ñ§Þ §á§â§Ú§ê§Ý§à 125% §à§ä §Ó§Ñ§ê§Ö§Ô§à §Õ§Ö§á§à§Ù§Ú§ä§Ñ.



  §¬§Ñ§Ü §ï§ä§à §Ó§à§Ù§Þ§à§Ø§ß§à?

  1. §±§Ö§â§Ó§í§Û §Ú§ß§Ó§Ö§ã§ä§à§â §Ó §à§é§Ö§â§Ö§Õ§Ú (§Ó§í §ã§ä§Ñ§ß§Ö§ä§Ö §á§Ö§â§Ó§í§Þ §à§é§Ö§ß§î §ã§Ü§à§â§à) §á§à§Ý§å§é§Ñ§Ö§ä §Ó§í§á§Ý§Ñ§ä§í §à§ä

     §ß§à§Ó§í§ç §Ú§ß§Ó§Ö§ã§ä§à§â§à§Ó §Õ§à §ä§Ö§ç §á§à§â, §á§à§Ü§Ñ §ß§Ö §á§à§Ý§å§é§Ú§ä 125% §à§ä §ã§Ó§à§Ö§Ô§à §Õ§Ö§á§à§Ù§Ú§ä§Ñ

  2. §£§í§á§Ý§Ñ§ä§í §Þ§à§Ô§å§ä §á§â§Ú§ç§à§Õ§Ú§ä§î §ß§Ö§ã§Ü§à§Ý§î§Ü§Ú§Þ§Ú §é§Ñ§ã§ä§ñ§Þ§Ú §Ú§Ý§Ú §Ó§ã§Ö §ã§â§Ñ§Ù§å

  3. §¬§Ñ§Ü §ä§à§Ý§î§Ü§à §Ó§í §á§à§Ý§å§é§Ñ§Ö§ä§Ö 125% §à§ä §Ó§Ñ§ê§Ö§Ô§à §Õ§Ö§á§à§Ù§Ú§ä§Ñ, §Ó§í §å§Õ§Ñ§Ý§ñ§Ö§ä§Ö§ã§î §Ú§Ù §à§é§Ö§â§Ö§Õ§Ú

  4. §£§í §Þ§à§Ø§Ö§ä§Ö §Õ§Ö§Ý§Ñ§ä§î §ß§Ö§ã§Ü§à§Ý§î§Ü§à §Õ§Ö§á§à§Ù§Ú§ä§à§Ó §ã§â§Ñ§Ù§å

  5. §¢§Ñ§Ý§Ñ§ß§ã §ï§ä§à§Ô§à §Ü§à§ß§ä§â§Ñ§Ü§ä§Ñ §Õ§à§Ý§Ø§Ö§ß §à§Ò§í§é§ß§à §Ò§í§ä§î §Ó §â§Ñ§Û§à§ß§Ö 0, §á§à§ä§à§Þ§å §é§ä§à §Ó§ã§Ö §á§à§ã§ä§å§á§Ý§Ö§ß§Ú§ñ

     §ã§â§Ñ§Ù§å §Ø§Ö §ß§Ñ§á§â§Ñ§Ó§Ý§ñ§ð§ä§ã§ñ §ß§Ñ §Ó§í§á§Ý§Ñ§ä§í



     §´§Ñ§Ü§Ú§Þ §à§Ò§â§Ñ§Ù§à§Þ, §á§à§ã§Ý§Ö§Õ§ß§Ú§Ö §á§Ý§Ñ§ä§ñ§ä §á§Ö§â§Ó§í§Þ, §Ú §Ú§ß§Ó§Ö§ã§ä§à§â§í, §Õ§à§ã§ä§Ú§Ô§ê§Ú§Ö §Ó§í§á§Ý§Ñ§ä 125% §à§ä §Õ§Ö§á§à§Ù§Ú§ä§Ñ,

     §å§Õ§Ñ§Ý§ñ§ð§ä§ã§ñ §Ú§Ù §à§é§Ö§â§Ö§Õ§Ú, §å§ã§ä§å§á§Ñ§ñ §Þ§Ö§ã§ä§à §à§ã§ä§Ñ§Ý§î§ß§í§Þ



              §ß§à§Ó§í§Û §Ú§ß§Ó§Ö§ã§ä§à§â --|            §ã§à§Ó§ã§Ö§Þ §ß§à§Ó§í§Û §Ú§ß§Ó§Ö§ã§ä§à§â --|

                 §Ú§ß§Ó§Ö§ã§ä§à§â5     |                §ß§à§Ó§í§Û §Ú§ß§Ó§Ö§ã§ä§à§â      |

                 §Ú§ß§Ó§Ö§ã§ä§à§â4     |     =======>      §Ú§ß§Ó§Ö§ã§ä§à§â5        |

                 §Ú§ß§Ó§Ö§ã§ä§à§â3     |                   §Ú§ß§Ó§Ö§ã§ä§à§â4        |

 (§é§Ñ§ã§ä. §Ó§í§á§Ý§Ñ§ä§Ñ) §Ú§ß§Ó§Ö§ã§ä§à§â2    <|                   §Ú§ß§Ó§Ö§ã§ä§à§â3        |

(§á§à§Ý§ß§Ñ§ñ §Ó§í§á§Ý§Ñ§ä§Ñ) §Ú§ß§Ó§Ö§ã§ä§à§â1   <-|                   §Ú§ß§Ó§Ö§ã§ä§à§â2   <----|  (§Õ§à§á§Ý§Ñ§ä§Ñ §Õ§à 125%)



*/



contract MultiX125_05eth {

    // E-wallet to pay for advertising

    address constant private ADS_SUPPORT = 0x5Fa713836267bE36ae9664E97063667e668Eab63;



    // The address of the wallet to invest back into the project

    address constant private TECH_SUPPORT = 0xc2ce177F96a0fdfa3C72FD6E3a131086B38bc3Ef;



    // The percentage of Deposit is 5%

    uint constant public ADS_PERCENT = 5;



    // Deposit percentage for investment in the project 2%

    uint constant public TECH_PERCENT = 2;

    

    // Payout percentage for all participants

    uint constant public MULTIPLIER = 125;



    // The maximum Deposit amount = 0.5 ether, so that everyone can participate and whales do not slow down and do not scare investors

    uint constant public MAX_LIMIT = 0.5 ether;



    // The Deposit structure contains information about the Deposit

    struct Deposit {

        address depositor; // The owner of the Deposit

        uint128 deposit;   // Deposit amount

        uint128 expect;    // Payment amount (instantly 150% of the Deposit)

    }



    // Turn

    Deposit[] private queue;



    // The number of the Deposit to be processed can be found in the Read contract section

    uint public currentReceiverIndex = 0;



    // This function receives all deposits, saves them and makes instant payments

    function () public payable {

        // If the Deposit amount is greater than zero

        if(msg.value > 0){

            // Check the minimum gas limit of 220 000, otherwise cancel the Deposit and return the money to the depositor

            require(gasleft() >= 220000, "We require more gas!");



            // Check the maximum Deposit amount

            require(msg.value <= MAX_LIMIT, "Deposit is too big");



            // Add a Deposit to the queue, write down that he needs to pay 125% of the Deposit amount

            queue.push(Deposit(msg.sender, uint128(msg.value), uint128(msg.value * MULTIPLIER / 100)));



            // Send a percentage to promote the project

            uint ads = msg.value * ADS_PERCENT / 100;

            ADS_SUPPORT.transfer(ads);



            // We send a percentage for technical support of the project

            uint tech = msg.value * TECH_PERCENT / 100;

            TECH_SUPPORT.transfer(tech);



            // Call the payment function first in the queue Deposit

            pay();

        }

    }



    // The function is used to pay first in line deposits

    // Each new transaction processes 1 to 4+ depositors at the beginning of the queue 

    // Depending on the remaining gas

    function pay() private {

        // We will try to send all the money available on the contract to the first depositors in the queue

        uint128 money = uint128(address(this).balance);



        // We pass through the queue

        for(uint i = 0; i < queue.length; i++) {



            uint idx = currentReceiverIndex + i;  // We get the number of the first Deposit in the queue



            Deposit storage dep = queue[idx]; // We get information about the first Deposit



            if(money >= dep.expect) {  // If we have enough money for the full payment, we pay him everything

                dep.depositor.transfer(dep.expect); // Send him money

                money -= dep.expect; // Update the amount of remaining money



                // the Deposit has been fully paid, remove it

                delete queue[idx];

            } else {

                // We get here if we do not have enough money to pay everything, but only part of it

                dep.depositor.transfer(money); // Send all remaining

                dep.expect -= money;       // Update the amount of remaining money

                break;                     // Exit the loop

            }



            if (gasleft() <= 50000)         // Check if there is still gas, and if it is not, then exit the cycle

                break;                     //  The next depositor will make the payment next in line

        }



        currentReceiverIndex += i; // Update the number of the first Deposit in the queue

    }



    // Shows information about the Deposit by its number (idx), you can follow in the Read contract section

    // You can get the Deposit number (idx) by calling the getDeposits function()

    function getDeposit(uint idx) public view returns (address depositor, uint deposit, uint expect){

        Deposit storage dep = queue[idx];

        return (dep.depositor, dep.deposit, dep.expect);

    }



    // Shows the number of deposits of a particular investor

    function getDepositsCount(address depositor) public view returns (uint) {

        uint c = 0;

        for(uint i=currentReceiverIndex; i<queue.length; ++i){

            if(queue[i].depositor == depositor)

                c++;

        }

        return c;

    }



    // Shows all deposits (index, deposit, expect) of a certain investor, you can follow in the Read contract section

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

    

    // Shows a length of the queue can be monitored in the Read section of the contract

    function getQueueLength() public view returns (uint) {

        return queue.length - currentReceiverIndex;

    }



}