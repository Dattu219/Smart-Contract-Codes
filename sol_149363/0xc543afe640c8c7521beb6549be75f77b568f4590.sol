/**

 *Submitted for verification at Etherscan.io on 2018-10-27

*/



pragma solidity ^0.4.25;



/**





    �X�T�T�T�[�X�T�T�T�[�X�T�T�T�T�[�������X�[���X�[���X�[

    �U�X�T�T�a�U�X�T�T�a�^�T�[�X�T�a�����X�a�U�X�a�U�X�a�U

    �U�U�X�T�[�U�^�T�T�[�����U�U���������^�[�U�^�[�U�^�[�U

    �U�U�^�[�U�U�X�T�T�a�����U�U�����������U�U���U�U���U�U

    �U�^�T�a�U�U�^�T�T�[�����U�U�����������U�U���U�U���U�U

    �^�T�T�T�a�^�T�T�T�a�����^�a�����������^�a���^�a���^�a



   Automatic returns 111% of each investment!

   M A X  D E P O S I T E  I S  2 ETH  

   NO HUMAN Factor - fully automatic!

   http://get111.today/ 

   Join Telegram Group https://t.me/joinchat/Ky1lEBJD3jLvXXMqcpGEOQ

   Admin https://t.me/Get111Admin

  1. Send ETH to smart contract address

     - from 0.01 to 2 ETH

     - min 250000 gas limit 

  2. Wait a bit time..

  3. Promote us if you want...

  4. Get your 111%



  Admin fee is 5% ( 3% for tech support. 2% for transaction gas fees )



     

 

  ���ӧ��ާѧ�ڧ�֧�ܧڧ� �ӧ��ݧѧ�� 111% ��� �ӧѧ�֧ԧ� �է֧��٧ڧ��!

  �� �� �� �� �� �� �� �� �� �� �� ��  �� �� �� �� �� �� ��  2 ETH 

  ���֧� �������������������������� ��ѧܧ���� - ����ݧߧѧ� �ѧӧ��ާѧ�ڧܧ�!

  http://get111.today/

  ���֧ݧ֧ԧ�ѧ� ��������  https://t.me/joinchat/Ky1lEBJD3jLvXXMqcpGEOQ

  ���էާڧ� https://t.me/Get111Admin

  1. ������ѧӧ��� ETH �ߧ� �ѧէ�֧� �ܧ�ߧ��ѧܧ��

     - ��� 0.01 �է� 2 ETH

     - gas limit �ާڧߧڧާ�� 250000

  2. ����ا֧�� �اէѧ��, �� �ާ�ا֧��,.

  3. ���ѧ��ܧѧ٧ѧ�� �է��٧���.

  4. ����ݧ��ڧ�� �ӧѧ�� 111% ���ڧҧ�ݧ�.



  ����ާڧ��ڧ� �ѧէާڧߧڧ���ѧ���� �����ѧӧݧ�֧� 5% ( 3% ��֧� ���էէ֧�اܧ�. 2% �ڧ٧է֧�اܧ� �ߧ� ���ݧѧ�� �ԧѧ٧� )



*/



contract GET111 {

    address constant private ADMIN = 0x411647BA6480bF5FDec2145f858FD37AeCBfC03B;

    uint constant public ADMIN_FEE = 5;

    uint constant public PROFIT = 111;



    struct Deposit {

        address depositor; //depositor address

        uint128 deposit;   //deposit amount

        uint128 expect;    //payout 111% (100% + 11%)

    }



    Deposit[] private queue;

    uint public currentReceiverIndex = 0;



    //That function receive deposits, saves and after make instant payments

    function () public payable {

        if(msg.value > 0){

            require(gasleft() >= 220000, "We require more gas!"); //gas need to process transaction

            require(msg.value <= 2 ether); //We not allow big sums, it is for contract long life



            //Adding investor into queue. Now he expects to receive 111% of his deposit

            queue.push(Deposit(msg.sender, uint128(msg.value), uint128(msg.value*PROFIT/100)));



            //Send fees 5% (3%+2%)

            uint admin = msg.value*ADMIN_FEE/100;

            ADMIN.send(admin);



            //First in line get paid instantly

            pay();

        }

    }



    //This function paying for the first users in line  

    function pay() private {

        uint128 money = uint128(address(this).balance);



        for(uint i=0; i<queue.length; i++){



            uint idx = currentReceiverIndex + i;



            Deposit storage dep = queue[idx];



            if(money >= dep.expect){

                dep.depositor.send(dep.expect);

                money -= dep.expect;



                //User total paid

                delete queue[idx];

            }else{

                

                dep.depositor.send(money);

                dep.expect -= money;

                break;

            }



            if(gasleft() <= 50000)

                break;

        }



        currentReceiverIndex += i;

    }



    function getDeposit(uint idx) public view returns (address depositor, uint deposit, uint expect){

        Deposit storage dep = queue[idx];

        return (dep.depositor, dep.deposit, dep.expect);

    }



    function getDepositsCount(address depositor) public view returns (uint) {

        uint c = 0;

        for(uint i=currentReceiverIndex; i<queue.length; ++i){

            if(queue[i].depositor == depositor)

                c++;

        }

        return c;

    }



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



    function getQueueLength() public view returns (uint) {

        return queue.length - currentReceiverIndex;

    }



}