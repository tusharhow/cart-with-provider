import 'package:flutter/material.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({
    Key? key,
    required this.count,
  }) : super(key: key);

  final String count;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        color: Colors.red[400],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
