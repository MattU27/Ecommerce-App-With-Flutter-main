import 'package:ecommerce/presentation/auth/pages/siginin.dart';
import 'package:flutter/material.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  void initState() {
    super.initState();
    // Navigate to SigninPage after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SigninPage()), // Navigate to SigninPage
        (Route<dynamic> route) => false, // Remove all previous routes
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Center(
        child: const Text('You have been logged out.'),
      ),
    );
  }
}
