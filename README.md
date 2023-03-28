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
