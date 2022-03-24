/**

 *Submitted for verification at Etherscan.io on 2018-11-14

*/



pragma solidity ^0.4.25;



contract FastGameMultiplier {



    //�ѧէ�֧� ���էէ֧�اܧ�

    address public support;



    //������֧ߧ��

	uint constant public PRIZE_PERCENT = 3;

    uint constant public SUPPORT_PERCENT = 2;

    

    //��ԧ�ѧߧڧ�֧ߧڧ� �է֧��٧ڧ��

    uint constant public MAX_INVESTMENT =  0.2 ether;

    uint constant public MIN_INVESTMENT = 0.01 ether;

    uint constant public MIN_INVESTMENT_FOR_PRIZE = 0.02 ether;

    uint constant public GAS_PRICE_MAX = 20; // �ާѧܧ�ڧާѧݧ�ߧѧ� ��֧ߧ� �ԧѧ٧� maximum gas price for contribution transactions

    uint constant public MAX_IDLE_TIME = 10 minutes; //�ӧ�֧ާ� ��اڧէѧߧڧ� �է� �٧ѧҧ��� ���ڧ٧� //Maximum time the deposit should remain the last to receive prize



    //����֧�ߧ���� �ڧԧ��, �ާڧߧڧާѧݧ�ߧ�� �ܧ�ݧڧ�֧��ӧ� ���ѧ��ߧڧܧ��

    uint constant public SIZE_TO_SAVE_INVEST = 10; //�ާڧߧڧާѧݧ�ߧ�� �ܧ�ݧڧ�֧��ӧ� ���ѧ��ߧڧܧ��

    uint constant public TIME_TO_SAVE_INVEST = 5 minutes; //�ӧ�֧ާ� ����ݧ� �ܧ�����ԧ� �ڧԧ�� �ާ�اߧ� ���ާ֧ߧڧ��

    

    //��֧�ܧ� �����֧ߧ��� �էݧ� �ӧݧ�ا֧ߧڧ� �� ��էߧ�� ���ѧ���, ���ѧ�� �ܧѧاէ�� ��ѧ� (��֧���ӧ�)

    uint8[] MULTIPLIERS = [

        115, //��֧�ӧ��

        120, //�ӧ�����

        125 //���֧�ڧ�

    ];



    //���ڧ�ѧߧڧ� �է֧��٧ڧ��

    struct Deposit {

        address depositor; //���է�֧� �է֧��٧ڧ��

        uint128 deposit;   //����ާާ� �է֧��٧ڧ�� 

        uint128 expect;    //���ܧ�ݧ�ܧ� �ӧ��ݧѧ�ڧ�� ��� �է֧��٧ڧ�� (115%-125%)

    }



   //����ڧ�ѧߧڧ� �ߧ�ާ֧�� ���֧�֧է� �� �ߧ�ާ֧� �է֧��٧ڧ�� �� ���֧�֧է�

    struct DepositCount {

        int128 stage;

        uint128 count;

    }



	//����ڧ�ѧߧڧ� ����ݧ֧էߧ֧ԧ� �� ���֧է���ݧ֧էߧ֧ԧ� �է֧��٧ڧ�� 

    struct LastDepositInfo {

        uint128 index;

        uint128 time;

    }



    Deposit[] private queue;  //The queue



    uint public currentReceiverIndex = 0; //���ߧէ֧ܧ� ��֧�ӧ�ԧ� �ڧߧӧ֧����� The index of the first depositor in the queue. The receiver of investments!

    uint public currentQueueSize = 0; //���ѧ٧ާ֧� ���֧�֧է� The current size of queue (may be less than queue.length)

    LastDepositInfo public lastDepositInfoForPrize; //�����ݧ֧էߧڧ� �է֧��٧ڧ� �էݧ� ���ا֧ܧ� The time last deposit made at

    LastDepositInfo public previosDepositInfoForPrize; //����֧է���ݧ֧էߧڧ� �է֧��٧ڧ� �էݧ� ���ا֧ܧ� The time last deposit made at



    uint public prizeAmount = 0; //����ާާ� ���ڧ٧� ����ѧӧ�ѧ��� �� �����ݧ�ԧ� �٧ѧ���ܧ�

    uint public prizeStageAmount = 0; //����ާާ� ���ڧ٧� Prize �� ��֧ܧ��֧� �٧ѧ���ܧ� amount accumulated for the last depositor

    int public stage = 0; //����ݧڧ�֧��ӧ� ���ѧ���� Number of contract runs

    uint128 public lastDepositTime = 0; //����֧ާ� ����ݧ֧էߧ֧ԧ� �է֧��٧ڧ��

    

    mapping(address => DepositCount) public depositsMade; //The number of deposits of different depositors



    constructor() public {

        support = msg.sender; 

        proceedToNewStage(getCurrentStageByTime() + 1);

    }

    

    //This function receives all the deposits

    //stores them and make immediate payouts

    function () public payable {

        require(tx.gasprice <= GAS_PRICE_MAX * 1000000000);

        require(gasleft() >= 250000, "We require more gas!"); //���ݧ�ӧڧ� ��ԧ�ѧߧڧ�֧ߧڧ� �ԧѧ٧�

        

        checkAndUpdateStage();

        

        if(msg.value > 0){

            require(msg.value >= MIN_INVESTMENT && msg.value <= MAX_INVESTMENT); //����ݧ�ӧڧ�  �է֧��٧ڧ��

            require(lastDepositInfoForPrize.time <= now + MAX_IDLE_TIME); 



            



            require(getNextStageStartTime() >= now + MAX_IDLE_TIME + 10 minutes);//�ߧ֧ݧ�٧� �ڧߧӧ֧��ڧ��ӧѧ�� �٧� MAX_IDLE_TIME �է� ��ݧ֧է���֧ԧ� ���ѧ���



            //Pay to first investors in line

            if(currentQueueSize < SIZE_TO_SAVE_INVEST){ //����ѧ��ӧܧ� ��� ��ݧ���ԧ� ���ѧ���

                

                addDeposit(msg.sender, msg.value);

                

            } else {

                

                addDeposit(msg.sender, msg.value);

                pay(); 

                

            }

            

        } else if(msg.value == 0 && currentQueueSize > SIZE_TO_SAVE_INVEST){

            

            withdrawPrize(); //�ӧ��ݧѧ�� ���ڧ٧�

            

        } else if(msg.value == 0){

            

            require(currentQueueSize <= SIZE_TO_SAVE_INVEST); //���ݧ� �ӧ�٧ӧ�ѧ�� �է�ݧاߧ� �ҧ��� �ާ֧ߧ֧�, �ݧڧҧ� ��ѧӧߧ� SIZE_TO_SAVE_INVEST �ڧԧ��ܧ��

            require(lastDepositTime > 0 && (now - lastDepositTime) >= TIME_TO_SAVE_INVEST); //���ݧ� �ӧ�٧ӧ�ѧ�� �է�ݧاߧ� ����ۧ�� �ӧ�֧ާ� TIME_TO_SAVE_INVEST

            

            returnPays(); //���֧�ߧ��� �ӧ�� �է֧��٧ڧ��

            

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

                

                //�����ݧ� �ӧ��ݧѧ�� �է֧��٧ڧ�� + �����֧ߧ�� ��էѧݧ�֧��� �ڧ� ���֧�֧է� this investor is fully paid, so remove him

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



                dep.depositor.send(dep.deposit); //���ԧ�� �ߧ� �������ݧѧ��, �ӧ�٧ӧ�ѧ�

                money -= dep.deposit;            

                

                //�����ݧ� �ӧ��ݧѧ�� �է֧��٧ڧ�� + �����֧ߧ�� ��էѧݧ�֧��� �ڧ� ���֧�֧է� this investor is fully paid, so remove him

                delete queue[i];



        }



        prizeStageAmount = 0; //���֧�ߧ�ݧ� �է֧ߧ�ԧ�, �էا֧ܧ� ��֧ܧ��֧� ���֧�֧է� �ߧ֧�.

        proceedToNewStage(getCurrentStageByTime() + 1);

    }



    function addDeposit(address depositor, uint value) private {

        //Count the number of the deposit at this stage

        DepositCount storage c = depositsMade[depositor];

        if(c.stage != stage){

            c.stage = int128(stage);

            c.count = 0;

        }



        //����ѧ��ڧ� �� �ڧԧ�� �٧� �էا֧ܧ��� ���ݧ�ܧ� �ާڧߧڧާѧݧ�ߧ�� �է֧��٧ڧ�� MIN_INVESTMENT_FOR_PRIZE

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



        require(_stage >= stage); //���ѧ�� �֧�� �ߧ� ����ڧ٧��֧�



        if(_stage != stage){

            proceedToNewStage(_stage);

        }

    }



    function proceedToNewStage(int _stage) private {

        //����ѧ�� �ߧ�ӧ�� �ڧԧ��

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



    //�����ѧӧܧ� ���ڧ٧�

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



    //����ҧѧӧڧ�� �ӧ��ݧѧ�� �� ���֧�֧է�

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



    //���ߧ���ާѧ�ڧ� �� �է֧��٧ڧ��

    function getDeposit(uint idx) public view returns (address depositor, uint deposit, uint expect){

        Deposit storage dep = queue[idx];

        return (dep.depositor, dep.deposit, dep.expect);

    }



    //����ݧڧ�֧��ӧ� �է֧��٧ڧ��� �ӧߧ֧�֧ߧߧ�� �ڧԧ��ܧ��

    function getDepositsCount(address depositor) public view returns (uint) {

        uint c = 0;

        for(uint i=currentReceiverIndex; i<currentQueueSize; ++i){

            if(queue[i].depositor == depositor)

                c++;

        }

        return c;

    }



    //����ݧڧ�֧��ӧ� ���ѧ��ߧڧܧ�� �ڧԧ��

    function getQueueLength() public view returns (uint) {

        return currentQueueSize - currentReceiverIndex;

    }



    //����ާ֧� �ӧܧݧѧէ� �� ��֧ܧ��֧� ���֧�֧է�

    function getDepositorMultiplier(address depositor) public view returns (uint) {

        DepositCount storage c = depositsMade[depositor];

        uint count = 0;

        if(c.stage == getCurrentStageByTime())

            count = c.count;

        if(count < MULTIPLIERS.length)

            return MULTIPLIERS[count];



        return MULTIPLIERS[MULTIPLIERS.length - 1];

    }



    // ���֧ܧ��ڧ� ���ѧ� �ڧԧ��

    function getCurrentStageByTime() public view returns (int) {

        return int(now - 17848 * 86400 - 16 * 3600 - 30 * 60) / (24 * 60 * 60);

    }



    // ����֧ާ� �ߧѧ�ѧݧ� ��ݧ֧է���֧� �ڧԧ��

    function getNextStageStartTime() public view returns (uint) {

        return 17848 * 86400 + 16 * 3600 + 30 * 60 + uint((getCurrentStageByTime() + 1) * 24 * 60 * 60); //���ѧ�� 19:30

    }



    //���ߧ���ާѧ�ڧ� ��� �ܧѧߧէڧէѧ�� �ߧ� ���ڧ�

    function getCurrentCandidateForPrize() public view returns (address addr, int timeLeft){

        if(currentReceiverIndex <= lastDepositInfoForPrize.index && lastDepositInfoForPrize.index < currentQueueSize){

            Deposit storage d = queue[lastDepositInfoForPrize.index];

            addr = d.depositor;

            timeLeft = int(lastDepositInfoForPrize.time + MAX_IDLE_TIME) - int(now);

        }

    }

}