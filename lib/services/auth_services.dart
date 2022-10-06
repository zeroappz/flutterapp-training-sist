import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/values/app_lib.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;

Future<void> googleSignIn(context) async {
  final gooleSignIn = GoogleSignIn();
  final googleSignInAccount = await gooleSignIn.signIn();
  if (googleSignInAccount != null) {
     
      
    final googleAuth = await googleSignInAccount.authentication;
    debugPrint("Access Token $googleAuth.accessToken");
    debugPrint("Auth ID token $googleAuth.idToken");
    if (googleAuth.accessToken != null && googleAuth.idToken != null) {
      try {
        await auth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        // Navigator.of(context).pushReplacement(WelcomeScreen())
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
        debugPrint("successfully login!");
      } catch (e) {
        debugPrint("failed login!");
      }
    }
  }
}
