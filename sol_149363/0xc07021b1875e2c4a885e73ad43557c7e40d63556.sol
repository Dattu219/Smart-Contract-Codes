/**

 *Submitted for verification at Etherscan.io on 2018-12-12

*/



pragma solidity ^0.4.25;



/**

   QuickQueue contract: returns 103% of each investment!

  Automatic payouts!

  No bugs, no backdoors, NO OWNER - fully automatic!

  Made and checked by professionals!



  1. Send any sum to smart contract address

     - sum from 0.01 to 1 ETH

     - min 250000 gas limit

     - you are added to a queue

  2. Wait a little bit

  3. ...

  4. PROFIT! You have got 103%



  How is that?

  1. The first investor in the queue (you will become the

     first in some time) receives next investments until

     it become 103% of his initial investment.

  2. You will receive payments in several parts or all at once

  3. Once you receive 103% of your initial investment you are

     removed from the queue.

  4. You can make multiple deposits

  5. The balance of this contract should normally be 0 because

     all the money are immediately go to payouts





     So the last pays to the first (or to several first ones

     if the deposit big enough) and the investors paid 103% are removed from the queue



                new investor --|               brand new investor --|

                 investor5     |                           new investor       |

                 investor4     |     =======>         investor5        |

                 investor3     |                               investor4        |

    (part. paid) investor2    <|                      investor3        |

    (fully paid) investor1   <-|                    investor2   <----|  (pay until 103%)

    

    

  QuickQueue - ���ѧէ֧اߧ�� ��ާߧ�اڧ�֧ݧ�, �ܧ������ �ӧ�٧ӧ�ѧ�ѧ֧� 103% ��� �ӧѧ�֧ԧ� �է֧��٧ڧ��!



  ���ѧݧ֧ߧ�ܧڧ� �ݧڧާڧ� �ߧ� �է֧��٧ڧ� �ڧ٧ҧѧӧݧ�֧� ��� ����ҧݧ֧� �� �ܧ���ߧ�ާ� �ӧܧݧѧէѧާ� �� �էѧ֧� �ӧ�٧ާ�اߧ���� �٧ѧ�ѧҧ��ѧ�� �ܧѧاէ�ާ�!



  ���ӧ��ާѧ�ڧ�֧�ܧڧ� �ӧ��ݧѧ��!

  ����ݧߧ�� ����֧�� �� �����ѧ�֧ߧߧ�� �ߧ� ��֧ܧݧѧާ� ���֧է��ӧѧ� �� �ԧ�����!

  ���֧� ���ڧҧ��, �է��, �ѧӧ��ާѧ�ڧ�֧�ܧڧ� - �էݧ� �ӧ��ݧѧ� ���� ���������� �ѧէާڧߧڧ���ѧ�ڧ�!

  ����٧էѧ� �� ����ӧ֧�֧� �����֧��ڧ�ߧѧݧѧާ�!



  1. �����ݧڧ�� �ݧ�ҧ�� �ߧ֧ߧ�ݧ֧ӧ�� ���ާާ� �ߧ� �ѧէ�֧� �ܧ�ߧ��ѧܧ��

     - ���ާާ� ��� 0.01 �է� 1 ETH

     - gas limit �ާڧߧڧާ�� 250000

     - �ӧ� �ӧ��ѧߧ֧�� �� ���֧�֧է�

  2. ���֧ާߧ�ԧ� ���է�اէڧ��

  3. ...

  4. PROFIT! ���ѧ� ���ڧ�ݧ� 103% ��� �ӧѧ�֧ԧ� �է֧��٧ڧ��.



  ���ѧ� ���� �ӧ�٧ާ�اߧ�?

  1. ���֧�ӧ�� �ڧߧӧ֧���� �� ���֧�֧է� (�ӧ� ���ѧߧ֧�� ��֧�ӧ�� ���֧ߧ� ��ܧ���) ���ݧ��ѧ֧� �ӧ��ݧѧ�� ���

     �ߧ�ӧ�� �ڧߧӧ֧������ �է� ��֧� ����, ���ܧ� �ߧ� ���ݧ��ڧ� 103% ��� ��ӧ�֧ԧ� �է֧��٧ڧ��

  2. �����ݧѧ�� �ާ�ԧ�� ���ڧ��էڧ�� �ߧ֧�ܧ�ݧ�ܧڧާ� ��ѧ���ާ� �ڧݧ� �ӧ�� ���ѧ٧�

  3. ���ѧ� ���ݧ�ܧ� �ӧ� ���ݧ��ѧ֧�� 103% ��� �ӧѧ�֧ԧ� �է֧��٧ڧ��, �ӧ� ��էѧݧ�֧�֧�� �ڧ� ���֧�֧է�

  4. ���� �ާ�ا֧�� �է֧ݧѧ�� �ߧ֧�ܧ�ݧ�ܧ� �է֧��٧ڧ��� ���ѧ٧�

  5. ���ѧݧѧߧ� ����ԧ� �ܧ�ߧ��ѧܧ�� �է�ݧا֧� ��ҧ��ߧ� �ҧ��� �� ��ѧۧ�ߧ� 0, �����ާ� ���� �ӧ�� �������ݧ֧ߧڧ�

     ���ѧ٧� �ا� �ߧѧ��ѧӧݧ����� �ߧ� �ӧ��ݧѧ��



     ���ѧܧڧ� ��ҧ�ѧ٧��, ����ݧ֧էߧڧ� ��ݧѧ��� ��֧�ӧ��, �� �ڧߧӧ֧�����, �է���ڧԧ�ڧ� �ӧ��ݧѧ� 103% ��� �է֧��٧ڧ��,

     ��էѧݧ����� �ڧ� ���֧�֧է�, ������ѧ� �ާ֧��� ����ѧݧ�ߧ��



              �ߧ�ӧ�� �ڧߧӧ֧���� --|            ���ӧ�֧� �ߧ�ӧ�� �ڧߧӧ֧���� --|

                 �ڧߧӧ֧����5     |                              �ߧ�ӧ�� �ڧߧӧ֧����      |

                 �ڧߧӧ֧����4     |     =======>                �ڧߧӧ֧����5        |

                 �ڧߧӧ֧����3     |                                      �ڧߧӧ֧����4        |

 (��ѧ��. �ӧ��ݧѧ��) �ڧߧӧ֧����2    <|                       �ڧߧӧ֧����3        |

(���ݧߧѧ� �ӧ��ݧѧ��) �ڧߧӧ֧����1   <-|                   �ڧߧӧ֧����2   <----|  (�է��ݧѧ�� �է� 103%)



*/



