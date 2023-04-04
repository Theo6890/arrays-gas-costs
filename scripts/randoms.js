const fs = require('fs');

// Generate 50,000 random numbers between 1 and 1000
const numbers = [];
for (let i = 0; i < 27000; i++) {
    numbers.push(Math.floor(Math.random() * 1000) + 1);
}

// Write the numbers to a text file on a single line
fs.writeFileSync('numbers.txt', numbers.join(','));
console.log('File written successfully!');
