import 'package:begapp/app_button.dart';
import 'package:begapp/auth_services.dart';
import 'package:begapp/register_page.dart';
import 'package:begapp/style_textfield.dart';
import 'package:begapp/top_title.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/logo.png',width: 50,),
                const SizedBox(height: 30),
                const TopTitle(
                  title: 'Login',
                  subTitle: 'You Welcome',
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
                      AuthServices.login(
                        context,
                        emailController.text,
                        passController.text,
                      );
                    }
                  },
                  text: "Login",
                ),
                const SizedBox(height: 30),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => RegisterPage()),
                    ),
                    child: const Text("Register"),
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
