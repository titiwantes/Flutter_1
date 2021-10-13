import 'package:flutter/material.dart';
import 'package:app/config/Colors.dart';

class SwitchButton extends StatefulWidget {

  final bool value;
  final ValueChanged<bool> onChanged;

  SwitchButton({
    Key? key,
    required this.value,
    required this.onChanged
  }) : super(key: key);

  @override
  _SwitchButton createState() => _SwitchButton();
}

class _SwitchButton extends State<SwitchButton> with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
        begin: widget.value ? Alignment.centerLeft : Alignment.centerRight,
        end: widget.value ? Alignment.centerRight :Alignment.centerLeft).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 55.0,
            height: 28.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: _circleAnimation.value ==
                  Alignment.centerLeft
                  ? PColors.green
                  : PColors.red,),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 0, right: 0, left: 0),
              child:  Container(
                alignment: widget.value
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Container(
                  width: 28.0,
                  height: 28.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(200, 221, 221, 221)),
                    shape: BoxShape.circle,
                    color: PColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(100, 0, 0, 0),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}