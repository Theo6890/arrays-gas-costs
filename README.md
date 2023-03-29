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

**Saves resuts to memory** as storage is way too expensive and not feasible as it goes above the 30M gas limit. Adds **50-90%** gas cost if we emit an event to byass storage saving costs.

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

### Transform Randoms While Reveal **_X_** Winners

### In Calldata

| Amount Participants | Amount Winners | Gas Limit / Used | Price/transaction - BSC | Price/tx - Polygon | Gas Price per Unit (Gwei) | $/Gwei - BNB at $350 | $/Gwei - MATIC at $1.5 |
| ------------------- | -------------- | ---------------- | ----------------------- | ------------------ | ------------------------- | -------------------- | ---------------------- |
| 50,000              | 27,000         | 22,862,183       | $142.89                 | $0.86              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 40,000              | 22,000         | 16,695,074       | $104.34                 | $0.63              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 35,000              | 19,000         | 13,416,683       | $83.85                  | $0.50              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 30,000              | 11,000         | 6,221,183        | $38.88                  | $0.23              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 20,000              | 5,000          | 2,301,121        | $14.38                  | $0.09              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 10,000              | 2,300          | 950,003          | $5.94                   | $0.04              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 5,000               | 834            | 323,751          | $2.02                   | $0.01              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 1,000               | 124            | 47,609           | $0.30                   | $0.0018            | 25                        | $ 0.000000250        | $ 0.000000002          |

Note: If we emit an event containing the winners there an increase of **_40-90%_** in gas usage. This might be helpful to store the winners on-chain.

#### In Memory

In this case we need to take both the size of the array (from which amount of winners), the amount of winners & the size of the received randoms into account.

| Amount Participants | Amount Winners | Gas Limit / Used | Price/transaction - BSC | Price/tx - Polygon | Gas Price per Unit (Gwei) | $/Gwei - BNB at $350 |
| ------------------- | -------------- | ---------------- | ----------------------- | ------------------ | ------------------------- | -------------------- |
| 50,000              | 27,000         | 48,763,575       | $304.77                 | $1.83              | 25                        | $ 0.000000250        |
| 40,000              | 22,000         | 34,290,431       | $214.32                 | $1.29              | 25                        | $ 0.000000250        |
| 35,000              | 19,000         | 27,240,876       | $170.26                 | $1.02              | 25                        | $ 0.000000250        |
| 30,000              | 11,000         | 14,975,560       | $93.60                  | $0.56              | 25                        | $ 0.000000250        |
| 20,000              | 5,000          | 6,345,200        | $39.66                  | $0.24              | 25                        | $ 0.000000250        |
| 10,000              | 2,300          | 2,460,818        | $15.38                  | $0.09              | 25                        | $ 0.000000250        |
| 5,000               | 834            | 945,157          | $5.91                   | $0.04              | 25                        | $ 0.000000250        |
| 1,000               | 124            | 155,996          | $0.97                   | $0.0058            | 25                        | $ 0.000000250        |

Note: If we emit an event containing the winners there an increase of **_7-9%_** in gas usage. This might be helpful to store the winners on-chain.

### In calldata, returned as event

#### In Storage

Gas cost increase of **15x** in average compared to memory.

| Amount Participants | Amount Winners | Gas Limit / Used | Price/transaction - BSC | Price/tx - Polygon | Gas Price per Unit (Gwei) | $/Gwei - BNB at $350 |
| ------------------- | -------------- | ---------------- | ----------------------- | ------------------ | ------------------------- | -------------------- |
| 50,000              | 27,000         | 648,185,960      | $4,051.16               | $24.31             | 25                        | $ 0.000000250        |
| 40,000              | 22,000         | 522,712,816      | $3,266.96               | $19.60             | 25                        | $ 0.000000250        |
| 35,000              | 19,000         | 449,063,261      | $2,806.65               | $16.84             | 25                        | $ 0.000000250        |
| 30,000              | 11,000         | 259,197,945      | $1,619.99               | $9.72              | 25                        | $ 0.000000250        |
| 20,000              | 5,000          | 117,367,585      | $733.55                 | $4.40              | 25                        | $ 0.000000250        |
| 10,000              | 2,300          | 53,543,203       | $334.65                 | $2.01              | 25                        | $ 0.000000250        |
| 5,000               | 834            | 19,482,342       | $121.76                 | $0.73              | 25                        | $ 0.000000250        |
| 1,000               | 124            | 2,931,181        | $18.32                  | $0.1099            | 25                        | $ 0.000000250        |

## Transform Then Pick Address **vs** Transform While Picking Address

Transforming while picking address costs 3x more gas than transforming uints only in memory. In storage it costs up to **40x more gas**. This is why we need to split the logic into two steps:

1. transform randoms
2. pick addresses

### In Memory Results

| Function Name                                                                   | min                          | avg                                     | median                                 | max                                       |
| ------------------------------------------------------------------------------- | ---------------------------- | --------------------------------------- | -------------------------------------- | ----------------------------------------- |
| YUL_transformRandoms_result_to_memory + YUL_pickAfterTransform_result_to_memory | 27,418 + 69,740 = **97,158** | 7,187,000 + 17,143,046 = **24,330,046** | 2,190,984 + 4,865,184 = **7,056, 168** | 22,268,046 + 95,547,682 = **117,815,728** |
| YUL_transformAndPick_result_to_memory                                           | 176,977                      | 19,826,991                              | 9,411,812                              | 60,656,696                                |

### In Storage Results

| Function Name                                                                     | min                                   | avg                                         | median                                      | max                                           |
| --------------------------------------------------------------------------------- | ------------------------------------- | ------------------------------------------- | ------------------------------------------- | --------------------------------------------- |
| YUL_transformRandoms_result_to_storage + YUL_pickAfterTransform_result_to_storage | 1,712,509 + 1,757,123 = **3,469,632** | 22,233,9631 + 23,2586,829 = **454,926,460** | 113,063,325 + 11,5887,567 = **228,950,892** | 620,880,387 + 69,4970,065 = **1,315,850,452** |
| YUL_transformAndPick_result_to_storage                                            | 11,299,318                            | 468,011,832                                 | 342,434,153                                 | 1,170,679,037                                 |
