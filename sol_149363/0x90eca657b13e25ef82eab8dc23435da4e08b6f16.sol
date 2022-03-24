/**

 *Submitted for verification at Etherscan.io on 2018-10-27

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





  ����ߧ��ѧܧ� ���ާߧ�اڧ�֧ݧ�: �ӧ�٧ӧ�ѧ�ѧ֧� 121% ��� �ӧѧ�֧ԧ� �է֧��٧ڧ��!

  ���ӧ��ާѧ�ڧ�֧�ܧڧ� �ӧ���ݧѧ��!

  ���֧� ���ڧҧ��, �է���, �ѧӧ��ާѧ�ڧ�֧�ܧڧ� - �էݧ� �ӧ���ݧѧ� ���� ���������� �ѧէާڧߧڧ���ѧ�ڧ�!

  ����٧էѧ� �� ����ӧ֧�֧� �����֧��ڧ�ߧѧݧѧާ�!



  1. �����ݧڧ�� �ݧ�ҧ�� �ߧ֧ߧ�ݧ֧ӧ�� ���ާާ� �ߧ� �ѧէ�֧� �ܧ�ߧ��ѧܧ��

     - ���ާާ� ��� 0.01 �է� 10 ETH

     - gas limit �ާڧߧڧާ�� 250000

     - �ӧ� �ӧ��ѧߧ֧�� �� ���֧�֧է�

  2. ���֧ާߧ�ԧ� ���է�اէڧ��

  3. ...

  4. PROFIT! ���ѧ� ���ڧ�ݧ� 121% ��� �ӧѧ�֧ԧ� �է֧��٧ڧ��.



  ���ѧ� ���� �ӧ�٧ާ�اߧ�?

  1. ���֧�ӧ��� �ڧߧӧ֧���� �� ���֧�֧է� (�ӧ� ���ѧߧ֧�� ��֧�ӧ��� ���֧ߧ� ��ܧ���) ���ݧ��ѧ֧� �ӧ���ݧѧ�� ���

     �ߧ�ӧ��� �ڧߧӧ֧������ �է� ��֧� ����, ���ܧ� �ߧ� ���ݧ��ڧ� 121% ��� ��ӧ�֧ԧ� �է֧��٧ڧ��

  2. ������ݧѧ�� �ާ�ԧ�� ���ڧ��էڧ�� �ߧ֧�ܧ�ݧ�ܧڧާ� ��ѧ���ާ� �ڧݧ� �ӧ�� ���ѧ٧�

  3. ���ѧ� ���ݧ�ܧ� �ӧ� ���ݧ��ѧ֧�� 121% ��� �ӧѧ�֧ԧ� �է֧��٧ڧ��, �ӧ� ��էѧݧ�֧�֧�� �ڧ� ���֧�֧է�

  4. ���� �ާ�ا֧�� �է֧ݧѧ�� �ߧ֧�ܧ�ݧ�ܧ� �է֧��٧ڧ��� ���ѧ٧�

  5. ���ѧݧѧߧ� ����ԧ� �ܧ�ߧ��ѧܧ�� �է�ݧا֧� ��ҧ���ߧ� �ҧ���� �� ��ѧۧ�ߧ� 0, �����ާ� ���� �ӧ�� �������ݧ֧ߧڧ�

     ���ѧ٧� �ا� �ߧѧ��ѧӧݧ����� �ߧ� �ӧ���ݧѧ��



     ���ѧܧڧ� ��ҧ�ѧ٧��, ����ݧ֧էߧڧ� ��ݧѧ��� ��֧�ӧ���, �� �ڧߧӧ֧�����, �է���ڧԧ�ڧ� �ӧ���ݧѧ� 121% ��� �է֧��٧ڧ��,

     ��էѧݧ����� �ڧ� ���֧�֧է�, ������ѧ� �ާ֧��� ����ѧݧ�ߧ���



              �ߧ�ӧ��� �ڧߧӧ֧���� --|            ���ӧ�֧� �ߧ�ӧ��� �ڧߧӧ֧���� --|

                 �ڧߧӧ֧����5     |                �ߧ�ӧ��� �ڧߧӧ֧����      |

                 �ڧߧӧ֧����4     |     =======>      �ڧߧӧ֧����5        |

                 �ڧߧӧ֧����3     |                   �ڧߧӧ֧����4        |

 (��ѧ��. �ӧ���ݧѧ��) �ڧߧӧ֧����2    <|                   �ڧߧӧ֧����3        |

(���ݧߧѧ� �ӧ���ݧѧ��) �ڧߧӧ֧����1   <-|                   �ڧߧӧ֧����2   <----|  (�է��ݧѧ�� �է� 121%)



*/



contract Multiplier {

    //Address for promo expences

    address constant private PROMO = 0x96D5c7F327972AbdB43d28f02b75abFB791b0755;

    //Percent for promo expences

    uint constant public PROMO_PERCENT = 7; //6 for advertizing, 1 for techsupport

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

        if(msg.value > 0){

            require(gasleft() >= 220000, "We require more gas!"); //We need gas to process queue

            require(msg.value <= 10 ether); //Do not allow too big investments to stabilize payouts



            //Add the investor into the queue. Mark that he expects to receive 121% of deposit back

            queue.push(Deposit(msg.sender, uint128(msg.value), uint128(msg.value*MULTIPLIER/100)));



            //Send some promo to enable this contract to leave long-long time

            uint promo = msg.value*PROMO_PERCENT/100;

            PROMO.transfer(promo);



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

                dep.depositor.transfer(dep.expect); //Send money to him

                money -= dep.expect;            //update money left



                //this investor is fully paid, so remove him

                delete queue[idx];

            }else{

                //Here we don't have enough money so partially pay to investor

                dep.depositor.transfer(money); //Send to him everything we have

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