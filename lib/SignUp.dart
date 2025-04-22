import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void handleSignUp() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8D3EC),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(20),
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xFFA675F5), width: 2),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.child_care, size: 60, color: Color(0xFF5F21E9)),
                  SizedBox(height: 10),
                  Text(
                    'Welcome to Kids Learning! 🎓',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF5F21E9)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                      "Let's create your account to start exploring fun learning!",
                      textAlign: TextAlign.center),
                  SizedBox(height: 20),
                  buildLabel('First Name'),
                  buildTextField(firstNameController, 'Enter first name'),
                  buildLabel('Last Name'),
                  buildTextField(lastNameController, 'Enter last name'),
                  buildLabel('Email'),
                  buildTextField(emailController, 'Enter email',
                      inputType: TextInputType.emailAddress),
                  buildLabel('Password'),
                  buildTextField(passwordController, 'Create a password',
                      obscureText: true),
                  buildLabel('Retype Password'),
                  buildTextField(
                      retypePasswordController, 'Retype your password',
                      obscureText: true),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: handleSignUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5F21E9),
                      minimumSize: Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('Sign Up!',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Already have an account? ',
                        children: [
                          TextSpan(
                            text: 'Sign in here!',
style: TextStyle(
                                color: Color(0xFF5F21E9),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String hint,
      {bool obscureText = false,
      TextInputType inputType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: inputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        if (controller == retypePasswordController &&
            value != passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Color(0xFFFCDFF0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFA675F5), width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFA675F5), width: 2)),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      ),
    );
  }
}