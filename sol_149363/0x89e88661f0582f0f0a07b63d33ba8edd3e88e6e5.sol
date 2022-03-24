/**

 *Submitted for verification at Etherscan.io on 2018-10-31

*/



pragma solidity ^0.4.25;



/**

  Multiplier contract: returns 111%-141% of each investment!

  Automatic payouts!

  No bugs, no backdoors, NO OWNER - fully automatic!

  Made and checked by professionals!



  1. Send any sum to smart contract address

     - sum from 0.01 to 10 ETH

     - min 250000 gas limit

     - you are added to a queue

  2. Wait a little bit

  3. ...

  4. PROFIT! You have got 111-141%



  How is that?

  1. The first investor in the queue (you will become the

     first in some time) receives next investments until

     it become 111-141% of his initial investment.

  2. You will receive payments in several parts or all at once

  3. Once you receive 111-141% of your initial investment you are

     removed from the queue.

  4. You can make multiple deposits

  5. The balance of this contract should normally be 0 because

     all the money are immediately go to payouts

  6. The more deposits you make the more multiplier you get. See MULTIPLIERS var

  7. If you are the last depositor (no deposits after you in 20 mins)

     you get 2% of all the ether that were on the contract. Send 0 to withdraw it.

     Do it BEFORE NEXT RESTART!

  8. The contract automatically restarts each 24 hours at 17:00 GMT





     So the last pays to the first (or to several first ones

     if the deposit big enough) and the investors paid 111-141% are removed from the queue



                new investor --|               brand new investor --|

                 investor5     |                 new investor       |

                 investor4     |     =======>      investor5        |

                 investor3     |                   investor4        |

    (part. paid) investor2    <|                   investor3        |

    (fully paid) investor1   <-|                   investor2   <----|  (pay until full %)





  §¬§à§ß§ä§â§Ñ§Ü§ä §µ§Þ§ß§à§Ø§Ú§ä§Ö§Ý§î: §Ó§à§Ù§Ó§â§Ñ§ë§Ñ§Ö§ä 111%-141% §à§ä §Ó§Ñ§ê§Ö§Ô§à §Õ§Ö§á§à§Ù§Ú§ä§Ñ!

  §¡§Ó§ä§à§Þ§Ñ§ä§Ú§é§Ö§ã§Ü§Ú§Ö §Ó§í§á§Ý§Ñ§ä§í!

  §¢§Ö§Ù §à§ê§Ú§Ò§à§Ü, §Õ§í§â, §Ñ§Ó§ä§à§Þ§Ñ§ä§Ú§é§Ö§ã§Ü§Ú§Û - §Õ§Ý§ñ §Ó§í§á§Ý§Ñ§ä §¯§¦ §¯§µ§¨§¯§¡ §Ñ§Õ§Þ§Ú§ß§Ú§ã§ä§â§Ñ§è§Ú§ñ!

  §³§à§Ù§Õ§Ñ§ß §Ú §á§â§à§Ó§Ö§â§Ö§ß §á§â§à§æ§Ö§ã§ã§Ú§à§ß§Ñ§Ý§Ñ§Þ§Ú!



  1. §±§à§ê§Ý§Ú§ä§Ö §Ý§ð§Ò§å§ð §ß§Ö§ß§å§Ý§Ö§Ó§å§ð §ã§å§Þ§Þ§å §ß§Ñ §Ñ§Õ§â§Ö§ã §Ü§à§ß§ä§â§Ñ§Ü§ä§Ñ

     - §ã§å§Þ§Þ§Ñ §à§ä 0.01 §Õ§à 10 ETH

     - gas limit §Þ§Ú§ß§Ú§Þ§å§Þ 250000

     - §Ó§í §Ó§ã§ä§Ñ§ß§Ö§ä§Ö §Ó §à§é§Ö§â§Ö§Õ§î

  2. §¯§Ö§Þ§ß§à§Ô§à §á§à§Õ§à§Ø§Õ§Ú§ä§Ö

  3. ...

  4. PROFIT! §£§Ñ§Þ §á§â§Ú§ê§Ý§à 111%-141% §à§ä §Ó§Ñ§ê§Ö§Ô§à §Õ§Ö§á§à§Ù§Ú§ä§Ñ.



  §¬§Ñ§Ü §ï§ä§à §Ó§à§Ù§Þ§à§Ø§ß§à?

  1. §±§Ö§â§Ó§í§Û §Ú§ß§Ó§Ö§ã§ä§à§â §Ó §à§é§Ö§â§Ö§Õ§Ú (§Ó§í §ã§ä§Ñ§ß§Ö§ä§Ö §á§Ö§â§Ó§í§Þ §à§é§Ö§ß§î §ã§Ü§à§â§à) §á§à§Ý§å§é§Ñ§Ö§ä §Ó§í§á§Ý§Ñ§ä§í §à§ä

     §ß§à§Ó§í§ç §Ú§ß§Ó§Ö§ã§ä§à§â§à§Ó §Õ§à §ä§Ö§ç §á§à§â, §á§à§Ü§Ñ §ß§Ö §á§à§Ý§å§é§Ú§ä 111%-141% §à§ä §ã§Ó§à§Ö§Ô§à §Õ§Ö§á§à§Ù§Ú§ä§Ñ

  2. §£§í§á§Ý§Ñ§ä§í §Þ§à§Ô§å§ä §á§â§Ú§ç§à§Õ§Ú§ä§î §ß§Ö§ã§Ü§à§Ý§î§Ü§Ú§Þ§Ú §é§Ñ§ã§ä§ñ§Þ§Ú §Ú§Ý§Ú §Ó§ã§Ö §ã§â§Ñ§Ù§å

  3. §¬§Ñ§Ü §ä§à§Ý§î§Ü§à §Ó§í §á§à§Ý§å§é§Ñ§Ö§ä§Ö 111%-141% §à§ä §Ó§Ñ§ê§Ö§Ô§à §Õ§Ö§á§à§Ù§Ú§ä§Ñ, §Ó§í §å§Õ§Ñ§Ý§ñ§Ö§ä§Ö§ã§î §Ú§Ù §à§é§Ö§â§Ö§Õ§Ú

  4. §£§í §Þ§à§Ø§Ö§ä§Ö §Õ§Ö§Ý§Ñ§ä§î §ß§Ö§ã§Ü§à§Ý§î§Ü§à §Õ§Ö§á§à§Ù§Ú§ä§à§Ó §ã§â§Ñ§Ù§å

  5. §¢§Ñ§Ý§Ñ§ß§ã §ï§ä§à§Ô§à §Ü§à§ß§ä§â§Ñ§Ü§ä§Ñ §Õ§à§Ý§Ø§Ö§ß §à§Ò§í§é§ß§à §Ò§í§ä§î §Ó §â§Ñ§Û§à§ß§Ö 0, §á§à§ä§à§Þ§å §é§ä§à §Ó§ã§Ö §á§à§ã§ä§å§á§Ý§Ö§ß§Ú§ñ

     §ã§â§Ñ§Ù§å §Ø§Ö §ß§Ñ§á§â§Ñ§Ó§Ý§ñ§ð§ä§ã§ñ §ß§Ñ §Ó§í§á§Ý§Ñ§ä§í

  6. §¹§Ö§Þ §Ò§à§Ý§î§ê§Ö §Ó§í §ã§Õ§Ö§Ý§Ñ§Ý§Ú §Õ§Ö§á§à§Ù§Ú§ä§à§Ó, §ä§Ö§Þ §Ò§à§Ý§î§ê§Ú§Û §á§â§à§è§Ö§ß§ä §Ó§í §á§à§Ý§å§é§Ñ§Ö§ä§Ö §ß§Ñ §à§é§Ö§â§Ö§Õ§ß§à§Û §Õ§Ö§á§à§Ù§Ú§ä

     §³§Þ§à§ä§â§Ú§ä§Ö §á§Ö§â§Ö§Þ§Ö§ß§ß§å§ð MULTIPLIERS §Ó §Ü§à§ß§ä§â§Ñ§Ü§ä§Ö

  7. §¦§ã§Ý§Ú §Ó§í §á§à§ã§Ý§Ö§Õ§ß§Ú§Û §Ó§Ü§Ý§Ñ§Õ§é§Ú§Ü (§á§à§ã§Ý§Ö §Ó§Ñ§ã §ß§Ö §ã§Õ§Ö§Ý§Ñ§ß §Õ§Ö§á§à§Ù§Ú§ä §Ó §ä§Ö§é§Ö§ß§Ú§Ö 20 §Þ§Ú§ß§å§ä), §ä§à §Ó§í §Þ§à§Ø§Ö§ä§Ö

     §Ù§Ñ§Ò§â§Ñ§ä§î §á§â§Ú§Ù§à§Ó§à§Û §æ§à§ß§Õ - 2% §à§ä §ï§æ§Ú§â§Ñ, §á§â§à§ê§Ö§Õ§ê§Ö§Ô§à §é§Ö§â§Ö§Ù §Ü§à§ß§ä§â§Ñ§Ü§ä. §±§à§ê§Ý§Ú§ä§Ö 0 §ß§Ñ §Ü§à§ß§ä§â§Ñ§Ü§ä

     §ã §Ô§Ñ§Ù§à§Þ §ß§Ö §Þ§Ö§ß§Ö§Ö 350000, §é§ä§à§Ò§í §Ö§Ô§à §á§à§Ý§å§é§Ú§ä§î.

  8. §¬§à§ß§ä§â§Ñ§Ü§ä §Ñ§Ó§ä§à§Þ§Ñ§ä§Ú§é§Ö§ã§Ü§Ú §ã§ä§Ñ§â§ä§å§Ö§ä §Ü§Ñ§Ø§Õ§í§Ö §ã§å§ä§Ü§Ú §Ó 20:00 MSK





     §´§Ñ§Ü§Ú§Þ §à§Ò§â§Ñ§Ù§à§Þ, §á§à§ã§Ý§Ö§Õ§ß§Ú§Ö §á§Ý§Ñ§ä§ñ§ä §á§Ö§â§Ó§í§Þ, §Ú §Ú§ß§Ó§Ö§ã§ä§à§â§í, §Õ§à§ã§ä§Ú§Ô§ê§Ú§Ö §Ó§í§á§Ý§Ñ§ä 111%-141% §à§ä §Õ§Ö§á§à§Ù§Ú§ä§Ñ,

     §å§Õ§Ñ§Ý§ñ§ð§ä§ã§ñ §Ú§Ù §à§é§Ö§â§Ö§Õ§Ú, §å§ã§ä§å§á§Ñ§ñ §Þ§Ö§ã§ä§à §à§ã§ä§Ñ§Ý§î§ß§í§Þ



              §ß§à§Ó§í§Û §Ú§ß§Ó§Ö§ã§ä§à§â --|            §ã§à§Ó§ã§Ö§Þ §ß§à§Ó§í§Û §Ú§ß§Ó§Ö§ã§ä§à§â --|

                 §Ú§ß§Ó§Ö§ã§ä§à§â5     |                §ß§à§Ó§í§Û §Ú§ß§Ó§Ö§ã§ä§à§â      |

                 §Ú§ß§Ó§Ö§ã§ä§à§â4     |     =======>      §Ú§ß§Ó§Ö§ã§ä§à§â5        |

                 §Ú§ß§Ó§Ö§ã§ä§à§â3     |                   §Ú§ß§Ó§Ö§ã§ä§à§â4        |

 (§é§Ñ§ã§ä. §Ó§í§á§Ý§Ñ§ä§Ñ) §Ú§ß§Ó§Ö§ã§ä§à§â2    <|                   §Ú§ß§Ó§Ö§ã§ä§à§â3        |

(§á§à§Ý§ß§Ñ§ñ §Ó§í§á§Ý§Ñ§ä§Ñ) §Ú§ß§Ó§Ö§ã§ä§à§â1   <-|                   §Ú§ß§Ó§Ö§ã§ä§à§â2   <----|  (§Õ§à§á§Ý§Ñ§ä§Ñ §Õ§à 111%-141%)



*/



