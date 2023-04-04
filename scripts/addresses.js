const fs = require('fs');

// Generate 50,000 EVM addresses
const addresses = [];
for (let i = 0; i < 50000; i++) {
    const address =
        '0x' +
        Array.from({ length: 40 }, () =>
            Math.floor(Math.random() * 16).toString(16)
        ).join('');
    addresses.push(address);
}

// Write the addresses to a text file
fs.writeFileSync('addresses.txt', addresses.join(','));
console.log('File written successfully!');
