pragma solidity ^0.4.21;

import './math/SafeMath.sol';
import './lifecycle/Pausable.sol';
import './token/BasicToken.sol';
import './token/ERC20.sol';
import './token/ERC20Basic.sol';
import './token/StandardToken.sol';

contract IoTeXNetwork is StandardToken, Pausable {
    string public constant name = "IoTeX Network";
    string public constant symbol = "IOTXTEST";
    uint8 public constant decimals = 18;

    modifier validDestination(address to) {
        require(to != address(0x0));
        require(to != address(this) );
        _;
    }

    function IoTeXNetwork(uint tokenTotalAmount) {
        totalSupply_ = tokenTotalAmount;
        balances[msg.sender] = tokenTotalAmount;
        emit Transfer(address(0x0), msg.sender, tokenTotalAmount);
    }

    /*@CTK CtkTransferNoEffect
      @post (_to == address(0)) \/ (paused == true) -> __reverted == true
     */
    /*@CTK CtkTransferEffect
      @pre __reverted == false
      @pre balances[msg.sender] >= _value
      @pre paused == false
      @pre __return == true
      @pre msg.sender != _to
      @post __post.balances[_to] == balances[_to] + _value
      @post __has_overflow == false
     */
    /* CertiK Smart Labelling, for more details visit: https://certik.org */
    function transfer(address _to, uint _value) whenNotPaused
        validDestination(_to)
        returns (bool) {
        return super.transfer(_to, _value);
    }

    /*@CTK CtkTransferFromNoEffect
      @post (_to == address(0)) \/ (paused == true) -> __reverted == true
     */
    /*@CTK CtkTransferFromEffect
      @tag assume_completion
      @pre _from != _to
      @post __post.balances[_to] == balances[_to] + _value
      @post __post.balances[_from] == balances[_from] - _value
      @post __has_overflow == false
     */
    /* CertiK Smart Labelling, for more details visit: https://certik.org */
    function transferFrom(address _from, address _to, uint _value) whenNotPaused
        validDestination(_to)
        returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }

    /*@CTK CtkApproveNoEffect
      @post (paused == true) -> __post == this
     */
    /*@CTK CtkApprove
      @tag assume_completion
      @post __post.allowed[msg.sender][_spender] == _value
     */
    /* CertiK Smart Labelling, for more details visit: https://certik.org */
    function approve(address _spender, uint256 _value) public whenNotPaused
      returns (bool) {
      return super.approve(_spender, _value);
    }

    /*@CTK CtkIncreaseApprovalNoEffect
      @post (paused == true) -> __reverted == true
     */
    /*@CTK CtkIncreaseApprovalEffect
      @pre paused == false
      @tag assume_completion
      @post __post.allowed[msg.sender][_spender] == allowed[msg.sender][_spender] + _addedValue
      @post __has_overflow == false
     */
    /* CertiK Smart Labelling, for more details visit: https://certik.org */
    function increaseApproval(address _spender, uint _addedValue) public whenNotPaused
      returns (bool success) {
      return super.increaseApproval(_spender, _addedValue);
    }

    /*@CTK CtkDecreaseApprovalNoEffect
      @post (paused == true) -> __reverted == true
     */
    /*@CTK CtkDecreaseApprovalEffect
      @pre allowed[msg.sender][_spender] >= _subtractedValue
      @tag assume_completion
      @post __post.allowed[msg.sender][_spender] == allowed[msg.sender][_spender] - _subtractedValue
      @post __has_overflow == false
     */
    /* CertiK Smart Labelling, for more details visit: https://certik.org */
    function decreaseApproval(address _spender, uint _subtractedValue) public whenNotPaused
      returns (bool success) {
      return super.decreaseApproval(_spender, _subtractedValue);
    }
}
