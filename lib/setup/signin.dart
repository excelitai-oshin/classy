import 'package:classy/pages/home.dart';
import 'package:classy/setup/registation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Column(
            children: [
              Text(
                'Login', style: TextStyle(color: Colors.black, fontSize: 30),),
              Column(
                children: <Widget>[
                  TextFormField(
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Please type an email";
                      }
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: 'Enter Your Email'),
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input!.length < 6) {
                        return "your password needs to be atlest 6 characters";
                      }
                    },
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 80,),
                  RaisedButton(
                    color: Colors.redAccent,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                    onPressed: () {
                      login(emailController.text.toString(),
                          passwordController.text.toString());
                    },
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(
                            builder: (Context)=>HomeScreen()));
                      },
                      child: Text('Login',
                        style: TextStyle(color: Colors.white,
                            fontSize: 20),),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Text('OR LOGIN WITH',
                    style: TextStyle(color: Colors.black54, fontSize: 15),),
                  SizedBox(height: 130,),

                  Text('HAVE NOT ACCOUNT YET ?',
                    style: TextStyle(color: Colors.black54, fontSize: 15),),


                  SizedBox(height: 140,),

                  InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(
                          builder: (Context)=>Registation()));
                    },
                    child: Text('SIGN UP',
                      style: TextStyle(color: Colors.black, fontSize: 20),),
                  ),

                ],


              ),
            ]
        ),
      ),

    );
  }

  void login(String email, password) async {
    try {
      final response = await http.post(
          Uri.parse(
              'https://classyecommerce.excelitaiportfolio.com/api/user/login'),
          body: {
            'email': email,
            'password': password,
          }
      );
      if (response.statusCode == 200) {
         print(response.statusCode);
         Navigator.push(context,MaterialPageRoute(
             builder: (Context)=>HomeScreen()));
       } else {
        print('failed');
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
}
