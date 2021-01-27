import 'package:flutter/material.dart';
import 'package:my_personal_portfolio/theme.dart';

class CollapsingProfile extends StatefulWidget {
  String title;
  String pictureUrl =
      "https://avatars.githubusercontent.com/u/31430556?s=460&u=198043f53b6685a3e3cb4465a73342444d838f3d&v=4";
  AnimationController animationController;

  CollapsingProfile({this.title, @required this.animationController});

  @override
  _CollapsingProfileState createState() => _CollapsingProfileState();
}

class _CollapsingProfileState extends State<CollapsingProfile> {
  Animation<double> widthAnim;
  Animation<double> pictureSizeAnim;

  @override
  void initState() {
    super.initState();
    widthAnim = new Tween<double>(begin: 250, end: 100)
        .animate(widget.animationController);
    pictureSizeAnim = new Tween<double>(begin: 50, end: 25)
        .animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthAnim.value,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: pictureSizeAnim.value + 2,
            child: CircleAvatar(
              radius: pictureSizeAnim.value,
              backgroundImage: new NetworkImage(widget.pictureUrl),
            ),
          ),
          (widthAnim.value > 220)
              ? SizedBox(
                  width: 20,
                )
              : SizedBox(),
          (widthAnim.value > 200)
              ? Text(
                  widget.title,
                  style: listTitleDefaultStyle,
                )
              : new Container(),
        ],
      ),
    );
  }
}
