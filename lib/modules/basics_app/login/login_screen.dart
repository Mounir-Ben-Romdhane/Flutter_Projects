

import 'package:flutter/material.dart';
import 'package:flutter_project/shared/components/components.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                    controller: emailController,
                    text: 'Email',
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                    valide: (String? value)
                    {
                      if(value!.isEmpty){
                        return 'Email address must not be empty';
                      }
                      return null;
                    }
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
              defaultFormField(
                  controller: passwordController,
                  text: 'Password',
                  prefix: Icons.lock,
                  type: TextInputType.visiblePassword,
                  isPassword: isPassword,
                  suffixPressed: ()
                  {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                  valide: (String? value)
                  {
                    if(value!.isEmpty){
                      return 'Password address must not be empty';
                    }
                    return null;
                  }
              ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    function: (){
                      if(formKey.currentState!.validate())
                      {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                    text: 'login',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    function: (){
                        if(formKey.currentState!.validate())
                        {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                    },
                    text: 'register',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(
                        'Dont\'t have an account?',
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Text(
                          'Register Now !'
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
