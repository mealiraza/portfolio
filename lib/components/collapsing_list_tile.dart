import 'package:flutter/material.dart';
import 'package:my_personal_portfolio/theme.dart';

class CollapsingListTile extends StatefulWidget {
  String title;
  IconData icon;
  AnimationController animationController;
  bool isSelected = false;
  Function onTap;

  CollapsingListTile(
      {this.isSelected,
      this.onTap,
      this.title,
      this.icon,
      @required this.animationController});

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  Animation<double> widthAnim;

  @override
  void initState() {
    super.initState();
    widthAnim = new Tween<double>(begin: 250, end: 85)
        .animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: widget.isSelected
              ? Colors.transparent.withOpacity(0.3)
              : Colors.transparent,
        ),
        width: widthAnim.value,
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: (widthAnim.value < 100)
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              Icon(
                widget.icon,
                color: widget.isSelected ? selectedColor : Colors.white30,
                size: 38,
              ),
              SizedBox(
                width: (widthAnim.value < 100 ? 0 : 20),
              ),
              (widthAnim.value > 180)
                  ? Text(
                      widget.title,
                      style: (widget.isSelected)
                          ? listTitleSelectedStyle
                          : listTitleDefaultStyle,
                    )
                  : new Container(),
            ],
          ),
        ),
      ),
    );
  }
}
