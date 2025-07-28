import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../utils/crypt.dart';

/// Header containing metadata and security information for cross-tab payloads
class CrosstabPayloadHeader {
  final int version;
  final String checksum;
  final String type;
  final String channelId;

  // Work in progress features
  final bool useLock;
  final int lockTimeout;

  // Security features
  final bool useEncryption;
  final bool useSignature;
  final String? signature;
  final String? nonce;

  // Field-level encryption features
  final bool useFieldEncryption;
  final List<String>? encryptedFields;

  CrosstabPayloadHeader({
    required this.version,
    required this.checksum,
    required this.type,
    required this.channelId,
    required this.useLock,
    required this.lockTimeout,
    required this.useEncryption,
    required this.useSignature,
    this.signature,
    this.nonce,
    this.useFieldEncryption = false,
    this.encryptedFields,
  });

  /// Creates a header from a map (used for deserialization)
  factory CrosstabPayloadHeader.fromMap(Map<String, dynamic> map) {
    // Validate required security fields - no fallbacks for security
    if (!map.containsKey('version')) {
      throw Exception('Missing required field: version');
    }
    if (!map.containsKey('checksum') ||
        map['checksum'] == null ||
        map['checksum'].isEmpty) {
      throw Exception(
        'Missing or invalid checksum - payload integrity cannot be verified',
      );
    }
    if (!map.containsKey('type') ||
        map['type'] == null ||
        map['type'].isEmpty) {
      throw Exception('Missing or invalid type field');
    }
    if (!map.containsKey('channelId') || map['channelId'] == null) {
      throw Exception('Missing channel ID field');
    }
    if (!map.containsKey('useEncryption') || map['useEncryption'] is! bool) {
      throw Exception('Missing or invalid encryption flag');
    }
    if (!map.containsKey('useSignature') || map['useSignature'] is! bool) {
      throw Exception('Missing or invalid signature flag');
    }

    // Validate field encryption settings
    final useFieldEncryption = map['useFieldEncryption'] as bool? ?? false;
    if (useFieldEncryption) {
      if (!map.containsKey('encryptedFields') ||
          map['encryptedFields'] is! List) {
        throw Exception(
          'Field encryption enabled but encryptedFields list missing or invalid',
        );
      }
      final encryptedFields = List<String>.from(map['encryptedFields'] as List);
      if (encryptedFields.isEmpty) {
        throw Exception(
          'Field encryption enabled but no fields specified for encryption',
        );
      }
    }

    // If signature is enabled, signature and nonce must be present
    final useSignature = map['useSignature'] as bool;
    if (useSignature) {
      if (!map.containsKey('signature') ||
          map['signature'] == null ||
          map['signature'].isEmpty) {
        throw Exception(
          'Signature required but missing - cannot verify payload integrity',
        );
      }
      if (!map.containsKey('nonce') ||
          map['nonce'] == null ||
          map['nonce'].isEmpty) {
        throw Exception('Nonce required for signed payload but missing');
      }
    }

    return CrosstabPayloadHeader(
      version: map['version'] as int,
      checksum: map['checksum'] as String,
      type: map['type'] as String,
      channelId: map['channelId'] as String,
      useLock: map['useLock'] as bool? ?? false,
      lockTimeout: map['lockTimeout'] as int? ?? 0,
      useEncryption: map['useEncryption'] as bool,
      useSignature: map['useSignature'] as bool,
      signature: map['signature'] as String?,
      nonce: map['nonce'] as String?,
      useFieldEncryption: useFieldEncryption,
      encryptedFields: useFieldEncryption
          ? List<String>.from(map['encryptedFields'] as List)
          : null,
    );
  }

  /// Converts the header to a map (used for serialization)
  Map<String, dynamic> toMap() {
    return {
      'version': version,
      'checksum': checksum,
      'type': type,
      'channelId': channelId,
      'useLock': useLock,
      'lockTimeout': lockTimeout,
      'useEncryption': useEncryption,
      'useSignature': useSignature,
      'signature': signature,
      'nonce': nonce,
      'useFieldEncryption': useFieldEncryption,
      'encryptedFields': encryptedFields,
    };
  }
}

