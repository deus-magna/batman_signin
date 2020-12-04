import 'package:batman_signin/batman_button.dart';
import 'package:flutter/material.dart';

class BatmanAnimatedButtons extends AnimatedWidget {
  BatmanAnimatedButtons(Animation animation, this.onTap)
      : super(listenable: animation);

  Animation get _animationButtonsIn => listenable as Animation;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Opacity(
        opacity: _animationButtonsIn.value,
        child: Transform.translate(
          offset: Offset(0.0, 100 * (1 - _animationButtonsIn.value)),
          child: Column(
            children: [
              BatmanButton(
                onTap: () {},
                text: 'LOGIN',
                left: false,
              ),
              SizedBox(
                height: 10,
              ),
              BatmanButton(
                onTap: onTap,
                text: 'SIGNUP',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
