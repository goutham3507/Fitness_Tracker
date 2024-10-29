import 'package:flutter/material.dart';
import '../../constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  CustomCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      child: child,
    );
  }
}
