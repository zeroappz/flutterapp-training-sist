import 'package:flutterapp/services/auth_services.dart';
import 'package:flutterapp/values/app_lib.dart';

class GoogleSignInScreen extends StatelessWidget {
  const GoogleSignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: const Text('Sign in'),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 220,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/image1.png"))),
              ),
              const MyStatefulWidget(),
            ]),
          ),
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: password,
                obscureText: true, //masking password
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the password';
                  }
                  return null;
                },
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  child: Text('Sign in with Email'),
                  // height: ,
                  // width: MediaQuery.of(context).size.width-20,
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                      Fluttertoast.showToast(
                        msg: "email: " +
                            email.text +
                            "\n password: " +
                            password.text,
                        toastLength: Toast.LENGTH_LONG,
                      );
                      // Process data.
                      auth
                          .createUserWithEmailAndPassword(
                              email: email.text, password: password.text)
                          // on success or failure case will be handle
                          .then((_) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      });
                    }
                  },
                ),
              ),
            ),
            Center(
              child: Text("OR"),
            ),
            Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ElevatedButton(
                    child: Text("Google Signin"),
                    onPressed: () {
                      googleSignIn(context);
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
