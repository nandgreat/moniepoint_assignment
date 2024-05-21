import 'package:flutter/cupertino.dart';


class SlideInAnimationWidget extends StatefulWidget {
  const SlideInAnimationWidget({
    Key? key,
    this.child,
    this. delay = const Duration(milliseconds: 200)
  }) : super(key: key);
  final Widget? child;
  final Duration? delay;

  @override
  State<SlideInAnimationWidget> createState() => _SlideInAnimationWidgetState();
}

class _SlideInAnimationWidgetState extends State<SlideInAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController animation;
  late Animation<Offset> offset;

  @override
  void initState() {
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    offset = Tween<Offset>(begin: const Offset(0.0, 2.0,), end: const Offset(0.0, 0.0,))
        .animate(animation);

    Future.delayed(widget.delay!, (){
      animation.forward();

    });

    super.initState();
  }

  @override
  void dispose() {
    animation!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: offset, child: widget.child);
  }
}
