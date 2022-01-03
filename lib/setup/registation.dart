import 'package:classy/model/signin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;





class Registation extends StatefulWidget {
  const Registation({Key? key}) : super(key: key);

  @override
  _RegistationState createState() => _RegistationState();
}

class _RegistationState extends State<Registation> {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children:<Widget> [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Center(child: Text(
                "Register",style: TextStyle(color: Colors.black,fontSize: 30),)),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextFormField(

                validator: (input) {
                  if (input!.isEmpty) {
                    return "Please type an email";
                  }
                },
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Your Email'
                ),

              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextFormField(


                validator: (input) {
                  if (input!.isEmpty) {
                    return "Please type your name";
                  }
                },
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Your Name'
                ),
              ),
            ),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextFormField(

                validator: (input) {
                  if (input!.isEmpty) {
                    return "Please type your phone number";
                  }
                },
                controller: phoneController,
                decoration: InputDecoration(
                    hintText: 'Your Phone Number'
                ),
              ),
            ),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextFormField(
                validator: (input) {
                  if (input!.isEmpty) {
                    return "Please type your password";
                  }
                },
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Your Password'
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextFormField(
                validator: (input) {
                  if (input!.isEmpty) {
                    return "Please type your Confirm password";
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Confirm Password'
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text('I agree to the Terms of User',style: TextStyle(color: Colors.black54,fontSize: 15),),

            SizedBox(height: 20,),
            RaisedButton(
              color: Colors.redAccent,
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
              onPressed: () {  },
              child: InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(
                      builder: (Context)=>SignIn()));
                },
                child: Text('CREATE ACCOUNT',
                  style: TextStyle(color: Colors.white,
                      fontSize: 20),),
              ),
            ),
            SizedBox(height: 30,),

            Text('HAVE NOT ACCOUNT YET ? ',style: TextStyle(color: Colors.black,fontSize: 15),),
            SizedBox(height: 30,),

            InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(
                      builder: (Context)=>SignIn()));
                },
                child: Text('LOGIN',style: TextStyle(color: Colors.black,fontSize: 20),)),
          ],
        ),


    );

    }

  void login(String email, password,name,phone) async {
    try {
      final response = await http.post(
          Uri.parse(
              'https://classyecommerce.excelitaiportfolio.com/api/user/registration'),
          body: {
            'email': email,
            'password': password,
            'name': name,
            'phone': phone,
          }
      );
      if (response.statusCode == 200) {
        print(response.statusCode);
        Navigator.push(context,MaterialPageRoute(
            builder: (Context)=>SignIn()));
      } else {
        print('failed');
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
}





