import 'package:flutter/material.dart';
import 'package:projpet/models/user_model.dart';
import 'package:projpet/view/dashboard_screen.dart';
import 'package:projpet/view/doglist_screen.dart';
 

List<UserModel> users = [];
 

final UserModel fixedUser = UserModel(
  username: "Admin",
  email: "teste@gmail.com",
  password: "teste123",
);
 
void main() {
  runApp(LoginScreen());
}
 
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}
 
class SignInPage extends StatefulWidget {

  @override
  _SignInPageState createState() => _SignInPageState();
}
 
class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = "";
 
  void _login(BuildContext context) {
    String email = _emailController.text;
    String password = _passwordController.text;
 

    if (email == fixedUser.email && password == fixedUser.password) {
      print('Login bem-sucedido: ${fixedUser.username}');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DogsListScreen()),
      );
    } else {

      setState(() {
        _errorMessage = "Credenciais inválidas. Tente novamente.";
      });
      print('Credenciais inválidas');
    }
  }
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF5E8FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.02),
              Text(
                "Entre na sua conta",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              
              SizedBox(height: size.height * 0.02),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: size.height * 0.04),
              Container(
                width: double.infinity,
                height: size.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    _login(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7E57C2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Entre',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}