
import 'package:dressme_up/common/custom_button.dart';
import 'package:dressme_up/common/custom_textfield.dart';
import 'package:dressme_up/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = 'authentication/auth_screen.dart';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey= GlobalKey<FormState>();
  final _signInFormKey= GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(9.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            ListTile(
              tileColor: _auth == Auth.signup?GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
              title: Text(
                'Create Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
            ),
            if(_auth == Auth.signup)
              Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key:_signUpFormKey ,
                  child: Column(
                    children: [
                      CustomTextField(controller: _emailController,hintText: 'Email',),
                      const SizedBox(height: 10,),
                      CustomTextField(controller: _nameController,hintText: 'Name',),
                      const SizedBox(height: 10,),
                      CustomTextField(controller: _passwordController,hintText: 'Password',),
                      const SizedBox(height: 10,),
                      CustomButton(text: ('Sign Up'), onTap:(){

                      },buttoncolor: GlobalVariables.secondaryColor,)
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: ( _auth == Auth.signin?GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor),
              title: Text(
                'Sign-In',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
            ),
            if(_auth == Auth.signin)
            Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key:_signUpFormKey ,
                  child: Column(
                    children: [
                      CustomTextField(controller: _emailController,hintText: 'Email',),
                      const SizedBox(height: 10,),
                      CustomTextField(controller: _passwordController,hintText: 'Password',),
                      const SizedBox(height: 10,),
                      CustomButton(text: ('Sign Up'), onTap:(){

                      },buttoncolor: GlobalVariables.secondaryColor,)
                    ],
                  ),
                ),
              )
          ],
        ),
      )),
    );
  }
}
