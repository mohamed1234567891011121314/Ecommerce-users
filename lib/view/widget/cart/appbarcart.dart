import 'package:flutter/material.dart';

class AppBarCart extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const AppBarCart({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.bottomLeft,
            child:
                IconButton(onPressed: onPressed, icon: Icon(Icons.arrow_back)),
          )),
          Expanded(
            flex: 18,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
