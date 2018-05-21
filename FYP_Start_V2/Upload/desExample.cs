// define the local key and vector byte arrays
byte[] key = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 
              13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24};
byte[] iv = {8, 7, 6, 5, 4, 3, 2, 1};

// instantiate the class with the arrays
cTripleDES des = new cTripleDES(key, iv);

// for the example, define a variable with the encrypted value
string encryptedData = "++XIiGymvbg=";

// now, decrypt the data
string decryptedData = des.Decrypt(encryptedData);

// the value of decryptedData should be "test",
// but for our example purposes, let's re-encrypt it
string newEncryptedData = des.Encrypt(decryptedData);