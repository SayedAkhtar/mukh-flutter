import 'package:http/http.dart' as http;
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/utils/token/getToken.dart';

Future<int> addFavDoc(String id) async {
  String token = await getToken();
  final query = await http
      .post(Uri.parse(Constant.baseUrl + 'api/favoriteDoctors'), headers: {
    "Content-Type": "application/x-www-form-urlencoded",
    "Authorization": "Bearer $token"
  }, body: {
    "doctor_id": id,
  });

  return query.statusCode;
}
