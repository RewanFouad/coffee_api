import 'package:coffee_api/features/auth/representation/view/signup.dart';
import 'package:coffee_api/features/auth/representation/view/widgets/TextFormWidget.dart';
import 'package:coffee_api/features/auth/representation/view/widgets/stackwidget.dart';
import 'package:coffee_api/features/auth/representation/view/widgets/textbuttonwidget.dart';
import 'package:coffee_api/features/auth/representation/viewmodel/cubit/signin_cubit/signin_cubit.dart';
import 'package:coffee_api/features/home/presentation/view/hom1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            StackWidget(),
            SizedBox(height: 10),
            Center(
              child: Text(
                "Hello Sign In!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextForm(
              icon: Icons.person_outline,
              hintText: "Enter Email",
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextForm(
              icon: Icons.lock,
              hintText: "Enter Password",
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              isPasswordField: true,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff2e582e),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    await context.read<SignInCubit>().signIn(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                    print('Sign-in successful');
                  } catch (e) {
                    print('Sign-in failed: $e');
                  }
                }
              },
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            CustomTextButton(
              text: "Sign Up",
              navigator: (BuildContext context) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
