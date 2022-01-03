import 'package:classy/pages/home.dart';
import 'package:classy/setup/google_login_controller.dart';
import 'package:classy/setup/registation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


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
    final model =Provider.of<GoogleSignInController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20,top: 100),
          child: SingleChildScrollView(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Login', style: TextStyle(color: Colors.black, fontSize: 30),),
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
                  //SizedBox(height: 80,),
                  RaisedButton(
                    color: Colors.redAccent,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                    onPressed: () {
                      login(emailController.text.toString(),
                          passwordController.text.toString());
                    },
                    child: Text('Login',
                      style: TextStyle(color: Colors.white,
                          fontSize: 20),),
                  ),
                  //SizedBox(height: 20,),

                  Text('OR LOGIN WITH',
                    style: TextStyle(color: Colors.black54, fontSize: 15),),
                  //SizedBox(height: 130,),


                  //loginUI(),
                  loginControls(context),




                  Text('HAVE NOT ACCOUNT YET ?',
                    style: TextStyle(color: Colors.black54, fontSize: 15),),

                  SizedBox(height: 40,),

                  InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(
                          builder: (Context)=>Registation()));
                    },
                    child: Text('SIGN UP',
                      style: TextStyle(color: Colors.black, fontSize: 20),),
                  ),
                ]
            ),
          ),
        ),
      ),

    );
  }

  loginUI(){
    return Consumer<GoogleSignInController>(
      builder: (context,model,child){
        if(model.googleSignInAccount !=null){
          return Center(
            child: loggedInUI(model),);
        }
        else{
          return loginControls(context);
        }
      },
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

  loggedInUI(GoogleSignInController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:Image.network(model.googleSignInAccount?.photoUrl ?? '') .image,
          radius: 50,
        ),
        Text(model.googleSignInAccount?.displayName ??''),
        Text(model.googleSignInAccount?.email??''),
        ActionChip(
          avatar: Icon(
            Icons.logout,
            color: Colors.blue,
            size: 30.0,
          ),
          label: Text("Login"),
          onPressed: (){
            var provider;
            model.logout();
          },
        )


      ],
    );
  }
  loginControls(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center ,
        children: [
          GestureDetector(
            child: Image.asset("assets/google.png",//google.png
              width: 220,
            ),
            onTap: ()async{
              //final value=await Provider.of<GoogleSignInController>(context,listen: false);
              GoogleSignInController user=GoogleSignInController();
                 await user.login();
                  print(user.googleSignInAccount?.displayName??'');
                  print("<<<<<<<<<<<<<<<<<<<<<<");
                  user.logout();
              Navigator.push(context,MaterialPageRoute(builder: (context)=> SignIn()));


            },
          ),

          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/facebook.png",
              width: 220,),
          ),
        ],
      ),
    );

  }
}



