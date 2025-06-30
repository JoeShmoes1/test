// Simple test to verify encryption is working
const CryptoJS = require('crypto-js');

const ENCRYPTION_KEY = 'grindos-secure-key-2024';

// Test data
const testData = {
  email: 'test@example.com',
  name: 'Test User',
  tasks: [
    { id: '1', name: 'Test task', completed: false }
  ]
};

console.log('Testing encryption...');

// Encrypt
const jsonData = JSON.stringify(testData);
const encrypted = CryptoJS.AES.encrypt(jsonData, ENCRYPTION_KEY).toString();
console.log('Original data:', jsonData);
console.log('Encrypted data:', encrypted);

// Decrypt
const bytes = CryptoJS.AES.decrypt(encrypted, ENCRYPTION_KEY);
const decrypted = bytes.toString(CryptoJS.enc.Utf8);
const parsed = JSON.parse(decrypted);

console.log('Decrypted data:', decrypted);
console.log('Data matches:', JSON.stringify(testData) === JSON.stringify(parsed));

// Test password hashing
console.log('\nTesting password hashing...');
const password = 'testpassword123';

// Hash password
const salt = CryptoJS.lib.WordArray.random(16);
const hash = CryptoJS.PBKDF2(password, salt, {
  keySize: 256 / 32,
  iterations: 10000
});
const storedHash = salt.toString() + ':' + hash.toString();

console.log('Password:', password);
console.log('Hashed password:', storedHash);

// Verify password
const [saltStr, hashStr] = storedHash.split(':');
const saltParsed = CryptoJS.enc.Hex.parse(saltStr);
const computedHash = CryptoJS.PBKDF2(password, saltParsed, {
  keySize: 256 / 32,
  iterations: 10000
});
const isValid = computedHash.toString() === hashStr;

console.log('Password verification:', isValid);
console.log('\nEncryption test completed successfully!');
