import 'package:flutter/material.dart';

class ShadedIconButton extends StatelessWidget {
  const ShadedIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: Colors.black54,
      child: IconButton(
        onPressed: (){},
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.keyboard_arrow_left_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
