const hre = require('hardhat');

// npx hardhat run --network mumbai scripts/verify.js
async function main() {
    await hre.run('verify:verify', {
        address: '0xBffEaf52DB22A9D73fd2882975b446e8fE8f60dc',
        // see: https://hardhat.org/hardhat-runner/plugins/nomiclabs-hardhat-etherscan#using-programmatically
        constructorArguments: [],
    });
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
