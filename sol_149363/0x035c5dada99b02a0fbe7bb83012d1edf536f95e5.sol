/**

 *Submitted for verification at Etherscan.io on 2018-11-14

*/



pragma solidity ^0.4.25;



contract FastGameMultiplier {



    //§Ñ§Õ§â§Ö§ã §á§à§Õ§Õ§Ö§â§Ø§Ü§Ú

    address public support;



    //§±§â§à§è§Ö§ß§ä§í

	uint constant public PRIZE_PERCENT = 3;

    uint constant public SUPPORT_PERCENT = 2;

    

    //§à§Ô§â§Ñ§ß§Ú§é§Ö§ß§Ú§ñ §Õ§Ö§á§à§Ù§Ú§ä§Ñ

    uint constant public MAX_INVESTMENT =  0.2 ether;

    uint constant public MIN_INVESTMENT = 0.01 ether;

    uint constant public MIN_INVESTMENT_FOR_PRIZE = 0.02 ether;

    uint constant public GAS_PRICE_MAX = 20; // §Þ§Ñ§Ü§ã§Ú§Þ§Ñ§Ý§î§ß§Ñ§ñ §è§Ö§ß§Ñ §Ô§Ñ§Ù§Ñ maximum gas price for contribution transactions

    uint constant public MAX_IDLE_TIME = 10 minutes; //§Ó§â§Ö§Þ§ñ §à§Ø§Ú§Õ§Ñ§ß§Ú§ñ §Õ§à §Ù§Ñ§Ò§à§â§Ñ §á§â§Ú§Ù§Ñ //Maximum time the deposit should remain the last to receive prize



    //§å§ã§á§Ö§ê§ß§à§ã§ä§î §Ú§Ô§â§í, §Þ§Ú§ß§Ú§Þ§Ñ§Ý§î§ß§à§Ö §Ü§à§Ý§Ú§é§Ö§ã§ä§Ó§à §å§é§Ñ§ã§ä§ß§Ú§Ü§à§Ó

    uint constant public SIZE_TO_SAVE_INVEST = 10; //§Þ§Ú§ß§Ú§Þ§Ñ§Ý§î§ß§à§Ö §Ü§à§Ý§Ú§é§Ö§ã§ä§Ó§à §å§é§Ñ§ã§ä§ß§Ú§Ü§à§Ó

    uint constant public TIME_TO_SAVE_INVEST = 5 minutes; //§Ó§â§Ö§Þ§ñ §á§à§ã§Ý§Ö §Ü§à§ä§à§â§à§Ô§à §Ú§Ô§â§å §Þ§à§Ø§ß§à §à§ä§Þ§Ö§ß§Ú§ä§î

    

    //§ã§Ö§ä§Ü§Ñ §á§â§à§è§Ö§ß§ä§à§Ó §Õ§Ý§ñ §Ó§Ý§à§Ø§Ö§ß§Ú§ñ §Ó §à§Õ§ß§à§Þ §ã§ä§Ñ§â§ä§Ö, §ã§ä§Ñ§â§ä §Ü§Ñ§Ø§Õ§í§Û §é§Ñ§ã (§ä§Ö§ã§ä§à§Ó§à)

    uint8[] MULTIPLIERS = [

        115, //§á§Ö§â§Ó§í§Û

        120, //§Ó§ä§à§â§à§Û

        125 //§ä§â§Ö§ä§Ú§Û

    ];



    //§à§á§Ú§ã§Ñ§ß§Ú§Ö §Õ§Ö§á§à§Ù§Ú§ä§Ñ

    struct Deposit {

        address depositor; //§¡§Õ§â§Ö§ã §Õ§Ö§á§à§Ù§Ú§ä§Ñ

        uint128 deposit;   //§³§å§Þ§Þ§Ñ §Õ§Ö§á§à§Ù§Ú§ä§Ñ 

        uint128 expect;    //§³§Ü§à§Ý§î§Ü§à §Ó§í§á§Ý§Ñ§ä§Ú§ä§î §á§à §Õ§Ö§á§à§Ù§Ú§ä§å (115%-125%)

    }



   //§°§á§Ú§ã§Ñ§ß§Ú§Ö §ß§à§Þ§Ö§â§Ñ §à§é§Ö§â§Ö§Õ§Ú §Ú §ß§à§Þ§Ö§â §Õ§Ö§á§à§Ù§Ú§ä§Ñ §Ó §à§é§Ö§â§Ö§Õ§Ú

    struct DepositCount {

        int128 stage;

        uint128 count;

    }



	//§°§á§Ú§ã§Ñ§ß§Ú§Ö §á§à§ã§Ý§Ö§Õ§ß§Ö§Ô§à §Ú §á§â§Ö§Õ§á§à§ã§Ý§Ö§Õ§ß§Ö§Ô§à §Õ§Ö§á§à§Ù§Ú§ä§Ñ 

    struct LastDepositInfo {

        uint128 index;

        uint128 time;

    }



    Deposit[] private queue;  //The queue



    uint public currentReceiverIndex = 0; //§ª§ß§Õ§Ö§Ü§ã §á§Ö§â§Ó§à§Ô§à §Ú§ß§Ó§Ö§ã§ä§à§â§Ñ The index of the first depositor in the queue. The receiver of investments!

    uint public currentQueueSize = 0; //§²§Ñ§Ù§Þ§Ö§â §à§é§Ö§â§Ö§Õ§Ú The current size of queue (may be less than queue.length)

    LastDepositInfo public lastDepositInfoForPrize; //§±§à§ã§Ý§Ö§Õ§ß§Ú§Û §Õ§Ö§á§à§Ù§Ú§ä §Õ§Ý§ñ §¥§Ø§Ö§Ü§Ñ The time last deposit made at

    LastDepositInfo public previosDepositInfoForPrize; //§±§â§Ö§Õ§á§à§ã§Ý§Ö§Õ§ß§Ú§Û §Õ§Ö§á§à§Ù§Ú§ä §Õ§Ý§ñ §¥§Ø§Ö§Ü§Ñ The time last deposit made at



    uint public prizeAmount = 0; //§³§å§Þ§Þ§Ñ §á§â§Ú§Ù§Ñ §à§ã§ä§Ñ§Ó§ê§Ñ§ñ§ã§ñ §ã §á§â§à§ê§Ý§à§Ô§à §Ù§Ñ§á§å§ã§Ü§Ñ

    uint public prizeStageAmount = 0; //§³§å§Þ§Þ§Ñ §á§â§Ú§Ù§Ñ Prize §Ó §ä§Ö§Ü§å§ë§Ö§Þ §Ù§Ñ§á§å§ã§Ü§Ö amount accumulated for the last depositor

    int public stage = 0; //§¬§à§Ý§Ú§é§Ö§ã§ä§Ó§à §ã§ä§Ñ§â§ä§à§Ó Number of contract runs

    uint128 public lastDepositTime = 0; //§£§â§Ö§Þ§ñ §á§à§ã§Ý§Ö§Õ§ß§Ö§Ô§à §Õ§Ö§á§à§Ù§Ú§ä§Ñ

    

    mapping(address => DepositCount) public depositsMade; //The number of deposits of different depositors



    constructor() public {

        support = msg.sender; 

        proceedToNewStage(getCurrentStageByTime() + 1);

    }

    

    //This function receives all the deposits

    //stores them and make immediate payouts

    function () public payable {

        require(tx.gasprice <= GAS_PRICE_MAX * 1000000000);

        require(gasleft() >= 250000, "We require more gas!"); //§å§ã§Ý§à§Ó§Ú§Ö §à§Ô§â§Ñ§ß§Ú§é§Ö§ß§Ú§ñ §Ô§Ñ§Ù§Ñ

        

        checkAndUpdateStage();

        

        if(msg.value > 0){

            require(msg.value >= MIN_INVESTMENT && msg.value <= MAX_INVESTMENT); //§µ§ã§Ý§à§Ó§Ú§Ö  §Õ§Ö§á§à§Ù§Ú§ä§Ñ

            require(lastDepositInfoForPrize.time <= now + MAX_IDLE_TIME); 



            



            require(getNextStageStartTime() >= now + MAX_IDLE_TIME + 10 minutes);//§ß§Ö§Ý§î§Ù§ñ §Ú§ß§Ó§Ö§ã§ä§Ú§â§à§Ó§Ñ§ä§î §Ù§Ñ MAX_IDLE_TIME §Õ§à §ã§Ý§Ö§Õ§å§ð§ë§Ö§Ô§à §ã§ä§Ñ§â§ä§Ñ



            //Pay to first investors in line

            if(currentQueueSize < SIZE_TO_SAVE_INVEST){ //§ã§ä§â§Ñ§ç§à§Ó§Ü§Ñ §à§ä §á§Ý§à§ç§à§Ô§à §ã§ä§Ñ§â§ä§Ñ

                

                addDeposit(msg.sender, msg.value);

                

            } else {

                

                addDeposit(msg.sender, msg.value);

                pay(); 

                

            }

            

        } else if(msg.value == 0 && currentQueueSize > SIZE_TO_SAVE_INVEST){

            

            withdrawPrize(); //§Ó§í§á§Ý§Ñ§ä§Ñ §á§â§Ú§Ù§Ñ

            

        } else if(msg.value == 0){

            

            require(currentQueueSize <= SIZE_TO_SAVE_INVEST); //§¥§Ý§ñ §Ó§à§Ù§Ó§â§Ñ§ä§Ñ §Õ§à§Ý§Ø§ß§à §Ò§í§ä§î §Þ§Ö§ß§Ö§Ö, §Ý§Ú§Ò§à §â§Ñ§Ó§ß§à SIZE_TO_SAVE_INVEST §Ú§Ô§â§à§Ü§à§Ó

            require(lastDepositTime > 0 && (now - lastDepositTime) >= TIME_TO_SAVE_INVEST); //§¥§Ý§ñ §Ó§à§Ù§Ó§â§Ñ§ä§Ñ §Õ§à§Ý§Ø§ß§à §á§â§à§Û§ä§Ú §Ó§â§Ö§Þ§ñ TIME_TO_SAVE_INVEST

            

            returnPays(); //§£§Ö§â§ß§å§ä§î §Ó§ã§Ö §Õ§Ö§á§à§Ù§Ú§ä§í

            

        } 

    }



    //Used to pay to current investors

    function pay() private {

        //Try to send all the money on contract to the first investors in line

        uint balance = address(this).balance;

        uint128 money = 0;

        

        if(balance > prizeStageAmount) //The opposite is impossible, however the check will not do any harm

            money = uint128(balance - prizeStageAmount);



        //Send small part to tech support

        uint128 moneyS = uint128(money*SUPPORT_PERCENT/100);

        support.send(moneyS);

        money -= moneyS;

        

        //We will do cycle on the queue

        for(uint i=currentReceiverIndex; i<currentQueueSize; i++){



            Deposit storage dep = queue[i]; //get the info of the first investor



            if(money >= dep.expect){  //If we have enough money on the contract to fully pay to investor

                    

                dep.depositor.send(dep.expect); 

                money -= dep.expect;          

                

                //§±§à§ã§Ý§Ö §Ó§í§á§Ý§Ñ§ä§í §Õ§Ö§á§à§Ù§Ú§ä§í + §á§â§à§è§Ö§ß§ä§Ñ §å§Õ§Ñ§Ý§ñ§Ö§ä§ã§ñ §Ú§Ù §à§é§Ö§â§Ö§Õ§Ú this investor is fully paid, so remove him

                delete queue[i];

            

                

            }else{

                //Here we don't have enough money so partially pay to investor



                dep.depositor.send(money);      //Send to him everything we have

                money -= dep.expect;            //update money left



                break;                     //Exit cycle

            }



            if(gasleft() <= 50000)         //Check the gas left. If it is low, exit the cycle

                break;                     //The next investor will process the line further

        }



        currentReceiverIndex = i; //Update the index of the current first investor

    }

    

    function returnPays() private {

        //Try to send all the money on contract to the first investors in line

        uint balance = address(this).balance;

        uint128 money = 0;

        

        if(balance > prizeAmount) //The opposite is impossible, however the check will not do any harm

            money = uint128(balance - prizeAmount);

        

        //We will do cycle on the queue

        for(uint i=currentReceiverIndex; i<currentQueueSize; i++){



            Deposit storage dep = queue[i]; //get the info of the first investor



                dep.depositor.send(dep.deposit); //§ª§Ô§â§Ñ §ß§Ö §ã§à§ã§ä§à§ñ§Ý§Ñ§ã§î, §Ó§à§Ù§Ó§â§Ñ§ä

                money -= dep.deposit;            

                

                //§±§à§ã§Ý§Ö §Ó§í§á§Ý§Ñ§ä§í §Õ§Ö§á§à§Ù§Ú§ä§í + §á§â§à§è§Ö§ß§ä§Ñ §å§Õ§Ñ§Ý§ñ§Ö§ä§ã§ñ §Ú§Ù §à§é§Ö§â§Ö§Õ§Ú this investor is fully paid, so remove him

                delete queue[i];



        }



        prizeStageAmount = 0; //§£§Ö§â§ß§å§Ý§Ú §Õ§Ö§ß§î§Ô§Ú, §Õ§Ø§Ö§Ü§Ñ §ä§Ö§Ü§å§ë§Ö§Û §à§é§Ö§â§Ö§Õ§Ú §ß§Ö§ä.

        proceedToNewStage(getCurrentStageByTime() + 1);

    }



    function addDeposit(address depositor, uint value) private {

        //Count the number of the deposit at this stage

        DepositCount storage c = depositsMade[depositor];

        if(c.stage != stage){

            c.stage = int128(stage);

            c.count = 0;

        }



        //§µ§é§Ñ§ã§ä§Ú§Ö §Ó §Ú§Ô§â§Ö §Ù§Ñ §Õ§Ø§Ö§Ü§á§à§ä §ä§à§Ý§î§Ü§à §Þ§Ú§ß§Ú§Þ§Ñ§Ý§î§ß§à§Þ §Õ§Ö§á§à§Ù§Ú§ä§Ö MIN_INVESTMENT_FOR_PRIZE

        if(value >= MIN_INVESTMENT_FOR_PRIZE){

            previosDepositInfoForPrize = lastDepositInfoForPrize;

            lastDepositInfoForPrize = LastDepositInfo(uint128(currentQueueSize), uint128(now));

        }



        //Compute the multiplier percent for this depositor

        uint multiplier = getDepositorMultiplier(depositor);

        

        push(depositor, value, value*multiplier/100);



        //Increment number of deposits the depositors made this round

        c.count++;



        lastDepositTime = uint128(now);

        

        //Save money for prize

        prizeStageAmount += value*PRIZE_PERCENT/100;

    }



    function checkAndUpdateStage() private {

        int _stage = getCurrentStageByTime();



        require(_stage >= stage); //§ã§ä§Ñ§â§ä §Ö§ë§Ö §ß§Ö §á§â§à§Ú§Ù§à§ê§Ö§Ý



        if(_stage != stage){

            proceedToNewStage(_stage);

        }

    }



    function proceedToNewStage(int _stage) private {

        //§³§ä§Ñ§â§ä §ß§à§Ó§à§Û §Ú§Ô§â§í

        stage = _stage;

        currentQueueSize = 0; 

        currentReceiverIndex = 0;

        lastDepositTime = 0;

        prizeAmount += prizeStageAmount; 

        prizeStageAmount = 0;

        delete queue;

        delete previosDepositInfoForPrize;

        delete lastDepositInfoForPrize;

    }



    //§à§ä§á§â§Ñ§Ó§Ü§Ñ §á§â§Ú§Ù§Ñ

    function withdrawPrize() private {

        //You can withdraw prize only if the last deposit was more than MAX_IDLE_TIME ago

        require(lastDepositInfoForPrize.time > 0 && lastDepositInfoForPrize.time <= now - MAX_IDLE_TIME, "The last depositor is not confirmed yet");

        //Last depositor will receive prize only if it has not been fully paid

        require(currentReceiverIndex <= lastDepositInfoForPrize.index, "The last depositor should still be in queue");



        uint balance = address(this).balance;



        //Send donation to the first multiplier for it to spin faster

        //It already contains all the sum, so we must split for father and last depositor only

        //If the .call fails then ether will just stay on the contract to be distributed to

        //the queue at the next stage



        uint prize = balance;

        if(previosDepositInfoForPrize.index > 0){

            uint prizePrevios = prize*10/100;

            queue[previosDepositInfoForPrize.index].depositor.transfer(prizePrevios);

            prize -= prizePrevios;

        }



        queue[lastDepositInfoForPrize.index].depositor.send(prize);

        

        proceedToNewStage(getCurrentStageByTime() + 1);

    }



    //§¥§à§Ò§Ñ§Ó§Ú§ä§î §Ó§í§á§Ý§Ñ§ä§å §Ó §à§é§Ö§â§Ö§Õ§î

    function push(address depositor, uint deposit, uint expect) private {

        //Add the investor into the queue

        Deposit memory dep = Deposit(depositor, uint128(deposit), uint128(expect));

        assert(currentQueueSize <= queue.length); //Assert queue size is not corrupted

        if(queue.length == currentQueueSize)

            queue.push(dep);

        else

            queue[currentQueueSize] = dep;



        currentQueueSize++;

    }



    //§ª§ß§æ§à§â§Þ§Ñ§è§Ú§ñ §à §Õ§Ö§á§à§Ù§Ú§ä§Ö

    function getDeposit(uint idx) public view returns (address depositor, uint deposit, uint expect){

        Deposit storage dep = queue[idx];

        return (dep.depositor, dep.deposit, dep.expect);

    }



    //§¬§à§Ý§Ú§é§Ö§ã§ä§Ó§à §Õ§Ö§á§à§Ù§Ú§ä§à§Ó §Ó§ß§Ö§ã§Ö§ß§ß§à§Ö §Ú§Ô§â§à§Ü§à§Þ

    function getDepositsCount(address depositor) public view returns (uint) {

        uint c = 0;

        for(uint i=currentReceiverIndex; i<currentQueueSize; ++i){

            if(queue[i].depositor == depositor)

                c++;

        }

        return c;

    }



    //§¬§à§Ý§Ú§é§Ö§ã§ä§Ó§à §å§é§Ñ§ã§ä§ß§Ú§Ü§à§Ó §Ú§Ô§â§í

    function getQueueLength() public view returns (uint) {

        return currentQueueSize - currentReceiverIndex;

    }



    //§¯§à§Þ§Ö§â §Ó§Ü§Ý§Ñ§Õ§Ñ §Ó §ä§Ö§Ü§å§ë§Ö§Û §à§é§Ö§â§Ö§Õ§Ú

    function getDepositorMultiplier(address depositor) public view returns (uint) {

        DepositCount storage c = depositsMade[depositor];

        uint count = 0;

        if(c.stage == getCurrentStageByTime())

            count = c.count;

        if(count < MULTIPLIERS.length)

            return MULTIPLIERS[count];



        return MULTIPLIERS[MULTIPLIERS.length - 1];

    }



    // §´§Ö§Ü§å§ë§Ú§Û §ï§ä§Ñ§á §Ú§Ô§â§í

    function getCurrentStageByTime() public view returns (int) {

        return int(now - 17848 * 86400 - 16 * 3600 - 30 * 60) / (24 * 60 * 60);

    }



    // §£§â§Ö§Þ§ñ §ß§Ñ§é§Ñ§Ý§Ñ §ã§Ý§Ö§Õ§å§ð§ë§Ö§Û §Ú§Ô§â§í

    function getNextStageStartTime() public view returns (uint) {

        return 17848 * 86400 + 16 * 3600 + 30 * 60 + uint((getCurrentStageByTime() + 1) * 24 * 60 * 60); //§ã§ä§Ñ§â§ä 19:30

    }



    //§ª§ß§æ§à§â§Þ§Ñ§è§Ú§ñ §à§Ò §Ü§Ñ§ß§Õ§Ú§Õ§Ñ§ä§Ö §ß§Ñ §á§â§Ú§Ù

    function getCurrentCandidateForPrize() public view returns (address addr, int timeLeft){

        if(currentReceiverIndex <= lastDepositInfoForPrize.index && lastDepositInfoForPrize.index < currentQueueSize){

            Deposit storage d = queue[lastDepositInfoForPrize.index];

            addr = d.depositor;

            timeLeft = int(lastDepositInfoForPrize.time + MAX_IDLE_TIME) - int(now);

        }

    }

}