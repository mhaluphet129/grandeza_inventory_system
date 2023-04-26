import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grandeza_inventory_system/screens/user/auth.dart';

class Register extends StatefulWidget {
  Function changed;
  Function proceed;
  Register({Key? key, required this.changed, required this.proceed})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends State<Register> {
  String loading = '';

  onPress() {
    setState(() {
      loading = 'loading';
    });
// check if email is registered in the database
    Future.delayed(Duration(seconds: 2), () {
      widget.proceed();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * .35,
      height: height * .35,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffDBAD3F), width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          const SizedBox(
            height: 80,
            child: Center(
              child: Text(
                'Register',
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
          SizedBox(
            width: (width * .35) * .8,
            height: height * .05,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffDBAD3F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: loading == 'loading' ? null : onPress,
              icon: loading == 'loading'
                  ? Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.all(2.0),
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : const SizedBox.shrink(),
              label: Text(
                loading == 'loading' ? '' : 'Register',
                style: const TextStyle(fontSize: 25),
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
                text: ' to login',
                style: TextStyle(fontFamily: 'Nunito', color: Colors.white))
          ])),
        ],
      ),
    );
  }
}
