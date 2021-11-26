import 'package:dsc_training_project/data.dart';
import 'package:flutter/material.dart';
import 'package:dsc_training_project/bloc_cubit/e_commerce_cubit.dart';

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
              color: orangeColor,
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed(path);
              text == 'Dark Mode'? ECommerceCubit.get(context).changeThme() : null;
            }
            child: Icon(
              Icons.arrow_forward_ios,
              color: orangeColor,
            ),
          )
        ],
      ),
    );
  }
}
