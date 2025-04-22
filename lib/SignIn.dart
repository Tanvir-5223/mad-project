import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'HomePage.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInPage({super.key});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.child_care, size: 60, color: Color(0xFF5F21E9)),
                SizedBox(height: 10),
                Text(
                  'Welcome Back to Kids Learning! 👋',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF5F21E9)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text('We missed you! Let\'s keep learning and having fun.',
                    textAlign: TextAlign.center),
                SizedBox(height: 20),
                buildLabel('Username or Email'),
                buildTextField(
                    controller: emailController,
                    hint: 'Enter your username or email',
                    icon: Icons.person),
                buildLabel('Password'),
                buildTextField(
                    controller: passwordController,
                    hint: 'Enter your password',
                    obscureText: true,
                    icon: Icons.lock),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password?',
                        style: TextStyle(color: Color(0xFF5F21E9))),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  icon: Icon(Icons.login, color: Colors.white),
                  label: Text(
                    'Sign In!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5F21E9),
                    minimumSize: Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                SizedBox(height: 20),
                Row(children: [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('or continue with')),
                  Expanded(child: Divider(color: Colors.grey)),
                ]),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialIconButton(
                      icon: FontAwesomeIcons.facebookF,
                      onPressed: () {
},
                    ),
                    SizedBox(width: 10),
                    socialIconButton(
                      icon: FontAwesomeIcons.google,
                      onPressed: () {

                      },
                    ),
                    SizedBox(width: 10),
                    socialIconButton(
                      icon: FontAwesomeIcons.twitter,
                      onPressed: () {

                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'New here? ',
                      children: [
                        TextSpan(
                          text: 'Create account!',
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

  Widget buildTextField(
      {required TextEditingController controller,
        required String hint,
        bool obscureText = false,
        required IconData icon}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Color(0xFFFCDFF0),
        prefixIcon: Icon(icon, color: Color(0xFFA675F5)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFA675F5))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFA675F5))),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      ),
    );
  }

  Widget socialIconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFFA675F5), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: FaIcon(icon, size: 20, color: Color(0xFF5F21E9)),
      ),
    );
  }
}