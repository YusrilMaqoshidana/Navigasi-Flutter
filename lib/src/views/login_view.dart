import 'package:flutter/material.dart';
import 'package:navigasi/src/components/button_component.dart';
import 'package:navigasi/src/components/show_alert_component.dart';
import 'package:navigasi/src/components/text_field_component.dart';

import 'homepage_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _showDialogFail(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return ShowAlertDialog(
          message: message,
          onPressed: () => Navigator.pop(context),
        );
      },
    );
  }

  Widget _cardLogin() {
    final tinggiCard = MediaQuery.of(context).size.height / 1 * 0.6;
    final lebarCard = MediaQuery.of(context).size.height;
    return Container(
      height: tinggiCard,
      width: lebarCard,
      decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          )),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 24),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Email',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16), // Warna untuk karakter "*"
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            TextFieldComponent(
              controller: emailController,
              text: "Masukan email",
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 24),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Password',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16), // Warna untuk karakter "*"
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            TextFieldPasswordComponent(
              controller: passwordController,
              text: "Masukan password",
            ),
            const SizedBox(
              height: 50,
            ),
            ButtonComponent(
              onPressed: () {
                if (emailController.text.trim() != '' &&
                    passwordController.text.trim() != '') {
                  if (_isValidEmail(emailController.text.trim())) {
                    String email = emailController.text.trim();
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 1),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = const Offset(1.0, 0.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;
                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);
                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            HomePage(email: email),
                      ),
                    );
                  } else {
                    _showDialogFail("Pastikan email anda valid");
                  }
                } else {
                  _showDialogFail("Pastikan email dan password tidak kosong");
                }
              },
              text: "L O G I N",
            ),
          ],
        ),
      ),
    );
  }

  bool _isValidEmail(String email) {
    // Gunakan ekspresi reguler atau pustaka validasi email untuk memeriksa format email
    return RegExp(r'^[\w-\.]+@[a-zA-Z0-9-]+.(\.[a-zA-Z0-9-]+)*$')
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Hey,",
                            style: Theme.of(context).textTheme.headlineLarge,
                          )),
                      Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Welcome",
                            style: Theme.of(context).textTheme.headlineLarge,
                          )),
                      Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Back",
                            style: Theme.of(context).textTheme.headlineLarge,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Enter or create an account in a few easy steps 👌",
                            style: Theme.of(context).textTheme.headlineSmall,
                          )),
                    ],
                  ),
                )
              ],
            ),
            _cardLogin(),
          ],
        ));
  }
}
