pragma solidity ^0.4.18;

import './zeppelin/math/SafeMath.sol';
import './zeppelin/ownership/Ownable.sol';
import './zeppelin/token/BasicToken.sol';
import './zeppelin/token/ERC20.sol';
import './zeppelin/token/ERC20Basic.sol';
import './zeppelin/token/StandardToken.sol';

contract IoTeXNetwork is StandardToken, Ownable {
    string  public  constant name = "IoTeX Network";
    string  public  constant symbol = "IOTX";
    uint    public  constant decimals = 18;

    modifier validDestination( address to ) {
        require(to != address(0x0));
        require(to != address(this) );
        _;
    }

    function IoTeXNetwork( uint tokenTotalAmount, address admin ) {
        // Mint all tokens. Then disable minting forever.
        balances[msg.sender] = tokenTotalAmount;
        totalSupply = tokenTotalAmount;
        Transfer(address(0x0), msg.sender, tokenTotalAmount);

        transferOwnership(admin); // admin could drain tokens that were sent here by mistake
    }

    function transfer(address _to, uint _value)
        validDestination(_to)
        returns (bool) {
        return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint _value)
        validDestination(_to)
        returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }

    function emergencyERC20Drain( ERC20 token, uint amount ) onlyOwner {
        token.transfer( owner, amount );
    }
}
