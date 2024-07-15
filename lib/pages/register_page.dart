import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_button.dart';
import 'package:social_media_app/components/my_textfield.dart';
import '../helper/helper_function.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user in method
  void registerUser() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // make sure passwords match
    if (passwordController.text == confirmPasswordController.text) {
      // pop loading circle
      Navigator.pop(context);

      // show error to user
      displayErrorMesageToUser("Password don't match !", context);
    }
    // if passwords don't match
    else {
      // try creating user
      try {
        // create the user
        UserCredential? userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // pop loading circle
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        // pop circle
        Navigator.pop(context);

        // show message to user
        displayErrorMesageToUser(e.code, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            // permettant de scroller quand l'affichage depasse le nombre de pixels de l'appareil
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo
                  Icon(
                    Icons.person,
                    size: 80,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // app name
                  const Text(
                    " M I N I M A L",
                    style: TextStyle(fontSize: 20),
                  ),

                  const SizedBox(
                    height: (50),
                  ),

                  // username textfiled
                  MyTextfield(
                    controller: usernameController,
                    obscureText: false,
                    hintText: "Username",
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // email textfiled
                  MyTextfield(
                    controller: emailController,
                    obscureText: false,
                    hintText: "Email",
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // password textfield
                  MyTextfield(
                    controller: passwordController,
                    obscureText: true,
                    hintText: "Password",
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // confirm password textfield
                  MyTextfield(
                    controller: confirmPasswordController,
                    obscureText: true,
                    hintText: "Confirm Password",
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // forgot password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // registerUser button
                  MyButton(
                    text: "Register",
                    onTap: registerUser,
                  ),

                  const SizedBox(height: 25),

                  // don't have an account ? Register here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ?",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "     Login Here",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
