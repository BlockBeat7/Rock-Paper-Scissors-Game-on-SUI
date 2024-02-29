# Rock-Paper-Scissors-Game-on-SUI
Rock Paper Scissors Game contract

The create_game function is the main entry point of the smart contract. It takes an input number and a transaction context as parameters.  

It first validates the input number to ensure it's either 0 or 1. If it's not, it emits an error message.  

Then, it simulates rolling three dice (with faces numbered 1 to 6 each) and calculates their sum.  
Based on the rules of the game, it determines whether the player wins or loses based on the sum of the dice rolls and the chosen input number.  

It emits a result message indicating whether the player won or lost.  

The smart contract will issue a reward based on the final result.

# How to Build:
```sui move build```

# How to Test:
```sui move test```

# How to Publish:
```sui client publish --gas-budget 100000000 --json```