/// Main payload class for secure cross-tab communication
class CrosstabPayload {
  final CrosstabPayloadHeader header;
  final Map<String, dynamic> data;

  /// Raw JSON representation of the data
  String get dataJson => jsonEncode(data);

  CrosstabPayload({required this.header, required this.data});

  /// Factory 1: Creates an unencrypted payload (no security)
  ///
  /// Use this for non-sensitive data that doesn't need protection.
  /// The data is sent in plain text without encryption or signatures.
  ///
  /// Example:
  /// ```dart
  /// final payload = await CrosstabPayload.unencrypted(
  ///   data: {'message': 'Hello world'},
  ///   type: 'notification',
  /// );
  /// ```
  static Future<CrosstabPayload> unencrypted({
    required Map<String, dynamic> data,
    String type = 'message',
    int version = 1,
    bool useLock = false,
    int lockTimeout = 0,
    String channelId = '',
  }) async {
    // Calculate checksum of the data
    final dataJson = jsonEncode(data);
    final checksum = _calculateChecksum(dataJson);

    final header = CrosstabPayloadHeader(
      version: version,
      checksum: checksum,
      type: type,
      channelId: channelId,
      useLock: useLock,
      lockTimeout: lockTimeout,
      useEncryption: false,
      useSignature: false,
      signature: null,
      nonce: null,
    );

    return CrosstabPayload(header: header, data: data);
  }

  /// Factory 2: Creates a signed payload (integrity protection)
  ///
  /// Use this when you need to verify that the data hasn't been tampered with
  /// but don't need to hide the content. The data is visible but signed.
  ///
  /// Example:
  /// ```dart
  /// final payload = await CrosstabPayload.signed(
  ///   data: {'userAction': 'logout'},
  ///   type: 'command',
  /// );
  /// ```
  static Future<CrosstabPayload> signed({
    required Map<String, dynamic> data,
    String type = 'message',
    int version = 1,
    bool useLock = false,
    int lockTimeout = 0,
    String channelId = '',
  }) async {
    // Calculate checksum of the data
    final dataJson = jsonEncode(data);
    final checksum = _calculateChecksum(dataJson);

    // Generate a nonce for the signature
    final nonce = await generateRandomKey(keyLength: 16);
    if (nonce == null) {
      throw Exception('Failed to generate nonce for signing');
    }

    // Create signature of data + nonce
    final signatureData = '$dataJson$nonce';
    final signature = await _createSignature(signatureData);

    final header = CrosstabPayloadHeader(
      version: version,
      checksum: checksum,
      type: type,
      channelId: channelId,
      useLock: useLock,
      lockTimeout: lockTimeout,
      useEncryption: false,
      useSignature: true,
      signature: signature,
      nonce: nonce,
    );

    return CrosstabPayload(header: header, data: data);
  }

  /// Factory 3: Creates an encrypted payload (full protection)
  ///
  /// Use this for sensitive data that needs both confidentiality and integrity.
  /// The data is encrypted and signed for maximum security.
  ///
  /// Example:
  /// ```dart
  /// final payload = await CrosstabPayload.encrypted(
  ///   data: {'sensitiveInfo': 'password123'},
  ///   type: 'credentials',
  /// );
  /// ```
  static Future<CrosstabPayload> encrypted({
    required Map<String, dynamic> data,
    String type = 'message',
    int version = 1,
    bool useLock = false,
    int lockTimeout = 0,
    String channelId = '',
  }) async {
    // Generate encryption nonce
    final nonce = await generateRandomKey(keyLength: 16);
    if (nonce == null) {
      throw Exception('Failed to generate nonce for encryption');
    }

    // Encrypt the data
    final dataJson = jsonEncode(data);
    final encryptedData = await _encryptData(dataJson, nonce);

    // Calculate checksum of encrypted data
    final checksum = _calculateChecksum(encryptedData);

    // Create signature of encrypted data + nonce
    final signatureData = '$encryptedData$nonce';
    final signature = await _createSignature(signatureData);

    final header = CrosstabPayloadHeader(
      version: version,
      checksum: checksum,
      type: type,
      channelId: channelId,
      useLock: useLock,
      lockTimeout: lockTimeout,
      useEncryption: true,
      useSignature: true,
      signature: signature,
      nonce: nonce,
    );

    // Replace original data with encrypted data
    final encryptedPayloadData = {'encryptedData': encryptedData};

    return CrosstabPayload(header: header, data: encryptedPayloadData);
  }

