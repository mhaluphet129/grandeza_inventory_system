import 'package:flutter/material.dart';
import 'package:grandeza_inventory_system/screens/user/login.dart';
import 'package:grandeza_inventory_system/screens/user/register.dart';
import 'package:grandeza_inventory_system/screens/user/register_continue.dart';

class Auth extends StatefulWidget {
  Auth({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Auth();
}

class _Auth extends State<Auth> {
  String currentContext = 'login';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width * .6,
              child: Image.asset(
                'assets/images/login-logo.png',
                fit: BoxFit.fill,
              ),
            ),
            if (currentContext == 'login')
              Login(
                changed: () => setState(() {
                  currentContext = 'register';
                }),
              ),
            if (currentContext == 'register')
              Register(
                  changed: () => setState(() {
                        currentContext = 'login';
                      }),
                  proceed: () => setState(() {
                        currentContext = 'register-proceed';
                      })),
            if (currentContext == 'register-proceed')
              RegisterContinue(
                changed: () => setState(() {
                  currentContext = 'login';
                }),
              )
          ],
        ),
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  String label;
  void Function(String) onChanged;
  bool? password;
  CustomInput(
      {Key? key, required this.label, required this.onChanged, this.password});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width * .35) * .8,
      child: Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: const TextStyle(
                fontSize: 25, fontFamily: 'Nunito', color: Colors.white),
          ),
        ),
        TextFormField(
          style: const TextStyle(color: Colors.white, fontSize: 20),
          onChanged: onChanged,
          obscureText: password ?? false,
          decoration: InputDecoration(
              hintText: 'Enter your email',
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: Color(0xffDBAD3F)),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 3, color: const Color(0xffDBAD3F).withOpacity(0.5)),
                borderRadius: BorderRadius.circular(15),
              )),
          validator: (String? value) {
            if (value == null || value.isEmpty) {}
            return null;
          },
        ),
      ]),
    );
  }
}
