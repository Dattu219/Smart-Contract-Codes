/**
 *Submitted for verification at Etherscan.io on 2019-07-01
*/

//************* BREED COIN
//TOTAL SUPPLY      :20,000,000,000 BRE
//SYMBOL            :BRE
//TOKEN NAME        :BREED TOKEN



pragma solidity ^0.4.23;

contract ERC20Basic {
    uint256 public totalSupply;
    function balanceOf(address who) public constant returns (uint256);
    function transfer(address to, uint256 value) public returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
}

contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender) public constant returns (uint256);
    function transferFrom(address from, address to, uint256 value) public returns (bool);
    function approve(address spender, uint256 value) public returns (bool);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    mapping (address => uint256) public freezeOf;
}

library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {if (a == 0) {return 0;}c = a * b;assert(c / a == b);return c;}
    function div(uint256 a, uint256 b) internal pure returns (uint256) {return a / b;}
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {assert(b <= a);return a - b;}
    function add(uint256 a, uint256 b) internal pure returns (uint256 c) {c = a + b;assert(c >= a);return c;
    }
}

    contract ForeignToken {
        function balanceOf(address _owner) constant public returns (uint256);
        function transfer(address _to, uint256 _value) public returns (bool);
    }




contract BREEDTOKEN is ERC20 {
    using SafeMath for uint256;
    address owner = msg.sender;
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;  
	
	// Token Name
    string public constant name = "BREED TOKEN"; 
	
	// BREED Coin Symbol
    string public constant symbol = "BRE"; 
	
	// Number of Decimals
    uint public constant decimals = 8; 
	
	// total supply of BREED coin
    uint256 public totalSupply = 2000000000000000000; 
	
	// Initial BREED coins that will give to contract creator 
    uint256 public totalDistributed =  10000000000000 ; 
	
	// Minimum Contribution for BREED Coin
    uint256 public constant MIN = 1 ether / 100;  
	uint256 public constant MINbonus = 1 ether / 10;

	// BREED Coin Amount per Ethereum
    uint256 public tokensPerEth = 2000000000000000;

    //ICO Allocated Token
    uint256 public IcoLimit = 1500000000000000000;
    uint256 public FirstPhaseAllocated = 800000000000000000;
    uint256 public TotalIcoDist = 0; 
	
	
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    event Distr(address indexed to, uint256 amount);
    event DistrFinished();
    event FirstPFinished();
    event SecondPFinished();
    event Airdrop(address indexed _owner, uint _amount, uint _balance);
    event TokensPerEthUpdated(uint _tokensPerEth);
    event Burn(address indexed burner, uint256 value);
    event Freeze(address indexed from, uint256 value); //event freezing
    event Unfreeze(address indexed from, uint256 value); //event Unfreezing
    bool public distributionFinished = false;
    bool public firstPhaseFinished = false;
    bool public secondPhaseFinished = false;
    
    modifier canDistr() {
        require(!distributionFinished);
        _;
    }
    
    modifier firstPhaseDistr() {
        require(!firstPhaseFinished);
        _;
    }


    modifier secondPhaseDistr() {
        require(!secondPhaseFinished);
        _;
    }


    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    function fnBREEDTOKEN () public {owner = msg.sender;    
    FnDistr(owner, totalDistributed);}
    function transferOwnership(address newOwner) onlyOwner public {if (newOwner != address(0)) {owner = newOwner;}}
    
    function finishDistribution() onlyOwner canDistr public returns (bool) 
    {distributionFinished = true;
	emit DistrFinished(); return true;}
	
	function finishFirstPhase() onlyOwner firstPhaseDistr public returns (bool) 
    {firstPhaseFinished = true;
	emit FirstPFinished(); return true;}
	
	function finishSecondPhase() onlyOwner secondPhaseDistr public returns (bool) 
    {secondPhaseFinished = true;
	emit SecondPFinished(); return true;}
    
    function FnDistr(address _to, uint256 _amount) 
        canDistr private returns (bool) {
        totalDistributed = totalDistributed.add(_amount);        
        balances[_to] = balances[_to].add(_amount);
        emit Distr(_to, _amount);
        emit Transfer(address(0), _to, _amount);

        return true;
    }

    function FNAirdrop(address _participant, uint _amount) internal {
        require( _amount > 0 );      
        require( totalDistributed < totalSupply );  
        balances[_participant] = balances[_participant].add(_amount);
        totalDistributed = totalDistributed.add(_amount);

        if (totalDistributed >= totalSupply) {distributionFinished = true;}
        emit Airdrop(_participant, _amount, balances[_participant]);
        emit Transfer(address(0), _participant, _amount);
    }

    function FNAirdropSingle(address _participant, uint _amount) public onlyOwner {FNAirdrop(_participant, _amount);}

    function FNAirdropMultiple(address[] _addresses, uint _amount) public onlyOwner {for (uint i = 0; i < _addresses.length; i++) FNAirdrop(_addresses[i], _amount);}

    function FNupdateTokensPerEth(uint _tokensPerEth) public onlyOwner {        tokensPerEth = _tokensPerEth;
	emit TokensPerEthUpdated(_tokensPerEth);
    }
           
    function () external payable {getTokens();}
    
    function getTokens() payable canDistr  public {
        uint256 intToken = 0;
        uint256 tokens = 0;
        uint256 bonus = 0;
        
        require( msg.value >= MIN );
        require( msg.value > 0 );
        
        //first phase distribution
        if (firstPhaseFinished == false && secondPhaseFinished == false)
        {
            //if Total Ico Distributed is less than the first phase Ico Allocated Quantity
            if (TotalIcoDist < FirstPhaseAllocated) 
            {
                intToken = tokensPerEth.mul(msg.value) / 1 ether;
                if (msg.value >= MINbonus){bonus = (intToken * 25/100);} //Give bonus token when the investor sends 0.1 and above
                if (msg.value < MINbonus){bonus = 0;} //Remove bonus token when the investor sends 0.09 and below
                tokens = intToken + bonus; //token quatity based on token per eth price + bonus token
                TotalIcoDist = TotalIcoDist.add(tokens); //add token quantity to total ico distribute
                
            }
            
        }
        
        //second phase distribution
        if (firstPhaseFinished == true && secondPhaseFinished == false)
        {
            //if Total Ico Distributed is less that to Ico Allocated Quantity
            if (TotalIcoDist < IcoLimit) 
            {
                intToken = tokensPerEth.mul(msg.value) / 1 ether;
                if (msg.value >= MINbonus){bonus = (intToken * 10/100);} //Give bonus token when the investor sends 0.1 and above
                if (msg.value < MINbonus){bonus = 0;} //Remove bonus token when the investor sends 0.09 and below
                tokens = intToken + bonus; //token quatity based on token per eth price + bonus token
                TotalIcoDist = TotalIcoDist.add(tokens); //add token quantity to total ico distributed
            }
        }
        
        //first and second phase are finished
        if (firstPhaseFinished == true && secondPhaseFinished == true)
        {
              tokens = tokensPerEth.mul(msg.value) / 1 ether;    
        }
        
        
        
        address investor = msg.sender;
        if (tokens > 0) {FnDistr(investor, tokens);}
        if (totalDistributed >= totalSupply) {distributionFinished = true;}
    }


    modifier onlyPayloadSize(uint size) {
        assert(msg.data.length >= size + 4);
        _;
    }

    function balanceOf(address _owner) constant public returns (uint256) {
        return balances[_owner];
    }
    

    function transfer(address _to, uint256 _amount) onlyPayloadSize(2 * 32) public returns (bool success) {
        //check if sender has balance and for oveflow
        require(_to != address(0));
        require(_amount <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        balances[_to] = balances[_to].add(_amount);
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }
    
    function transferFrom(address _from, address _to, uint256 _amount) onlyPayloadSize(3 * 32) public returns (bool success) {
        require(_to != address(0));
        require(_amount <= balances[_from]);
        require(_amount <= allowed[_from][msg.sender]);
        balances[_from] = balances[_from].sub(_amount);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_amount);
        balances[_to] = balances[_to].add(_amount);
        emit Transfer(_from, _to, _amount);
        return true;
    }

    function withdrawForeignTokens(address _tokenContract) onlyOwner public returns (bool) 
	{ForeignToken token = ForeignToken(_tokenContract); uint256 amount = token.balanceOf(address(this));
	return token.transfer(owner, amount);}
    
    function approve(address _spender, uint256 _value) public returns (bool success) 
	{if (_value != 0 && allowed[msg.sender][_spender] != 0) { return false; } allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);return true;} 
   
    function getTokenBalance(address tokenAddress, address who) constant public returns (uint)
	{ForeignToken t = ForeignToken(tokenAddress); uint bal = t.balanceOf(who);return bal;}
    
	
    function withdrawEther() onlyOwner public {address myAddress = this; 
	uint256 etherBalance = myAddress.balance;owner.transfer(etherBalance);
    }
    
    function allowance(address _owner, address _spender) constant public returns (uint256) {return allowed[_owner][_spender];}
    
    function burnBREEDTOKENcoin(uint256 _value) onlyOwner public {require(_value <= balances[msg.sender]);
        address burner = msg.sender; balances[burner] = balances[burner].sub(_value);
        totalSupply = totalSupply.sub(_value); totalDistributed = totalDistributed.sub(_value);
        emit Burn(burner, _value);
    } 
    
}