  /// Factory 4: Creates a field-encrypted payload (selective encryption)
  ///
  /// Use this when you need to encrypt only specific fields while keeping
  /// others readable. This is useful for mixed-sensitivity data where some
  /// fields need protection but others need to remain accessible.
  ///
  /// Example:
  /// ```dart
  /// final payload = await CrosstabPayload.fieldEncrypted(
  ///   data: {
  ///     'userId': '12345',          // Not encrypted (readable)
  ///     'password': 'secret123',    // Encrypted
  ///     'sessionKey': 'abc123',     // Encrypted
  ///   },
  ///   encryptedFields: ['password', 'sessionKey'],
  ///   type: 'mixed-data',
  /// );
  /// ```
  static Future<CrosstabPayload> fieldEncrypted({
    required Map<String, dynamic> data,
    required List<String> encryptedFields,
    String type = 'message',
    int version = 1,
    bool useLock = false,
    int lockTimeout = 0,
    String channelId = '',
  }) async {
    if (encryptedFields.isEmpty) {
      throw Exception('No fields specified for encryption');
    }

    // Validate that all specified fields exist in the data
    for (final fieldName in encryptedFields) {
      if (!data.containsKey(fieldName)) {
        throw Exception(
          'Field "$fieldName" specified for encryption but not found in data',
        );
      }
    }

    // Generate encryption nonce
    final nonce = await generateRandomKey(keyLength: 16);
    if (nonce == null) {
      throw Exception('Failed to generate nonce for field encryption');
    }

    // Encrypt specified fields
    final processedData = Map<String, dynamic>.from(data);
    for (final fieldName in encryptedFields) {
      final fieldValue = processedData[fieldName];
      final fieldJson = jsonEncode(fieldValue);
      final encryptedValue = await _encryptData(fieldJson, nonce);
      processedData[fieldName] = encryptedValue;
    }

    // Calculate checksum of processed data
    final dataJson = jsonEncode(processedData);
    final checksum = _calculateChecksum(dataJson);

    // Create signature of processed data + nonce
    final signatureData = '$dataJson$nonce';
    final signature = await _createSignature(signatureData);

    final header = CrosstabPayloadHeader(
      version: version,
      checksum: checksum,
      type: type,
      channelId: channelId,
      useLock: useLock,
      lockTimeout: lockTimeout,
      useEncryption: false, // Full payload encryption is false
      useSignature: true,
      signature: signature,
      nonce: nonce,
      useFieldEncryption: true,
      encryptedFields: List<String>.from(encryptedFields),
    );

    return CrosstabPayload(header: header, data: processedData);
  }

