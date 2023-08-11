import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3));
    // bool loggedIn = await _isTokenValid();
    // if (loggedIn) {
      Get.toNamed('/home');
    // }
  }
  Future<bool> _isTokenValid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenExpiryTimeString = prefs.getString('tokenExpiryTime');
    if (tokenExpiryTimeString != null) {
      DateTime tokenExpiryTime = DateTime.parse(tokenExpiryTimeString);
      return DateTime.now().isBefore(tokenExpiryTime);
    } else {
      return false;
    }
  }
  Future<bool> _isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset('assets/images/insurance_samadhan_logo.png'),
        ),
      ),
    );
  }


}


