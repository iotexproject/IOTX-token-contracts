# Smart Contracts for IOTX ERC20 tokens

The IOTX token contract is an ERC20-compatible token that is designed to be “pausable”, which means that we can pause transfers in case of a major security vulnerability or attack.

Security of users’ funds is our top priority. We welcome everyone to participate in this bug bounty program and contribute to the success of IoTeX! More details: https://medium.com/@iotex/bug-bounty-program-iotx-token-contract-c414013fa46e


## Development
```
npm install -g truffle
truffle develop
truffle(develop)> compile
```

## Test
```
truffle develop
truffle(develop)> migrate --reset
truffle(develop)> test

Using network 'develop'.
  Contract: IoTeXNetwork
    ✓ check total supply
    ✓ check owner
    ✓ check balance of stranger
    ✓ check balance after transfer (51ms)
    ✓ failed transfer exceed total supply
    ✓ failed transfer b/c paused
    ✓ approve and transfer from (191ms)

  7 passing (744ms)
```
