import 'package:flutter/material.dart';
import 'Activities/ActivityState.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeActivityState(),
    );
  }
}

class HomeActivityState extends StatefulWidget {
  @override
  HomeActivity createState() => HomeActivity();
}

class HomeActivity extends State<HomeActivityState> {
  final TextEditingController tController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            TextField(
              controller: tController,
              decoration: InputDecoration(
                labelText: 'Enter something',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            RedAcitvityState(inputText: tController.text),
                  ),
                );
              },
              child: Text("Go to Red Activity"),
            ),
          ],
        ),
      ),
    );
  }
}
