/**

 *Submitted for verification at Etherscan.io on 2019-05-30

*/



pragma solidity ^0.4.22;

contract Ownable {

  address public owner;



  event OwnershipRenounced(address indexed previousOwner);

  event OwnershipTransferred(

    address indexed previousOwner,

    address indexed newOwner

  );



  /**

   * @dev ��ӵ�еĹ��캯������ͬ��ԭʼ�������ߡ�����Ϊ������

   * account.

   */

  constructor() public {

    owner = msg.sender;

  }



  /**

   * @dev �����������������κ��ʻ����ã����׳�

   */

  modifier onlyOwner() {

    require(msg.sender == owner);

    _;

  }



  /**

   * @dev ����ҵ��������ͬ�Ŀ���Ȩ.

   */

  function renounceOwnership() public onlyOwner {

    emit OwnershipRenounced(owner);

    owner = address(0);

  }



  /**

   * @dev ����ǰ�����߽���ͬ�Ŀ���ת�Ƹ���������.

   */

  function transferOwnership(address _newOwner) public onlyOwner {

    _transferOwnership(_newOwner);

  }



  /**

   * @dev ����ͬ�Ŀ���Ȩ�ƽ�����������.

   */

  function _transferOwnership(address _newOwner) internal {

    require(_newOwner != address(0));

    emit OwnershipTransferred(owner, _newOwner);

    owner = _newOwner;

  }

}



contract TokenMall is Ownable {

  /**

   * @dev ��Ѻ��������Ϣ.

   */

  struct MortgageInfo {

      bytes32 projectId;//��ĿID 

      string currency;//��Ѻ���� 

      string mortgageAmount;//��Ѻ���� 

      string releaseAmount;//�ͷ����� 

  }

  mapping(bytes32 =>MortgageInfo) mInfo;

  bytes32[] mortgageInfos;

   

  /**

   * @dev �������.

   */

    event MessageMintInfo(address sender,bool isScuccess,string message);

    function mintMortgageInfo(string _projectId,string currency,string mortgageAmount,string releaseAmount) onlyOwner{

        bytes32 proId = stringToBytes32(_projectId);

        if(mInfo[proId].projectId != proId){

              mInfo[proId].projectId = proId;

              mInfo[proId].currency = currency;

              mInfo[proId].mortgageAmount = mortgageAmount;

              mInfo[proId].releaseAmount = releaseAmount;

              mortgageInfos.push(proId);

              MessageMintInfo(msg.sender, true,"��ӳɹ�");

            return;

        }else{

             MessageMintInfo(msg.sender, false,"��ĿID�Ѿ�����");

            return;

        }

    }

  /**

   * @dev ��������.

   */

    event MessageUpdateInfo(address sender,bool isScuccess,string message);

    function updateMortgageInfo(string _projectId,string releaseAmount) onlyOwner{

         bytes32 proId = stringToBytes32(_projectId);

        if(mInfo[proId].projectId == proId){

              mInfo[proId].releaseAmount = releaseAmount;

              mortgageInfos.push(proId);

              MessageUpdateInfo(msg.sender, true,"�޸ĳɹ�");

            return;

        }else{

             MessageUpdateInfo(msg.sender, false,"��ĿID������");

            return;

        }

    }

     

     

  /**

   * @dev ��ѯ����.

   */

    function getMortgageInfo(string _projectId) 

    public view returns(string projectId,string currency,string mortgageAmount,string releaseAmount){

         

         bytes32 proId = stringToBytes32(_projectId);

         

         MortgageInfo memory mi = mInfo[proId];

        

        return (_projectId,mi.currency,mi.mortgageAmount,mi.releaseAmount);

    }

    

     /// string����ת��Ϊbytes32��ת

    function stringToBytes32(string memory source) constant internal returns(bytes32 result){

        assembly{

            result := mload(add(source,32))

        }

    }

    /// bytes32����ת��Ϊstring��ת

    function bytes32ToString(bytes32 x) constant internal returns(string){

        bytes memory bytesString = new bytes(32);

        uint charCount = 0 ;

        for(uint j = 0 ; j<32;j++){

            byte char = byte(bytes32(uint(x) *2 **(8*j)));

            if(char !=0){

                bytesString[charCount] = char;

                charCount++;

            }

        }

        bytes memory bytesStringTrimmed = new bytes(charCount);

        for(j=0;j<charCount;j++){

            bytesStringTrimmed[j]=bytesString[j];

        }

        return string(bytesStringTrimmed);

    }



}