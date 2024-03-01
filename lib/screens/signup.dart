import 'package:flutter/material.dart';
import 'package:moviebox/screens/widegts/common_text_field.dart';

import '../main.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  bool loadingOnSignup = false;

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
            const SizedBox(
              height: 100,
            ),
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
              'SIGNUP',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CommonTextField(
                      focusNode: nameFocusNode,
                      descriptionController: nameController,
                      labelText: 'Name',
                      horizontalPaddingToTextField: 10,
                      textInputType: TextInputType.text,
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
                      focusNode: phoneFocusNode,
                      descriptionController: phoneController,
                      labelText: 'Phone No',
                      horizontalPaddingToTextField: 10,
                      textInputType: TextInputType.text,
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
                      focusNode: emailFocusNode,
                      descriptionController: emailController,
                      labelText: 'Email',
                      horizontalPaddingToTextField: 10,
                      textInputType: TextInputType.text,
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
                      horizontalPaddingToTextField: 10,
                      textInputType: TextInputType.text,
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
                      focusNode: confirmPasswordFocusNode,
                      descriptionController: confirmPasswordController,
                      labelText: 'Confirm Password',
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
                            passwordController.text.isNotEmpty &&
                            nameController.text.isNotEmpty &&
                            phoneController.text.isNotEmpty &&
                            confirmPasswordController.text.isNotEmpty) {
                          setState(
                            () {
                              loadingOnSignup = true;
                              Future.delayed(const Duration(seconds: 3)).then(
                                (value) {
                                  setState(() {
                                    loadingOnSignup = false;
                                  });
                                  if (passwordController.text.toString() ==
                                      confirmPasswordController.text
                                          .toString()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Signup Successful!',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                    );
                                    userEmail = emailController.text.toString();
                                    userPassword =
                                        passwordController.text.toString();
                                    emailController.clear();
                                    passwordController.clear();
                                    nameController.clear();
                                    phoneController.clear();
                                    confirmPasswordController.clear();
                                    Navigator.of(context).pop();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Passwords Does Not Matched!',
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
                            child: loadingOnSignup
                                ? SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircularProgressIndicator(
                                      color: Colors.purple.withOpacity(0.5),
                                    ),
                                  )
                                : const Text(
                                    'Signup',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