contract QuickQueue {

   

    address constant private SUPPORT = 0x1f78Ae3ab029456a3ac5b6f4F90EaB5B675c47D5;  // Address for promo expences

    uint constant public SUPPORT_PERCENT = 5; //Percent for promo expences 5% (3% for advertizing, 2% for techsupport)

    uint constant public QUICKQUEUE = 103; // Percent for your deposit to be QuickQueue

    uint constant public MAX_LIMIT = 1 ether; // Max deposit = 1 Eth



    //The deposit structure holds all the info about the deposit made

    struct Deposit {

        address depositor; // The depositor address

        uint128 deposit;   // The deposit amount

        uint128 expect;    // How much we should pay out (initially it is 103% of deposit)

    }



    //The queue

    Deposit[] private queue;



    uint public currentReceiverIndex = 0;



    //This function receives all the deposits

    //stores them and make immediate payouts

    function () public payable {

        if(msg.value > 0){

            require(gasleft() >= 220000, "We require more gas!");

            require(msg.value <= MAX_LIMIT, "Deposit is too big");



            queue.push(Deposit(msg.sender, uint128(msg.value), uint128(msg.value * QUICKQUEUE / 100)));



            uint ads = msg.value * SUPPORT_PERCENT / 100;

            SUPPORT.transfer(ads);



            pay();

        }

    }



    //Used to pay to current investors

    //Each new transaction processes 1 - 4+ investors in the head of queue 

    //depending on balance and gas left

    function pay() private {

        uint128 money = uint128(address(this).balance);



        for(uint i = 0; i < queue.length; i++) {



            uint idx = currentReceiverIndex + i;



            Deposit storage dep = queue[idx];



            if(money >= dep.expect) {  

                dep.depositor.transfer(dep.expect);

                money -= dep.expect;



                delete queue[idx];

            } else {

                dep.depositor.transfer(money);

                dep.expect -= money;       

                break;                     

            }



            if (gasleft() <= 50000)     

                break;                     

        }



        currentReceiverIndex += i; 

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