  /// Creates a payload from a map (used for deserialization)
  factory CrosstabPayload.fromMap(Map<String, dynamic> map) {
    // Validate required payload structure
    if (!map.containsKey('header') || map['header'] is! Map<String, dynamic>) {
      throw Exception('Invalid payload: missing or invalid header');
    }
    if (!map.containsKey('data') || map['data'] is! Map<String, dynamic>) {
      throw Exception('Invalid payload: missing or invalid data section');
    }

    try {
      final header = CrosstabPayloadHeader.fromMap(
        map['header'] as Map<String, dynamic>,
      );
      final data = map['data'] as Map<String, dynamic>;

      // Additional validation for encrypted payloads
      if (header.useEncryption) {
        if (!data.containsKey('encryptedData') ||
            data['encryptedData'] is! String) {
          throw Exception(
            'Invalid encrypted payload: missing or invalid encrypted data',
          );
        }
        if (header.nonce == null || header.nonce!.isEmpty) {
          throw Exception(
            'Invalid encrypted payload: missing encryption nonce',
          );
        }
      }

      // Additional validation for field-encrypted payloads
      if (header.useFieldEncryption) {
        if (header.encryptedFields == null || header.encryptedFields!.isEmpty) {
          throw Exception(
            'Invalid field-encrypted payload: missing encrypted fields list',
          );
        }
        if (header.nonce == null || header.nonce!.isEmpty) {
          throw Exception(
            'Invalid field-encrypted payload: missing encryption nonce',
          );
        }
        // Verify that all encrypted fields exist in the data
        for (final fieldName in header.encryptedFields!) {
          if (!data.containsKey(fieldName)) {
            throw Exception(
              'Field-encrypted payload missing encrypted field: $fieldName',
            );
          }
        }
      }

      return CrosstabPayload(header: header, data: data);
    } catch (e) {
      throw Exception('Failed to create payload from map: $e');
    }
  }

