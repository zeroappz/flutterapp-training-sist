import 'package:flutterapp/services/auth_services.dart';
import 'package:flutterapp/values/app_lib.dart';

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({Key? key}) : super(key: key);

  @override
  State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalWidget().dynamicAppBar("Google SignIn"),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.purpleAccent, Colors.amber, Colors.blue],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      InkWell(
                        onTap: () {
                          () {};
                        },
                        child: SizedBox(
                          height: 200,
                          width: 360,
                          child: Lottie.network(
                              'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/lottiefiles/construction_site.json'),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 540,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              'Welcome to Algoxfusion',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              'Please login to continue',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GoogleWidget()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleWidget extends StatefulWidget {
  const GoogleWidget({Key? key}) : super(key: key);

  @override
  State<GoogleWidget> createState() => _GoogleWidgetState();
}

class _GoogleWidgetState extends State<GoogleWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //TextEditing controllers
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Email',
                  suffix: const FaIcon(
                    FontAwesomeIcons.envelope,
                    color: Colors.red,
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter your email";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Password',
                  suffix: const FaIcon(
                    FontAwesomeIcons.envelope,
                    color: Colors.red,
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter valid Password";
                  }
                  return null;
                },
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  child: Text("Email/Password Signin"),
                  onPressed: () {
                    //Validate will return true if the form is valid, else it is invalid form
                    if (_formKey.currentState!.validate()) {
                      Fluttertoast.showToast(
                          msg: "email: " +
                              email.text +
                              "\n password: " +
                              password.text,
                          toastLength: Toast.LENGTH_LONG);

                      // Processing user data to firebase
                      auth
                          .createUserWithEmailAndPassword(
                              email: email.text, password: password.text)
                          .then((_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      });
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  child: Text("Google Signin"),
                  onPressed: () {
                    //Validate will return true if the form is valid, else it is invalid form
                    // googleSigninMethod(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
