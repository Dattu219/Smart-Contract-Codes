/**

 *Submitted for verification at Etherscan.io on 2018-11-24

*/



pragma solidity ^0.4.24;



contract ERC20Token {



      string public name = "DemoICO";

      string public symbol = "DICO";

      uint8 public decimals = 0;

      uint public INITIAL_SUPPLY = 10000 * (uint256(10) ** decimals);



      constructor() public {

          _mint(msg.sender, INITIAL_SUPPLY);

      }



      event Transfer(

        address indexed from,

        address indexed to,

        uint256 value

      );



      event Approval(

        address indexed owner,

        address indexed spender,

        uint256 value

      );



      using SafeMath for uint256;

      mapping (address => uint256) private _balances;

      mapping (address => mapping (address => uint256)) private _allowed;

      uint256 private _totalSupply;



      function totalSupply() public view returns (uint256) {

        return _totalSupply;

      }



      function balanceOf(address owner) public view returns (uint256) {

        return _balances[owner];

      }



      function allowance(

        address owner,

        address spender

       )

        public

        view

        returns (uint256)

      {

        return _allowed[owner][spender];

      }



      function transfer(address to, uint256 value) public returns (bool) {

        _transfer(msg.sender, to, value);

        return true;

      }



      function approve(address spender, uint256 value) public returns (bool) {

        require(spender != address(0));

        _allowed[msg.sender][spender] = value;

        emit Approval(msg.sender, spender, value);

        return true;

      }



      function transferFrom(

        address from,

        address to,

        uint256 value

      )

        public

        returns (bool)

      {

        require(value <= _allowed[from][msg.sender]);



        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);

        _transfer(from, to, value);

        return true;

      }



      function increaseAllowance(

        address spender,

        uint256 addedValue

      )

        public

        returns (bool)

      {

        require(spender != address(0));

        _allowed[msg.sender][spender] = (

          _allowed[msg.sender][spender].add(addedValue));

        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);

        return true;

      }



      function decreaseAllowance(

        address spender,

        uint256 subtractedValue

      )

        public

        returns (bool)

      {

        require(spender != address(0));



        _allowed[msg.sender][spender] = (

          _allowed[msg.sender][spender].sub(subtractedValue));

        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);

        return true;

      }



      function _transfer(address from, address to, uint256 value) internal {

        require(value <= _balances[from]);

        require(to != address(0));



        _balances[from] = _balances[from].sub(value);

        _balances[to] = _balances[to].add(value);

        emit Transfer(from, to, value);

      }



      function _mint(address account, uint256 value) internal {

        require(account != 0);

        _totalSupply = _totalSupply.add(value);

        _balances[account] = _balances[account].add(value);

        emit Transfer(address(0), account, value);

      }



      function _burn(address account, uint256 value) internal {

        require(account != 0);

        require(value <= _balances[account]);



        _totalSupply = _totalSupply.sub(value);

        _balances[account] = _balances[account].sub(value);

        emit Transfer(account, address(0), value);

      }



      function _burnFrom(address account, uint256 value) internal {

        require(value <= _allowed[account][msg.sender]);

        _allowed[account][msg.sender] = _allowed[account][msg.sender].sub(

          value);

        _burn(account, value);

      }



}



library SafeMath {

      function mul(uint256 a, uint256 b) internal pure returns (uint256) {

        if (a == 0) {

          return 0;

        }

        uint256 c = a * b;

        require(c / a == b);

        return c;

      }

      function div(uint256 a, uint256 b) internal pure returns (uint256) {

        require(b > 0);

        uint256 c = a / b;

        return c;

      }

      function sub(uint256 a, uint256 b) internal pure returns (uint256) {

        require(b <= a);

        uint256 c = a - b;

        return c;

      }

      function add(uint256 a, uint256 b) internal pure returns (uint256) {

        uint256 c = a + b;

        require(c >= a);

        return c;

      }

      function mod(uint256 a, uint256 b) internal pure returns (uint256) {

        require(b != 0);

        return a % b;

      }

}