import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../model/data_model.dart';



class LeadController extends GetxController {
 // var leads = <DetailModel>[].obs;
  List<dynamic>leads=[].obs;
  var currentPage = 1;
  final isLoadings = RxBool(true);


  void saveTokenToSharedPreferences(String token) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);
      print('Token saved to SharedPreferences: $token');
    }
    catch(ex)
    {
      print(' saved to SharedPreferences: $token');

      print(ex.toString());
    }
  }
  Future<String?> getTokenFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('Token retrieved from SharedPreferences: $token');
    return token;
  }

  Future<void> fetchLeads() async {

    try{
    String? authToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqd3RJZCI6MTY5MTM4NTEwODgyOCwiaXNzdWVEYXRlIjoiMjAyMy0wOC0wN1QwNToxMTo0OC44MjhaIiwidXNlcklkIjoiZWU0NTBhYTUtNGVlMy00ODg4LWJiOTctMzk4YjMxODhiYTlhIiwiZW1haWwiOiJzYXRpc2hzbWFldHVlaWl3dUB5b3BtYWlsLmNvbSIsIm1vYmlsZSI6IjgwNTE2NDY1MzkiLCJuYW1lIjoiU2F0aXNoIHNpbmdoIiwidXNlclR5cGUiOiJWZW5kb3IiLCJ1c2VyTmFtZSI6IklOU0ExNjkxMzg1MDkyNDY3IiwiaGllcmFyY2hpY2FsTGV2ZWwiOjAsImlzVmVyaWZpZWQiOmZhbHNlLCJpc0FncmVlZCI6ZmFsc2UsImlhdCI6MTY5MTM4NTEwOCwiZXhwIjoxNjkzOTc3MTA4fQ.KRWb7NsgKkQjUmd2BXCOpAHe2q-Rp0OJadcjEkMUucE';
    var headers = {
      'Authorization': 'Bearer $authToken'
      // '$authToken',
    };
    final response = await http.get(
      Uri.parse(
        'https://partnersapi.stage.insurancesamadhan.com/api/v2/lead/getLeadDetails?status=&page=$currentPage',
      ),
      headers: headers,
    );
    print(response);
    if (response.statusCode == 200) {
      print("steeuei");
      print(jsonDecode(response.body));
      print("response");
      final jsonData = json.decode(response.body);
  //    List<DetailModel> listdat=[];

      //
      // // Handle token retrieval from headers
      // String? tokenFromHeaders = response.headers['token'];
      // if (tokenFromHeaders != null) {
      //   print("Token from headers: $tokenFromHeaders");
      //   saveTokenToSharedPreferences(tokenFromHeaders);
      // }
      leads = jsonData['data'] ?? [];
    //  listdat = List<DetailModel>.from(jsonData.map((product) => DetailModel.fromJson(jsonData)));



print("length:${leads.length}");



        // leads.add(DetailModel.fromJson(jsonData));

    } else {
      throw Exception('Failed to load data');
    }
  }catch(e){
    print("Ror occurred: $e");
    }
  }

// Future<void> fetchLeads() async {
  //   String? authToken  =  await getTokenFromSharedPreferences();
  //   var headers = {
  //     'Authorization': '$authToken',
  //   };
  //   final response = await http.get(Uri.parse(
  //     // 'https://partnersapi.stage.insurancesamadhan.com/api/v2/lead/getLeadDetails?status='
  //       'https://partnersapi.stage.insurancesamadhan.com/api/v2/lead/getLeadDetails?status=&page=$currentPage'
  //   ),
  //    headers:headers
  //   );
  //   print(response);
  //   if (response.statusCode == 200) {
  //
  //     final jsonData = json.decode(response.body);
  //     String token = jsonData["token"];
  //     print("token $token");
  //     saveTokenToSharedPreferences(token);
  //     print(jsonData['data']);
  //     for (var item in jsonData['data']) {
  //       print(jsonData['data']);
  //       leads.add(DetailModel.fromJson(item));
  //     }
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }
}
