import 'package:flutter/material.dart';
import 'package:moviebox/main.dart';
import 'package:moviebox/screens/signup.dart';
import 'package:moviebox/screens/widegts/common_text_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  bool loadingOnLogin = false;

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.withOpacity(0.5),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'MOVIE BOX',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CommonTextField(
              focusNode: emailFocusNode,
              descriptionController: emailController,
              labelText: 'Email',
              horizontalPaddingToTextField: 10,
              textInputType: TextInputType.emailAddress,
              textInputColor: Colors.black,
              validation: (value) {
                return null;
              },
              isEnabled: true,
            ),
            const SizedBox(
              height: 10,
            ),
            CommonTextField(
              focusNode: passwordFocusNode,
              descriptionController: passwordController,
              labelText: 'Password',
              obscureText: showPassword,
              showSuffixIcon: true,
              suffixIcon: showPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: const Icon(
                        Icons.visibility_off,
                        color: Colors.white,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                      ),
                    ),
              horizontalPaddingToTextField: 10,
              textInputType: TextInputType.text,
              textInputColor: Colors.black,
              validation: (value) {
                return null;
              },
              isEnabled: true,
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                if (emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  setState(
                    () {
                      loadingOnLogin = true;
                      Future.delayed(const Duration(seconds: 3)).then(
                        (value) {
                          setState(() {
                            loadingOnLogin = false;
                          });
                          if (userEmail == emailController.text.toString() &&
                              userPassword ==
                                  passwordController.text.toString()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'User Is Logged In Successfully!',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            );
                            emailController.clear();
                            passwordController.clear();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Email Or Password Is Not Valid!',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Fields Should Not Be Empty!',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: loadingOnLogin
                        ? SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(
                              color: Colors.purple.withOpacity(0.5),
                            ),
                          )
                        : const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Signup(),
                  ),
                );
                emailController.clear();
                passwordController.clear();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                      child: Text(
                    'Signup',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
