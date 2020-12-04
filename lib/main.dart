import 'package:batman_signin/batman_animated_buttons.dart';
import 'package:batman_signin/batman_city.dart';
import 'package:batman_signin/batman_screen_signup.dart';
import 'package:batman_signin/batman_screen_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: MainBatmanSignupApp(),
    );
  }
}

class MainBatmanSignupApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Theme(
              data: ThemeData.light()
                  .copyWith(textTheme: GoogleFonts.vidalokaTextTheme()),
              child: BatmanSignUp())),
    );
  }
}

class BatmanSignUp extends StatefulWidget {
  @override
  _BatmanSignUpState createState() => _BatmanSignUpState();
}

class _BatmanSignUpState extends State<BatmanSignUp>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animationLogoIn;
  Animation<double> _animationLogoUp;
  Animation<double> _animationBatmanIn;
  Animation<double> _animationButtonsIn;

  AnimationController _animationControllerSignUp;
  Animation _animationLogoOut;
  Animation _animationBatmanUp;
  Animation _animationBatmanCity;
  Animation _animationBatmanSignUpIn;

  void setupFirstAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _animationLogoIn = Tween(
      begin: 30.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.25),
      ),
    );

    _animationLogoUp = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.35, 0.60),
    );

    _animationBatmanIn = Tween(
      begin: 5.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.7, 1.0, curve: Curves.decelerate),
      ),
    );

    _animationButtonsIn = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.7, 1),
    );

    _animationController.forward();
  }

  void setupSecondAnimations() {
    _animationControllerSignUp = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    _animationLogoOut = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: Interval(0.0, 0.20),
    );

    _animationBatmanUp = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: Interval(0.35, 0.55),
    );

    _animationBatmanCity = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: Interval(0.65, 0.8),
    );

    _animationBatmanSignUpIn = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: Interval(0.85, 1, curve: Curves.easeIn),
    );
  }

  void _onSignUp() {
    _animationControllerSignUp.forward(from: 0.0);
  }

  @override
  void initState() {
    setupFirstAnimations();
    setupSecondAnimations();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerSignUp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);
      },
      child: AnimatedBuilder(
        animation: Listenable.merge(
            [_animationController, _animationControllerSignUp]),
        builder: (context, _) {
          return Scaffold(
            backgroundColor: Color(0xFF100F0B),
            body: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/img/batman_background.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Transform.translate(
                    offset: Offset(
                        0.0,
                        60 * _animationLogoOut.value +
                            -_animationBatmanUp.value * 60),
                    child: Transform.scale(
                      scale: _animationBatmanIn.value,
                      child: Image.asset(
                        'assets/img/batman_alone.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3.8,
                  left: 40,
                  right: 40,
                  child: BatmanCity(_animationBatmanCity),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height / 1.8,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: BatmanScreenSignUp(_animationBatmanSignUpIn)),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: Offset(0.0, 60 * _animationLogoOut.value),
                        child: Opacity(
                            opacity: 1 - _animationLogoOut.value,
                            child: BatmanScreenTitle(_animationLogoUp)),
                      ),
                      SizedBox(height: 35),
                      Transform.translate(
                        offset: Offset(0.0, 60 * _animationLogoOut.value),
                        child: Opacity(
                            opacity: 1 - _animationLogoOut.value,
                            child: BatmanAnimatedButtons(
                                _animationButtonsIn, _onSignUp)),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2.2 -
                      65 * _animationLogoUp.value,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: 1 - _animationLogoOut.value,
                    child: Transform.scale(
                      scale: _animationLogoIn.value,
                      child: Image.asset(
                        'assets/img/batman_logo.png',
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
