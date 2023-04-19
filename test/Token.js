const {expect} = require("chai");
const {ethers} = require("hardhat");
const {json} = require("hardhat/internal/core/params/argumentTypes");
describe("Token", function () {
    let Token, token, owner, addr1
    beforeEach(async () => {
        Token = await ethers.getContractFactory("BigToken");
        token = await Token.deploy();
        [owner, addr1] = await ethers.getSigners()
    })
    describe('test.Deployment', () => {
            it("所有者正确", async () => {
                expect(await token.owner()).to.equal(owner.address);
            })
            it('部曙者拥有所有的通证', async () => {
                    const totalSupply = await token.totalSupply()
                    expect(await token.balanceOf(owner.address)).to.equal(totalSupply);
                }
            )
        }
    )

    describe('发送token', () => {
            it("正确发送token", async () => {
                await token.transfer(addr1.address, 100)
                console.log("owner的地址是：" + owner.address)
                const balance_owner = await token.balanceOf(owner.address)
                console.log("owner的余额是: " + ethers.BigNumber.from(balance_owner).toString())
                const balance_addr1 = await token.balanceOf(addr1.address)
                console.log("addr1的余额是 " + ethers.BigNumber.from(balance_addr1).toString());
            })
        }
    )
})