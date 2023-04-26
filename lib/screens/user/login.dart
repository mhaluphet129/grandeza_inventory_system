import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grandeza_inventory_system/screens/user/auth.dart';

class Login extends StatefulWidget {
  Function changed;
  Login({Key? key, required this.changed}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * .35,
      height: height * .5,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffDBAD3F), width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          const SizedBox(
            height: 80,
            child: Center(
              child: Text(
                'Login',
                style: TextStyle(
                    color: Color(0xffDBAD3F),
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          CustomInput(label: 'Email', onChanged: (String s) {}),
          const SizedBox(
            height: 20,
          ),
          CustomInput(
              label: 'Password', onChanged: (String s) {}, password: true),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: (width * .35) * .8,
            height: height * .05,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffDBAD3F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Click here',
                style: const TextStyle(
                    fontFamily: 'Nunito', color: Color(0xffDBAD3F)),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    widget.changed();
                  }),
            const TextSpan(
                text: ' to register new account!',
                style: TextStyle(fontFamily: 'Nunito', color: Colors.white))
          ])),
        ],
      ),
    );
  }
}
