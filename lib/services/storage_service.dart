import 'package:get_storage/get_storage.dart';
 
class StorageService {
  final box = GetStorage();
 
  Future<void> init() async {
    await GetStorage.init();
  }
 
  Future<void> write(String key, dynamic value) async {
    await box.write(key, value);
  }
 
  Future<dynamic> read(String key) async {
    return await box.read(key);
  }

}
 