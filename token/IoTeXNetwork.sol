pragma solidity ^0.4.18;

import './zeppelin/math/SafeMath.sol';
import './zeppelin/lifecycle/Pausable.sol';
import './zeppelin/token/BasicToken.sol';
import './zeppelin/token/ERC20.sol';
import './zeppelin/token/ERC20Basic.sol';
import './zeppelin/token/StandardToken.sol';

contract IoTeXNetwork is StandardToken, Pausable {
    string  public  constant name = "IoTeX Network";
    string  public  constant symbol = "IOTX";
    uint    public  constant decimals = 18;

    modifier validDestination( address to ) {
        require(to != address(0x0));
        require(to != address(this) );
        _;
    }

    function IoTeXNetwork( uint tokenTotalAmount) {
        // Mint all tokens. Then disable minting forever.
        balances[msg.sender] = tokenTotalAmount;
        totalSupply = tokenTotalAmount;
        Transfer(address(0x0), msg.sender, tokenTotalAmount);
    }

    function transfer(address _to, uint _value) whenNotPaused
        validDestination(_to)
        returns (bool) {
        return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint _value) whenNotPaused
        validDestination(_to)
        returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }

    function approve(address _spender, uint256 _value) public whenNotPaused
      returns (bool) {
      return super.approve(_spender, _value);
    }

    function increaseApproval(address _spender, uint _addedValue) public whenNotPaused
      returns (bool success) {
      return super.increaseApproval(_spender, _addedValue);
    }

    function decreaseApproval(address _spender, uint _subtractedValue) public whenNotPaused
      returns (bool success) {
      return super.decreaseApproval(_spender, _subtractedValue);
    }
}
