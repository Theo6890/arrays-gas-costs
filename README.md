# <h1 align="center"> Arrays Loops: Gas Costs </h1>

Estimate transaction costs with simple calculation but huge amount of loops.

## Optimisation Results: YUL vs Solidity

As we can see by running the test with gas reports `forge test --gas-report --mt 50_`:

-   saving **50,000** randoms in the storage costs ~50,000 gas
-   using YUL we can save 10.5M gas, ~25% gas optimisation

| Function Name                          | Gas (Gwei)  |
| -------------------------------------- | ----------- |
| YUL_transformRandoms_result_to_memory  | 22,268,046  |
| YUL_transformRandoms_result_to_storage | 620,880,387 |
| transformRandoms_result_to_memory      | 27,019,970  |
| transformRandoms_result_to_storage     | 625,632,331 |

## Transaction Costs Estimation

### Transform **_X_** Randoms On-Chain

Saves resuts to memory as storage is way too expensive and not feasible as it goes above the 30M gas limit. Adds **50-90%** gas cost if we emit an event to byass storage saving costs.

| Amount of Randoms | Gas Usage  | Price/transaction - BSC | Price/tx - Polygon | Gas Price per Unit (Gwei) | $/Gwei - BNB at $350 | $/Gwei - MATIC at $1.5 |
| ----------------- | ---------- | ----------------------- | ------------------ | ------------------------- | -------------------- | ---------------------- |
| 27,000            | 22,268,046 | $139.18                 | $0.84              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 22,000            | 19,969,687 | $124.81                 | $0.75              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 19,000            | 12,998,546 | $81.24                  | $0.49              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 11,000            | 5,979,046  | $37.37                  | $0.22              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 5,000             | 2,190,984  | $13.69                  | $0.08              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 2,300             | 899,266    | $5.62                   | $0.03              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 834               | 305,266    | $1.91                   | $0.0114            | 25                        | $ 0.000000250        | $ 0.000000002          |
| 124               | 44,744     | $0.28                   | $0.0017            | 25                        | $ 0.000000250        | $ 0.000000002          |

_Note: **Amount of Randoms** = amount of loops_

### Transform Randoms & Reveal **_X_** Winners

#### In Memory

In this case we need to take both the size of the array (from which amount of winners), the amount of winners & the size of the received randoms into account.

| Participants | Amount Winners | Gas Usage  | Price/transaction - BSC | Price/tx - Polygon | Gas Price per Unit (Gwei) | $/Gwei - BNB at $350 | $/Gwei - MATIC at $1.5 |
| ------------ | -------------- | ---------- | ----------------------- | ------------------ | ------------------------- | -------------------- | ---------------------- |
| 50,000       | 27,000         | 48,763,575 |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |
| 40,000       | 22,000         | 34,290,431 |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |
| 35,000       | 19,000         | 27,240,876 |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |
| 30,000       | 11,000         | 14,975,560 |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |
| 20,000       | 5,000          | 6,345,200  |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |
| 10,000       | 2,300          | 2,460,818  |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |
| 5,000        | 834            | 9,451,57   |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |
| 1,000        | 124            | 155,996    |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |
| 500          | 75             | 82,694     |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |

Note: If we emit an event containing the winners there an increase of **_7-9%_** in gas usage. This might be helpful to store the winners on-chain.

#### In Storage

Gas cost increase of **15x** in average compared to memory.

| Participants | Amount Winners | Gas Usage   | Price/transaction - BSC | Price/tx - Polygon | Gas Price per Unit (Gwei) | $/Gwei - BNB at $350 | $/Gwei - MATIC at $1.5 |
| ------------ | -------------- | ----------- | ----------------------- | ------------------ | ------------------------- | -------------------- | ---------------------- |
| 50,000       | 27,000         | 648,185,960 |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |
| 40,000       | 22,000         | 522,712,816 |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |
| 35,000       | 19,000         | 449,063,261 |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |
| 30,000       | 11,000         | 259,197,945 |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |
| 20,000       | 5,000          | 117,367,585 |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |
| 10,000       | 2,300          | 53,543,203  |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |
| 5,000        | 834            | 19,482,342  |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |
| 1,000        | 124            | 2,931,181   |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |
| 500          | 75             | 1,770,079   |                         |                    | 25                        | $ 0.000000250        | $ 0.000000002          |

## Transform Uint vs Transform While Picking Address

Transforming while picking address costs 3x more gas than transforming uints only in memory. In storage it costs up to **40x more gas**. This is why we need to split the logic into two steps:

1. transform randoms
2. pick addresses

### In Memory Results

| Function Name                         | min     | avg        | median    | max        |
| ------------------------------------- | ------- | ---------- | --------- | ---------- |
| YUL_transformRandoms_result_to_memory | 91,190  | 9,209,888  | 4,479,381 | 27,939,967 |
| YUL_transformAndPick_result_to_memory | 176,977 | 19,826,991 | 9,411,812 | 60,656,696 |

### In Storage Results

| Function Name                          | min        | avg         | median      | max           |
| -------------------------------------- | ---------- | ----------- | ----------- | ------------- |
| YUL_transformRandoms_result_to_storage | 135,723    | 9,254,421   | 4,523,914   | 27,984,500    |
| YUL_transformAndPick_result_to_storage | 11,299,318 | 468,011,832 | 342,434,153 | 1,170,679,037 |
