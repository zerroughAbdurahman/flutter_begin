import 'package:begapp/app_button.dart';
import 'package:begapp/auth_services.dart';
import 'package:begapp/style_textfield.dart';
import 'package:begapp/top_title.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopTitle(
                  title: 'Register',
                  subTitle: 'Create an account',
                ),
                MyTextField(
                  controller: nameController,
                  name: 'Name',
                  prefixIcon: Icons.person_outline,
                  inputType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                ),
                MyTextField(
                  controller: emailController,
                  name: 'Email',
                  prefixIcon: Icons.mail_outline,
                  inputType: TextInputType.emailAddress,
                ),
                MyTextField(
                  controller: passController,
                  name: 'Password',
                  prefixIcon: Icons.lock_outline,
                  inputType: TextInputType.text,
                  obscureText: true,
                ),
                AppButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      AuthServices.createUser(
                        context,
                        nameController.text,
                        emailController.text,
                        passController.text,
                      );
                    }
                  },
                  text: "Register",
                ),
                const SizedBox(height: 30),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
