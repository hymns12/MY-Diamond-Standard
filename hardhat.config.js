/**
 * @type import('hardhat/config').HardhatUserConfig
 */
require('@nomiclabs/hardhat-ethers');
require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan")
require("dotenv").config({ path: ".env" });

const SPIDY_API_KEY_URLS = process.env.SPIDY_API_KEY_URL;

const PRIVATE_KEYS = process.env.PRIVATE_KEY;

const API_TOKEN = process.env.API_TOKEN;


module.exports = {
  solidity: "0.8.10",
  networks: {
    sepolia: {
      url: SPIDY_API_KEY_URLS,
      accounts: [PRIVATE_KEYS],
    },
  },
  etherscan: {
    apiKey: API_TOKEN
  },
  lockGasLimit: 200000000000,
  gasPrice: 10000000000,
};
