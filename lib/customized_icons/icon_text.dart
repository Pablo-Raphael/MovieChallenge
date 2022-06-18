import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final double size;
  final String text;

  const IconText({
    Key? key,
    required this.icon,
    required this.size,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon, color: Colors.white, size: size),
        const SizedBox(width: 7),
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )
      ],
    );
  }
}
