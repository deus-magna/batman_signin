import 'package:batman_signin/batman_button.dart';
import 'package:flutter/material.dart';

class BatmanScreenSignUp extends AnimatedWidget {
  BatmanScreenSignUp(Animation animation) : super(listenable: animation);

  Animation get _animationSignUpIn => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Opacity(
          opacity: _animationSignUpIn.value,
          child: Transform.translate(
            offset: Offset(0.0, 100 * (1 - _animationSignUpIn.value)),
            child: Column(
              children: [
                Text(
                  'GET ACCESS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _BatmanInput(
                  label: 'FULL NAME',
                ),
                _BatmanInput(
                  label: 'EMAIL ID',
                ),
                _BatmanInput(
                  label: 'PASSWORD',
                  isPassword: true,
                ),
                SizedBox(
                  height: 20,
                ),
                BatmanButton(
                  onTap: () {},
                  text: 'SIGNUP',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BatmanInput extends StatelessWidget {
  final String label;
  final bool isPassword;

  const _BatmanInput({Key key, this.label, this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: isPassword
                ? Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: UnconstrainedBox(
                      child: Image.asset(
                        'assets/img/batman_logo.png',
                        height: 15,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : null,
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.grey,
            )),
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.grey,
            ))),
      ),
    );
  }
}
