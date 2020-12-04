import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class BatmanButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool left;

  const BatmanButton({
    Key key,
    this.onTap,
    this.text,
    this.left = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFFDE86A),
          child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          child: SizedBox(
            height: 55,
            child: Stack(
              children: [
                if (left)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(-10.0)
                        ..rotateZ(vector.radians(35)),
                      child: Image.asset(
                        'assets/img/batman_logo.png',
                        height: 40,
                        color: Color(0xFFC8B853),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  if (!left)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(10.0)
                        ..rotateZ(vector.radians(-35)),
                      child: Image.asset(
                        'assets/img/batman_logo.png',
                        height: 40,
                        color: Color(0xFFC8B853),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                Center(
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