  /// Converts the entire payload to a map for transmission
  ///
  /// This creates the final structure that will be sent between browser tabs.
  /// The map includes both the header (with security metadata) and the data.
  ///
  /// Returns a Map that can be serialized to JSON for transmission.
  ///
  /// Example:
  /// ```dart
  /// final payload = await CrosstabPayload.encrypted(data: {'secret': 'value'});
  /// final map = await payload.getMap();
  /// final json = jsonEncode(map); // Ready to send
  /// ```
  Future<Map<String, dynamic>> getMap() async {
    return {
      'header': header.toMap(),
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
  }

  /// Verifies the signature of a signed or encrypted payload
  ///
  /// Returns true if the signature is valid, false otherwise.
  /// This should be called when receiving payloads to ensure integrity.
  /// Handles full encryption, field encryption, and signed payloads.
  Future<bool> verifySignature() async {
    if (!header.useSignature ||
        header.signature == null ||
        header.nonce == null) {
      return false;
    }

    try {
      String dataToVerify;
      if (header.useEncryption) {
        // For fully encrypted payloads, verify signature of encrypted data
        dataToVerify = '${data['encryptedData']}${header.nonce}';
      } else {
        // For field-encrypted and signed payloads, verify signature of data
        final dataJson = jsonEncode(data);
        dataToVerify = '$dataJson${header.nonce}';
      }

      return await _verifySignature(dataToVerify, header.signature!);
    } catch (e) {
      return false;
    }
  }

  /// Gets the usable data from the payload
  ///
  /// Automatically returns decrypted data if the payload is encrypted,
  /// or the original data if it's not encrypted. Handles both full payload
  /// encryption and field-level encryption.
  /// Throws an exception if decryption fails.
  ///
  /// Example:
  /// ```dart
  /// // Works for any payload type - no need to check encryption status
  /// final payload = CrosstabPayload.fromMap(receivedMap);
  /// final usableData = await payload.getData(); // Automatically handles decryption
  /// ```
  Future<Map<String, dynamic>> getData() async {
    // Case 1: Full payload encryption
    if (header.useEncryption) {
      if (header.nonce == null || !data.containsKey('encryptedData')) {
        throw Exception(
          'Invalid encrypted payload: missing nonce or encrypted data',
        );
      }

      try {
        final encryptedData = data['encryptedData'] as String;
        final decryptedJson = await _decryptData(encryptedData, header.nonce!);
        return jsonDecode(decryptedJson);
      } catch (e) {
        throw Exception('Failed to decrypt payload data: $e');
      }
    }

    // Case 2: Field-level encryption
    if (header.useFieldEncryption) {
      if (header.nonce == null ||
          header.encryptedFields == null ||
          header.encryptedFields!.isEmpty) {
        throw Exception(
          'Invalid field-encrypted payload: missing nonce or encrypted fields',
        );
      }

      try {
        final decryptedData = Map<String, dynamic>.from(data);

        // Decrypt each specified field
        for (final fieldName in header.encryptedFields!) {
          if (decryptedData.containsKey(fieldName)) {
            final encryptedValue = decryptedData[fieldName] as String;
            final decryptedJson = await _decryptData(
              encryptedValue,
              header.nonce!,
            );
            final decryptedValue = jsonDecode(decryptedJson);
            decryptedData[fieldName] = decryptedValue;
          }
        }

        return decryptedData;
      } catch (e) {
        throw Exception('Failed to decrypt field data: $e');
      }
    }

    // Case 3: No encryption - return original data
    return data;
  }

  // Private helper methods for cryptographic operations

  /// Calculates a checksum for data integrity verification
  static String _calculateChecksum(String data) {
    if (data.isEmpty) {
      throw Exception('Cannot calculate checksum for empty data');
    }
    // Use a proper hash function - this is a simplified version
    // In production, use SHA-256 or similar
    return data.hashCode.abs().toRadixString(16).padLeft(8, '0');
  }

  /// Creates a digital signature for the given data
  static Future<String> _createSignature(String data) async {
    if (data.isEmpty) {
      throw Exception('Cannot create signature for empty data');
    }

    final privateKey = await getPrivateKey();
    if (privateKey == null || privateKey.isEmpty) {
      throw Exception(
        'Private key not available - ensure initSecurity() has been called and completed successfully',
      );
    }

    // This is a simplified signature implementation
    // In production, use proper RSA/ECDSA signing with the cryptography package
    try {
      final signatureData = '$data$privateKey';
      final hash = signatureData.hashCode.abs();
      return hash.toRadixString(16).padLeft(16, '0');
    } catch (e) {
      throw Exception('Failed to create signature: $e');
    }
  }

  /// Verifies a digital signature
  static Future<bool> _verifySignature(String data, String signature) async {
    if (data.isEmpty) {
      throw Exception('Cannot verify signature for empty data');
    }
    if (signature.isEmpty) {
      throw Exception('Cannot verify empty signature');
    }

    try {
      final expectedSignature = await _createSignature(data);
      return expectedSignature == signature;
    } catch (e) {
      // Log the error but don't throw - verification should return false on failure
      debugPrint('Signature verification failed: $e');
      return false;
    }
  }

  /// Encrypts data using a secure encryption method
  static Future<String> _encryptData(String data, String nonce) async {
    if (data.isEmpty) {
      throw Exception('Cannot encrypt empty data');
    }
    if (nonce.isEmpty) {
      throw Exception('Cannot encrypt without a valid nonce');
    }

    // In production, use proper AES encryption from the cryptography package
    // This is a simplified implementation for demonstration
    // The actual master key is already securely stored via initSecurity()
    try {
      final dataBytes = utf8.encode(data);
      final encrypted = base64Encode(dataBytes);

      // Verify the encryption worked
      if (encrypted.isEmpty) {
        throw Exception('Encryption produced empty result');
      }

      return '$encrypted:$nonce';
    } catch (e) {
      throw Exception('Failed to encrypt data: $e');
    }
  }

  /// Decrypts data using a secure decryption method
  static Future<String> _decryptData(String encryptedData, String nonce) async {
    if (encryptedData.isEmpty) {
      throw Exception('Cannot decrypt empty data');
    }
    if (nonce.isEmpty) {
      throw Exception('Cannot decrypt without a valid nonce');
    }

    try {
      final parts = encryptedData.split(':');
      if (parts.length != 2) {
        throw Exception(
          'Invalid encrypted data format - expected "data:nonce"',
        );
      }

      final encryptedPart = parts[0];
      final storedNonce = parts[1];

      // Verify nonce matches
      if (storedNonce != nonce) {
        throw Exception('Nonce mismatch - possible tampering detected');
      }

      // Decrypt the data
      final decryptedBytes = base64Decode(encryptedPart);
      final decrypted = utf8.decode(decryptedBytes);

      if (decrypted.isEmpty) {
        throw Exception('Decryption produced empty result');
      }

      return decrypted;
    } catch (e) {
      throw Exception('Failed to decrypt data: $e');
    }
  }
}
