import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/values/app_lib.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;

Future<void> googleSignIn(context) async {
  final googleSignIn = GoogleSignIn();
  final googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    final googleAuth = await googleSignInAccount.authentication;
    if (googleAuth.accessToken != null && googleAuth.idToken != null) {
      try {
        debugPrint("idToken:  ${googleAuth.idToken}");
        debugPrint("accessToken:  ${googleAuth.accessToken}");
        await auth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } catch (e) {
        debugPrint("login failed");
        Fluttertoast.showToast(
            msg: "login failed", toastLength: Toast.LENGTH_LONG);
      }
    }
  }
}
