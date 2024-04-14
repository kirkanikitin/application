import 'package:application/pages/register_page.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    // hello
    // hi 2

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Test()),
    );
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {


  final dio = Dio();

  Future<Response> request() async {
    Response response;
    response = await dio.post('https://randomuser.me/api/',  data: {'name': 'ggfgdg'}, );

    final results = response.data['results'];
    final name = results[0]['name'];
    final last = name['last'];
    //
    //
    print('__________________________1');
    print(results );
    print('__________________________2');
    print(name );

    ///
    print('__________________________3');
    print(last );


    // print(response.data.toString());

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
      future: request(),
      builder: (context, snapshot) {
        return Text(snapshot.toString());
      }
    );
  }
}
