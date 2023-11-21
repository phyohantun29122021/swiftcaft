import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app_demo/SignUpForm.dart';
import 'package:first_app_demo/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:first_app_demo/SignUpForm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:first_app_demo/screens/product_info_screen.dart';
import 'package:first_app_demo/screens/ProfileScreen.dart';
import 'package:first_app_demo/screens/ShoppingCartScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'lib/images/logo2.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 8.0),
              Text(
                'SwiftCart',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      fixedSize: Size(200.0, 50.0),
                    ),
                    onPressed: () async {
                      String username = _usernameController.text.trim();
                      String password = _passwordController.text.trim();

                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                                email: username, password: password);

                        // Handle successful login
                        _showSnackBar('Login Successful');

                        // Navigate to the Home Screen Page after successful login
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen()), // Replace HomeScreen with your actual home screen
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          _showSnackBar('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          _showSnackBar('Wrong password provided.');
                        } else {
                          _showSnackBar('Error: ${e.message}');
                        }
                      }
                    },
                    child: Text('Login'),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to the sign-up screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpForm()),
                  );
                },
                child: Text(
                  "Don't have an account? Register here",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
