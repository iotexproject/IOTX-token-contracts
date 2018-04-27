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

### Test Coverage

```
npm install --save-dev solidity-coverage
./node_modules/.bin/solidity-coverage
...

----------------------|----------|----------|----------|----------|----------------|
File                  |  % Stmts | % Branch |  % Funcs |  % Lines |Uncovered Lines |
----------------------|----------|----------|----------|----------|----------------|
 contracts/           |      100 |       50 |      100 |      100 |                |
  IoTeXNetwork.sol    |      100 |       50 |      100 |      100 |                |
 contracts/lifecycle/ |    16.67 |       25 |       25 |       25 |                |
  Pausable.sol        |    16.67 |       25 |       25 |       25 |... 38,39,46,47 |
 contracts/math/      |    45.45 |       25 |       50 |    45.45 |                |
  SafeMath.sol        |    45.45 |       25 |       50 |    45.45 |... 17,18,19,29 |
 contracts/ownership/ |       20 |        0 |    33.33 |    16.67 |                |
  Ownable.sol         |       20 |        0 |    33.33 |    16.67 | 28,29,37,38,39 |
 contracts/token/     |    96.55 |       50 |      100 |    96.55 |                |
  BasicToken.sol      |      100 |       50 |      100 |      100 |                |
  ERC20.sol           |      100 |      100 |      100 |      100 |                |
  ERC20Basic.sol      |      100 |      100 |      100 |      100 |                |
  StandardToken.sol   |    95.24 |       50 |      100 |    95.24 |             92 |
----------------------|----------|----------|----------|----------|----------------|
All files             |    73.77 |    34.38 |    73.08 |    72.31 |                |
----------------------|----------|----------|----------|----------|----------------|

Istanbul coverage reports generated
Cleaning up...
```