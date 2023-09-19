import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:techprohelpline/UI/shport/color.dart';
import 'package:techprohelpline/UI/shport/navbar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    try {
      await _auth.signInWithEmailAndPassword(
        email: data.name,
        password: data.password,
      );
      return null;
    } catch (e) {
      return 'Invalid email or password';
    }
  }

  Future<String?> _signupUser(SignupData data) async {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    try {
      await _auth.createUserWithEmailAndPassword(
        email: data.name.toString(),
        password: data.password.toString(),
      );
      return null;
    } catch (e) {
      return 'Failed to create user';
    }
  }

  Future<String> _recoverPassword(String name) async {
    debugPrint('Name: $name');
    try {
      await _auth.sendPasswordResetEmail(email: name);
      return 'Password reset email sent';
    } catch (e) {
      return 'User not found';
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        if (userCredential.user != null) {
          await _storeUserDataInFirestore(userCredential.user!);
        }
      }
    } catch (e) {
      print('Google sign in failed: $e');
    }
  }

  Future<void> _storeUserDataInFirestore(User user) async {
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

    await userRef.set({
      'email': user.email,
      'displayName': user.displayName,
      // Add other user data you want to store
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'TechProHelpline',
      // logo: AssetImage(
      //   'asset/image/eagle.jpg',
      // ),
      onLogin: _authUser,
      onSignup: _signupUser,

      loginProviders: <LoginProvider>[
        // LoginProvider(
        //   icon: FontAwesomeIcons.google,
        //   label: 'Google',
        //   callback: () async {
        //     debugPrint('start google sign in');
        //     await Future.delayed(loginTime);
        //     debugPrint('stop google sign in');

        //     await _signInWithGoogle();

        //     Navigator.of(context).pushReplacement(MaterialPageRoute(
        //       builder: (context) =>
        //           Navbar(), // Replace Navbar with the desired screen
        //     ));

        //     return null;
        //   },
        // ),
        // ... other LoginProviders
      ],
      theme: LoginTheme(
        primaryColor: const Color.fromARGB(
            255, 140, 93, 93), // Set the primary color for the login screen
        accentColor: Color.fromARGB(
            255, 11, 29, 123), // Set the accent color for buttons, etc.
        titleStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28.0,
        ),

        logoWidth: 100,
      ),
      // messages: LoginMessages(userHint: 'User Name'),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Navbar(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
