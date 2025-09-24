import 'package:pvcache_hive/templates/ciphers/aes.dart';

void main() {
  // Test with same seed multiple times
  final seed = "test-seed-123";
  
  print("=== Testing Encryption Consistency (Full Mode) ===");
  
  // Test 1: Direct encryptor (full mode)
  final encryptor1 = PVAesEncryptor(seed);
  final encryptor2 = PVAesEncryptor(seed);
  
  final testData = "Hello, this is test data for encryption!";
  print("Original data: $testData");
  
  final encrypted1 = encryptor1.encryptString(testData);
  final encrypted2 = encryptor2.encryptString(testData);
  
  print("Encrypted 1: ${encrypted1.substring(0, 50)}...");
  print("Encrypted 2: ${encrypted2.substring(0, 50)}...");
  print("Same encryption: ${encrypted1 == encrypted2}");
  
  // Test decryption
  try {
    final decrypted1 = encryptor1.decryptString(encrypted1);
    final decrypted2 = encryptor2.decryptString(encrypted2);
    final crossDecrypt1 = encryptor1.decryptString(encrypted2);
    final crossDecrypt2 = encryptor2.decryptString(encrypted1);
    
    print("Decrypted 1: $decrypted1");
    print("Decrypted 2: $decrypted2");
    print("Cross decrypt 1->2: $crossDecrypt1");
    print("Cross decrypt 2->1: $crossDecrypt2");
    
    print("All match original: ${decrypted1 == testData && decrypted2 == testData && crossDecrypt1 == testData && crossDecrypt2 == testData}");
  } catch (e) {
    print("Decryption failed: $e");
  }
  
  print("\n=== Testing Large Data ===");
  
  // Test 3: Large data (similar to the failing case)
  final largeData = List.generate(1000, (i) => "This is line $i with some data content").join("\n");
  print("Large data length: ${largeData.length}");
  
  try {
    final encryptedLarge = encryptor1.encryptString(largeData);
    print("Large data encrypted successfully, length: ${encryptedLarge.length}");
    
    final decryptedLarge = encryptor1.decryptString(encryptedLarge);
    print("Large data decrypted successfully, matches: ${decryptedLarge == largeData}");
  } catch (e) {
    print("Large data test failed: $e");
  }
  
  print("\n=== Testing Lite Mode Performance ===");
  
  // Test 4: Lite mode comparison
  final liteEncryptor1 = PVAesEncryptor(seed, liteMode: true);
  final liteEncryptor2 = PVAesEncryptor(seed, liteMode: true);
  
  print("Testing lite mode with same data: $testData");
  
  final liteEncrypted1 = liteEncryptor1.encryptString(testData);
  final liteEncrypted2 = liteEncryptor2.encryptString(testData);
  
  print("Lite encrypted 1: ${liteEncrypted1.substring(0, 30)}...");
  print("Lite encrypted 2: ${liteEncrypted2.substring(0, 30)}...");
  print("Lite mode same encryption: ${liteEncrypted1 == liteEncrypted2}");
  
  try {
    final liteDecrypted1 = liteEncryptor1.decryptString(liteEncrypted1);
    final liteDecrypted2 = liteEncryptor2.decryptString(liteEncrypted2);
    print("Lite decrypted 1: $liteDecrypted1");
    print("Lite decrypted 2: $liteDecrypted2");
    print("Lite mode works: ${liteDecrypted1 == testData && liteDecrypted2 == testData}");
  } catch (e) {
    print("Lite mode failed: $e");
  }
  
  print("\n=== Performance Comparison ===");
  print("Full mode encrypted length: ${encryptor1.encryptString(testData).length}");
  print("Lite mode encrypted length: ${liteEncryptor1.encryptString(testData).length}");
  print("Note: Lite mode is faster but less secure (static IV, shorter output)");
  
  print("\n=== Testing Known Data Format ===");
  
  // Test 5: Try to decrypt the specific failing data format
  final failingData = "VhX4GjGSg4hz6GOjy96xNm2i4lHOv8spxHZGzevNdwOsGDiwFX";
  print("Attempting to decrypt failing data preview: $failingData");
  
  try {
    final decrypted = encryptor1.decryptString(failingData);
    print("Successfully decrypted: $decrypted");
  } catch (e) {
    print("Failed to decrypt sample data: $e");
    print("This suggests the data was encrypted with different parameters");
  }
}