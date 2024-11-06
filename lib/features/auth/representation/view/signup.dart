import 'package:coffee_api/features/auth/representation/view/signin.dart';
import 'package:coffee_api/features/auth/representation/view/widgets/TextFormWidget.dart';
import 'package:coffee_api/features/auth/representation/view/widgets/stackwidget.dart';
import 'package:coffee_api/features/auth/representation/view/widgets/textbuttonwidget.dart';
import 'package:coffee_api/features/auth/representation/viewmodel/cubit/signup_cubit/signup_cubit.dart';
import 'package:coffee_api/features/home/presentation/view/hom1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              StackWidget(),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Hello Sign Up!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextForm(
                icon: Icons.face,
                hintText: "Enter Name",
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
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
              SizedBox(height: 30),
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
                      await context.read<SignUpCubit>().signUp(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                      print('Sign-up successful');
                    } catch (e) {
                      print('Sign-up failed: $e');
                    }
                  }
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              CustomTextButton(
                text: "Sign In",
                navigator: (BuildContext context) => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
