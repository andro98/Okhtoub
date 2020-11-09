import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:okthoub/provider/auth_provider.dart';
import 'package:okthoub/screens/auth_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}


class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot.error);
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xffd3d3d3),
          accentColor: Color(0xff805959),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            headline2: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        home: AuthPage(),
      ),
    );
  }
}
