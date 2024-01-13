import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CallApi{
  final String _url = "http://10.0.2.2:8000/api/v1/";
  
  postData(data, apiUrl) async {
    String fullUrl = _url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders()
    );
  }

  // headers
  _setHeaders()=> {
    'Content-Type':'application/json',
    'Accept':'application/json',
    'Authorization':'Bearer $_getToken()',
  };
  // token
  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token = $token';
  }
}