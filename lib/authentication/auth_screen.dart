import 'package:dressme_up/authentication/LoginScreen/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class UserState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
          final User? user = _auth.currentUser;
          final String uid = user!.uid;
          
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshot)
      {
        if(userSnapshot.data == null)
        {
          print('user is not logged in yet');
          return AuthScreen();
        }
        else if (userSnapshot.hasData)
        {
          print('user is already logged in ');
          //return JobScreen(userID: uid);
        }

        else if(userSnapshot.hasError)
        {
          return const Scaffold(
            body: Center(
              child: Text('An error has been occured. Try again later.'),
            ),
          );
        }

        else if(userSnapshot.connectionState == ConnectionState.waiting)
        {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: Text('Something went wrong.'),
          ),
        );
      },

    );
  }
}
