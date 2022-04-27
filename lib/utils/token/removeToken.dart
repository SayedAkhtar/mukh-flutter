import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../storeAccountDetails.dart';

Future<void> removeToken() async {
  final storage = new FlutterSecureStorage();
  await storage.delete(key: 'token');
  await Account.instance.deleteDb();
}
