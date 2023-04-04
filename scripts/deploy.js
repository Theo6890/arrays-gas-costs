const hre = require('hardhat');

// npx hardhat run --network mumbai scripts/deploy.js
async function main() {
    /// @dev set higher gas limit to due contract gas usage
    /* const signer = await hre.ethers.getSigner();
    signer.getFeeData = async () => ({
        gasPrice: maxGasFees.maxFeePerGas,
        maxFeePerGas: maxGasFees.maxFeePerGas,
        maxPriorityFeePerGas: maxGasFees.maxPriorityFeePerGas,
    });

    console.log(await signer.estimateGas());

    signer.estimateGas = async () => {
        return hre.ethers.BigNumber.from('100000000');
    }; */

    const TransformAndPickAddress = await hre.ethers.getContractFactory(
        'TransformAndPickAddress'
    );

    const transform = await TransformAndPickAddress.deploy();

    await transform.deployed();

    console.log(`Deployed to ${transform.address}`);

    await hre.run('verify:verify', {
        address: transform.address,
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