contract Multipliers {

    //Address of old Multiplier

    address constant private FATHER = 0x7CDfA222f37f5C4CCe49b3bBFC415E8C911D1cD8;

    //Address for tech expences

    address constant private TECH = 0xDb058D036768Cfa9a94963f99161e3c94aD6f5dA;

    //Address for promo expences

    address constant private PROMO = 0xdA149b17C154e964456553C749B7B4998c152c9E;

    //Percent for first multiplier donation

    uint constant public FATHER_PERCENT = 1;

    uint constant public TECH_PERCENT = 2;

    uint constant public PROMO_PERCENT = 2;

    uint constant public PRIZE_PERCENT = 2;

    uint constant public MAX_INVESTMENT = 10 ether;

    uint constant public MIN_INVESTMENT_FOR_PRIZE = 0.05 ether;

    uint constant public MAX_IDLE_TIME = 20 minutes; //Maximum time the deposit should remain the last to receive prize



    //How many percent for your deposit to be multiplied

    //Depends on number of deposits from specified address at this stage

    //The more deposits the higher the multiplier

    uint8[] MULTIPLIERS = [

        111, //For first deposit made at this stage

        113, //For second

        117, //For third

        121, //For forth

        125, //For fifth

        130, //For sixth

        135, //For seventh

        141  //For eighth and on

    ];



    //The deposit structure holds all the info about the deposit made

    struct Deposit {

        address depositor; //The depositor address

        uint128 deposit;   //The deposit amount

        uint128 expect;    //How much we should pay out (initially it is 111%-141% of deposit)

    }



    struct DepositCount {

        int128 stage;

        uint128 count;

    }



    struct LastDepositInfo {

        uint128 index;

        uint128 time;

    }



    Deposit[] private queue;  //The queue

    uint public currentReceiverIndex = 0; //The index of the first depositor in the queue. The receiver of investments!

    LastDepositInfo public lastDepositInfo; //The time last deposit made at



    uint public prizeAmount = 0; //Prize amount accumulated for the last depositor

    int public stage = 0; //Number of contract runs

    mapping(address => DepositCount) public depositsMade; //The number of deposits of different depositors



    //This function receives all the deposits

    //stores them and make immediate payouts

    function () public payable {

        //If money are from first multiplier, just add them to the balance

        //All these money will be distributed to current investors

        if(msg.value > 0 && msg.sender != FATHER){

            require(gasleft() >= 220000, "We require more gas!"); //We need gas to process queue

            require(msg.value <= MAX_INVESTMENT, "The investment is too much!"); //Do not allow too big investments to stabilize payouts



            checkAndUpdateStage();



            addDeposit(msg.sender, msg.value);



            //Pay to first investors in line

            pay();

        }else if(msg.value == 0){

            withdrawPrize();

        }

    }



    //Used to pay to current investors

    //Each new transaction processes 1 - 4+ investors in the head of queue

    //depending on balance and gas left

    function pay() private {

        //Try to send all the money on contract to the first investors in line

        uint balance = address(this).balance;

        uint128 money = 0;

        if(balance > prizeAmount) //The opposite is impossible, however the check will not do any harm

            money = uint128(balance - prizeAmount);



        //We will do cycle on the queue

        for(uint i=currentReceiverIndex; i<queue.length; i++){



            Deposit storage dep = queue[i]; //get the info of the first investor



            if(money >= dep.expect){  //If we have enough money on the contract to fully pay to investor

                dep.depositor.send(dep.expect); //Send money to him

                money -= dep.expect;            //update money left



                //this investor is fully paid, so remove him

                delete queue[i];

            }else{

                //Here we don't have enough money so partially pay to investor

                dep.depositor.send(money); //Send to him everything we have

                dep.expect -= money;       //Update the expected amount

                break;                     //Exit cycle

            }



            if(gasleft() <= 50000)         //Check the gas left. If it is low, exit the cycle

                break;                     //The next investor will process the line further

        }



        currentReceiverIndex = i; //Update the index of the current first investor

    }



    function addDeposit(address depositor, uint value) private {

        //Count the number of the deposit at this stage

        DepositCount storage c = depositsMade[depositor];

        if(c.stage != stage){

            c.stage = int128(stage);

            c.count = 0;

        }



        //If you are applying for the prize you should invest more than minimal amount

        //Otherwize it doesn't count

        if(value >= MIN_INVESTMENT_FOR_PRIZE)

            lastDepositInfo = LastDepositInfo(uint128(queue.length), uint128(now));



        //Compute the multiplier percent for this depositor

        uint multiplier = getDepositorMultiplier(depositor);

        //Add the investor into the queue. Mark that he expects to receive 111%-141% of deposit back

        queue.push(Deposit(depositor, uint128(value), uint128(value*multiplier/100)));



        //Increment number of deposits the depositors made this round

        c.count++;



        //Save money for prize and father multiplier

        prizeAmount += value*(FATHER_PERCENT + PRIZE_PERCENT)/100;



        //Send small part to tech support

        uint support = value*TECH_PERCENT/100;

        TECH.send(support);

        uint adv = value*PROMO_PERCENT/100;

        PROMO.send(adv);



    }



    function checkAndUpdateStage() private{

        int _stage = getCurrentStageByTime();



        require(_stage >= stage, "We should only go forward in time");



        if(_stage != stage){

            proceedToNewStage(_stage);

        }

    }



    function proceedToNewStage(int _stage) private {

        //Clean queue info

        //The prize amount on the balance is left the same if not withdrawn

        stage = _stage;

        delete queue;

        currentReceiverIndex = 0;

        delete lastDepositInfo;

    }



    function withdrawPrize() private {

        //You can withdraw prize only if the last deposit was more than MAX_IDLE_TIME ago

        require(lastDepositInfo.time > 0 && lastDepositInfo.time <= now - MAX_IDLE_TIME, "The last depositor is not confirmed yet");

        //Last depositor will receive prize only if it has not been fully paid

        require(currentReceiverIndex <= lastDepositInfo.index, "The last depositor should still be in queue");



        uint balance = address(this).balance;

        if(prizeAmount > balance) //Impossible but better check it

            prizeAmount = balance;



        //Send donation to the first multiplier for it to spin faster

        //It already contains all the sum, so we must split for father and last depositor only

        uint donation = prizeAmount*FATHER_PERCENT/(FATHER_PERCENT + PRIZE_PERCENT);

        require(FATHER.call.value(donation).gas(gasleft())());



        uint prize = prizeAmount - donation;

        queue[lastDepositInfo.index].depositor.send(prize);



        prizeAmount = 0;

        proceedToNewStage(stage + 1);

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



    //Get current depositors multiplier percent at this stage

    function getDepositorMultiplier(address depositor) public view returns (uint) {

        DepositCount storage c = depositsMade[depositor];

        uint count = 0;

        if(c.stage == getCurrentStageByTime())

            count = c.count;

        if(count < MULTIPLIERS.length)

            return MULTIPLIERS[count];



        return MULTIPLIERS[MULTIPLIERS.length - 1];

    }



    function getCurrentStageByTime() public view returns (int) {

        return int(now - 17 hours) / 1 days - 17835; //Start is 31/10/2018 20:00 GMT+3

    }



    function getStageStartTime(int _stage) public pure returns (int) {

        return 17 hours + (_stage + 17835)*1 days;

    }



    function getCurrentCandidateForPrize() public view returns (address addr, int timeLeft){

        Deposit storage d = queue[lastDepositInfo.index];

        addr = d.depositor;

        timeLeft = int(lastDepositInfo.time + MAX_IDLE_TIME) - int(now);

    }



}