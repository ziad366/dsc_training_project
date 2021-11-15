import 'package:flutter/material.dart';

class SettingViewItem extends StatelessWidget {
  const SettingViewItem({Key? key, required this.text, required this.path})
      : super(key: key);

  final String text;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 25,
              color: Colors.orange,
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(path),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.orange,
            ),
          )
        ],
      ),
    );
  }
}
