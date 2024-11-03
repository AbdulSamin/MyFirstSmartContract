SimpleStorage2

Mappings:

I created a mapping called nameToFavoriteNumber, which allows us to link each person's name to their favorite number.
This makes it easy to look up a person's favorite number by their name.
For example, if you add a person with addPerson("Alice", 42), you can retrieve Alice’s favorite number (42) by calling getFavoriteNumberByName("Alice").

Events:

An event called NumberUpdated was added to log changes to the favoriteNumber.
Every time storeNumber is called to update the favoriteNumber, the contract emits a NumberUpdated event with the new number.
Events help track changes and make it easier to see what's happening when the contract is used, especially in applications like Remix or blockchain explorers.

Data Locations:

Storage: favoriteNumber is stored persistently in the contract, meaning it remains in memory even after transactions. This is the default for state variables (variables declared outside of functions).
Memory: A temporary variable (tempResult) was created in the multiplyFavoriteNumber function to perform a quick calculation. Memory variables are erased after the function finishes running.
Calldata: The processStringData function takes a string input as a calldata parameter. Calldata is a read-only, non-persistent data location that’s more efficient for temporary, external function inputs.


challenges

there was no challenges in implementing these functions.
