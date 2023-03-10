import 'package:creativa_flutter/weather_search.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var formkey=GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var ispassword=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      Stack(
        children:  [
          const Material(
            elevation: 0,
            child: Image(
              height: double.infinity,
                width: double.infinity,

                image: AssetImage("assets/images/clear.jpg"),
               fit: BoxFit.cover,


            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Text(
                      'Log In',
                      style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,),

                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(

                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email Is To Short";
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return "Email should have @ or .";
                        }

                        return null;
                      },


                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: ispassword,
                      keyboardType:TextInputType.visiblePassword,
                      decoration:  InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon:IconButton(onPressed: (){

                          setState(() {
                            ispassword = !ispassword;
                          });

                        }, icon:  Icon(ispassword? Icons.visibility : Icons.visibility_off,) ),




                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password must not be Empty";
                        }
                        if (value.length < 6) {
                          return "invalid password";
                        }

                        return null;
                      },


                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.blue,
                      child: MaterialButton(

                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Login',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),),
                        ),

                        onPressed: () {
                          setState(() {
                            if (formkey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                         WeatherSearch(),
                              ));
                            }
                          });
                        },




                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
    ],
      ),




    );

  }
}