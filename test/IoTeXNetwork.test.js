const IoTeXNetwork = artifacts.require('IoTeXNetwork');

contract('IoTeXNetwork', function ([owner, receiver, stranger, spender]) {
  const TOTAL_SUPPLY = 10000000000000000000000000000;

  beforeEach(async function () {
    this.iotx = await IoTeXNetwork.new(TOTAL_SUPPLY);
  });


  it('check total supply', async function () {
    assert.equal(await this.iotx.totalSupply(), TOTAL_SUPPLY);
  });

  it('check owner', async function () {
    assert.equal(await this.iotx.owner(), owner);
  });

  it('check balance of stranger', async function () {
    assert.equal(await this.iotx.balanceOf(stranger), 0);
  });

  it('check balance after transfer', async function () {
    await this.iotx.pause
    await this.iotx.unpause

    assert.equal(await this.iotx.balanceOf(receiver), 0);
    await this.iotx.transfer(receiver, 1234567);
    assert.equal(await this.iotx.balanceOf(receiver), 1234567);
  });

  it('failed transfer exceed total supply', async function () {
    try {
      await this.iotx.transfer(receiver, TOTAL_SUPPLY + 1);
      assert.fail()
    } catch (error) {}
  });

  it('failed transfer b/c paused', async function () {
    await this.iotx.pause
    try {
      await this.iotx.transfer(receiver, 1);
      assert.fail()
    } catch (error) {}
  });


  it('approve and transfer', async function () {
    await this.iotx.approve(spender, 1110, { from: owner });
    await this.iotx.increaseApproval(spender, 30, { from: owner });
    await this.iotx.decreaseApproval(spender, 50, { from: owner });
    assert.equal(await this.iotx.allowance(owner, spender), 1090);

    await this.iotx.transferFrom(owner, receiver, 1080, { from: spender });
    assert.equal(await this.iotx.balanceOf(receiver), 1080);
    assert.equal(await this.iotx.allowance(owner, spender), 10);

    await this.iotx.transferFrom(owner, receiver, 10, { from: spender });
    assert.equal(await this.iotx.balanceOf(receiver), 1090);
    assert.equal(await this.iotx.allowance(owner, spender), 0);
  });

});