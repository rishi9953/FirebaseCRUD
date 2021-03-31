import 'package:flutter/material.dart';
import 'package:newproject/batchwrite.dart';
// import 'package:newproject/new_form.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:newproject/transactions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: _initialization,
          builder: (
            context,
            snapshot,
          ) {
            if (snapshot.hasError) {
              return SomethingWentWrong();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return MyAwesoneApp();
            }

            return Loading();
          }),
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Something Went Wrong"),
      ),
    );
  }
}

class MyAwesoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // ThemeData(primarySwatch: Colors.blue),
      home: BatchWrites(),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
