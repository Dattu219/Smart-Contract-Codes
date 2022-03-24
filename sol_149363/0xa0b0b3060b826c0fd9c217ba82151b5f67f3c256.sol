/**

 *Submitted for verification at Etherscan.io on 2019-06-10

*/



pragma solidity >=0.4.22 <0.6.0;



contract ThreeLeeks {

    struct STR_NODE

        {

            address payable addr;

            uint32 ID;

            uint32 faNode;//���ڵ�

            uint32 brNode;//�ֵܽڵ�

            uint32 chNode;//�ӽڵ�

            uint256 Income;//��õ�����

            uint32 Subordinate;//���¼���

        }

    struct PRIZE_RECORD

    {

        address addr;//��ý���ַ��

        uint32 NodeNumber;//�񽱵�Node���

        uint256 EthGained;//��״���

    }

    //���˼�������¼�  �Ƽ���/������Ա�ı��/����ʱ��

    event HaveAdd(uint32 Recommender,uint32 Number,uint64 Add_Time);

    //ִ�н��� ���˱��/�񽱽��/�������

    event OnReward(uint32 Awardee,uint256 PrizeMoney,uint32 PrizeNumber);

    

    mapping (uint32 => STR_NODE) private Node;//���ӳ��

    mapping (uint32 => PRIZE_RECORD)private PrizeRecord;

    uint32 NodeIndex;//��ǰӳ��

    uint32 PrizeIndex;//��ǰ�񽱼�¼

    uint64 NodeAddTime;//���һ�μ����ʱ��

    bool IsDistribution;//���ؼ�ʱ�Ƿ�ʼ

    address payable ContractAddress;

    /* Initializes contract with initial supply tokens to the creator of the contract */

    constructor  () public {//���췽��

        NodeIndex=0;

        PrizeIndex=0;

        Node[0]=STR_NODE(msg.sender,0,0,0,0,0,0);

        NodeIndex=10;

        for (uint32 i=1;i<=10;i++)

        {

            Node[i]=STR_NODE(msg.sender,i,0,0,0,0,0);

        }

        ContractAddress=address(uint160(address(this)));

    }

  

    /*  ������ע���ʽ�,Recommender��Ͷ���˵��Ƽ��˱��*/

    function CapitalInjection(uint32 Recommender)public payable

    {

        uint32 index;

        require(Recommender>=0 && Recommender<NodeIndex,"Recommenders do not exist");

        if(msg.value!=0.99 ether)

        {

            msg.sender.transfer(msg.value);

            emit HaveAdd(0,0,uint64(now));

            return ;

        }

        NodeAddTime=uint64(now);

        NodeIndex+=1;

        //���ؼ�ʱ��ʼ

        if(IsDistribution==true)IsDistribution=false;

        //���Ƽ�����Ϊ��ǰͶ���ߵ�����

        Node[NodeIndex]=STR_NODE(msg.sender,NodeIndex,Recommender,0,0,0,0);

            

        if(Node[Recommender].chNode<=0)//����Ƽ��˻�û������

        {//�ѵ�ǰͶ������Ϊ�Ƽ��˵�����

            Node[Recommender].chNode=NodeIndex;

        }

        else//����Ƽ����Ѿ���������

        {

            index=Node[Recommender].chNode;

            while (Node[index].brNode>0)//ѭ������ֱ���Ƽ��˵��ӽڵ�û���ֵܽڵ�

            {

                index=Node[index].brNode;

            }

            Node[index].brNode=NodeIndex;//�ѵ�ǰͶ������Ϊ�Ƽ��˵����ߵ��ֵ�

        }



        //�������ʵ���˽ڵ������߹�ϵ����ʼת��

        index=Node[NodeIndex].faNode;

        Node[index].addr.transfer(0.3465 ether);//ֱ���ϼ���ȡ0.999*35%

        Node[index].Income+=0.3465 ether;

        Node[index].Subordinate+=1;

        index=Node[index].faNode;

        for (uint32 i=0;i<10;i++)

        {

            Node[index].addr.transfer(0.0495 ether);//����ϼ���ȡ0.999*5%

            Node[index].Income+=0.0495 ether;

            if(index!=0) Node[index].Subordinate+=1;

            index=Node[index].faNode;//indexָ�򸸽ڵ�

        }

        Node[0].addr.transfer(0.0495 ether);

        

        //���˼�������¼�

        emit HaveAdd(Recommender,NodeIndex,NodeAddTime);

    }

    //�������ɲ����ߵ��ã�����׼��������Ѽ���

    function FreeAdmission(address addr,uint32 index)public returns (bool)

    {

        //ֻ���ɲ�����ִ��

        require (msg.sender==Node[0].addr,"This function can only be called by the deployer");

        //������Ҳֻ���޸ı��Ϊǰ10��

        require (index>0 && index<=10,"Users who can only modify the first 10 numbers");

        //��ָ����ַ���ø�ĳ�����

        Node[index].addr=address(uint160(addr));

        return true;

    }

    //���������ؽ����ʽ��ܶ��

    function GetPoolOfFunds()public view returns(uint256)

    {

        return ContractAddress.balance;

    }

    //�����������Լ���Index

    function GetMyIndex() public view returns(uint32)

    {

        for(uint32 i=0 ;i<=NodeIndex;i++)

        {    if(msg.sender==Node[i].addr)

            {

                return i;

            }

        }

        return 0;

    }

    //�����ҵ�������

    function GetMyIncome() public view returns(uint256)

    {

        uint32 ret=GetMyIndex();

        return Node[ret].Income;

    }

    //�����ҵ��Ƽ���

    function GetMyRecommend() public view returns(uint32)

    {

        uint32 ret=GetMyIndex();

        return Node[ret].faNode;

    }

    //�����ҵ��¼�������

    function GetMySubordinateNumber(uint32 ID)public view returns(uint32)

    {

        uint32 index;

        if(ID>0 && ID<=NodeIndex)

        {

            index=ID;

        }

        else

            {index=GetMyIndex();}

        return Node[index].Subordinate;

    }

    //����ֱ���¼���

    function GetMyRecommendNumber(uint32 ID)public view returns(uint32)

    {

        uint32 index;

        if(ID>0 && ID<=NodeIndex)

        {

            index=ID;

        }

        else

            {index=GetMyIndex();}

        uint32 Number;

        if(Node[index].chNode>0)

        {

            Number=1;

            index=Node[index].chNode;

            while (Node[index].brNode>0)

            {

                Number++;

                index=Node[index].brNode;

            }

        }

    return Number;

    }

    //����������

    function GetAllPeopleNumber()public view returns(uint32)

    {

        return NodeIndex;

    }

    //�����ʽ��50%���ʽ�����˻�

    function DistributionMoney() public payable

    {

        require(ContractAddress.balance>0,"There is no capital in the pool.");

        if(IsDistribution==false && now-NodeAddTime>86400)

        {

            IsDistribution=true;

            Node[NodeIndex].addr.transfer((ContractAddress.balance)/2);

            Node[NodeIndex].Income+=ContractAddress.balance;

            PrizeRecord[PrizeIndex]=PRIZE_RECORD(Node[NodeIndex].addr,NodeIndex,ContractAddress.balance);

            emit OnReward(NodeIndex,ContractAddress.balance,PrizeIndex);

            PrizeIndex++;

        }

    }

    //���ٺ�Լ

    function DeleteContract() public payable

    {

        require(msg.sender==Node[0].addr,"This function can only be called by the deployer");

        uint256 AverageMoney=ContractAddress.balance/NodeIndex;

        for (uint32 i=0;i<NodeIndex;i++)

        {

            Node[i].addr.transfer(AverageMoney);

        }

        selfdestruct(Node[0].addr);

        

    }

    //�������һ���˼���ʱ��

    function GetLastAddTime()public view returns(uint64)

    {

        return NodeAddTime;

    }



}