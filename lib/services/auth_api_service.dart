import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthApiService {
  Future<Map<String, dynamic>> getAuth(Map loginType) async{

    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/auth/login");
    
    http.Response response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(loginType)
    );

    if([200, 201].contains(response.statusCode)){
      Map<String, dynamic> data = jsonDecode(response.body);
      
      return data; 
    }

    throw Error();
  }
}

