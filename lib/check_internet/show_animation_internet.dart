import 'package:currency/check_internet/show_network_loss.dart';
import 'package:flutter/material.dart';
class AnimationNoInternet extends StatefulWidget {
  final Function() onClick;

  const AnimationNoInternet({super.key, required this.onClick});
  @override
  _AnimationNoInternetState createState() => _AnimationNoInternetState();
}

class _AnimationNoInternetState extends State<AnimationNoInternet> with TickerProviderStateMixin {

  AnimationController ?animationController;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this)..addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        animationController!.reverse();
      }

      if(status == AnimationStatus.dismissed) {
        animationController!.forward();
      }
    });

    animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget ?child) {
          return ErrorContent(controller: animationController!,onClick: widget.onClick,);
        }
    );
  }
}
