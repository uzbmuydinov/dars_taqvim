

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  
  static const storage =  FlutterSecureStorage();
 
    static Future<void> storeToken(String token) async {
      await storage.write(key: 'token', value: token);
    }
    
    static Future<String?> getToken(String token) async {
      return await storage.read(key: 'token');
    }
  
  }