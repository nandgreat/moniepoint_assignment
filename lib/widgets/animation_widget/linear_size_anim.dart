import 'package:flutter/cupertino.dart';

class GrowToRightAnimationWidget extends StatefulWidget {
  const GrowToRightAnimationWidget(
      {Key? key,
      this.child,
      this.delay = const Duration(milliseconds: 200),
      required this.start,
      required this.end})
      : super(key: key);
  final Widget? child;
  final double start;
  final double end;
  final Duration? delay;

  @override
  State<GrowToRightAnimationWidget> createState() =>
      _GrowToRightAnimationWidgetState();
}

class _GrowToRightAnimationWidgetState extends State<GrowToRightAnimationWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  double initialValue = 0;

  @override
  void initState() {
    _controller.forward();

    initialValue = widget.start;

    Future.delayed(widget.delay!, () {
      setState(() {
        initialValue = widget.end;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.linear,
        child: Container(width: initialValue, child: widget.child));
  }
}
