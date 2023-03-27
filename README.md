# <h1 align="center"> Arrays Loops: Gas Costs </h1>

Estimate transaction costs with simple calculation but huge amount of loops.

## Optimisation Results: YUL vs Solidity

As we can see by running the test with gas reports `forge test --gas-report --mt 50_`:

-   saving **50,000** randoms in the storage costs ~50,000 gas
-   using YUL we can save 10.5M gas, ~25% gas optimisation

| Function Name                          | Gas (Gwei) |
| -------------------------------------- | ---------- |
| YUL_transformRandoms_result_to_memory  | 27,939,967 |
| YUL_transformRandoms_result_to_storage | 27,984,500 |
| transformRandoms_result_to_memory      | 38,439,904 |
| transformRandoms_result_to_storage     | 38,484,435 |

## Transaction Costs Estimation

| Amount of Loops | Gas Usage  | Price/transaction - BSC | Price/tx - Polygon | Gas Price per Unit (Gwei) | $/Gwei - BNB at $350 | $/Gwei - MATIC at $1.5 |
| --------------- | ---------- | ----------------------- | ------------------ | ------------------------- | -------------------- | ---------------------- |
| 50,000          | 27,984,500 | $174.90                 | $1.05              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 45,000          | 23,433,211 | $146.46                 | $0.88              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 30,000          | 12,123,094 | $75.77                  | $0.45              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 20,000          | 6,536,141  | $40.85                  | $0.25              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 10,000          | 2,511,688  | $15.70                  | $0.09              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 5,000           | 1,085,399  | $6.78                   | $0.04              | 25                        | $ 0.000000250        | $ 0.000000002          |
| 1,000           | 225,617    | $1.41                   | $0.0085            | 25                        | $ 0.000000250        | $ 0.000000002          |
| 500             | 135,723    | $0.85                   | $0.0051            | 25                        | $ 0.000000250        | $ 0.000000002          |
