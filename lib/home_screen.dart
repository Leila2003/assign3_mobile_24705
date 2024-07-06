import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'auth_service.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final user = context.watch<AuthService>().user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        // actions: [
        //   if (user != null)
        //     IconButton(
        //       icon: Icon(Icons.logout),
        //       onPressed: () {
        //         context.read<AuthService>().signOut();
        //       },
        //     )
        // ],
      ),
      body: Center(
        child: Text("User is logged IN")
      ),
    );
  }
}
