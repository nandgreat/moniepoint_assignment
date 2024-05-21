import 'package:flutter/cupertino.dart';


class GrowUpAnimationWidget extends StatefulWidget {
  const GrowUpAnimationWidget({
    Key? key,
    this.child,
    required this.start,required this.end
  }) : super(key: key);
  final Widget? child;
  final double start;
  final double end;

  @override
  State<GrowUpAnimationWidget> createState() => _GrowUpAnimationWidgetState();
}

class _GrowUpAnimationWidgetState extends State<GrowUpAnimationWidget> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  double initialValue = 0;

  @override
  void initState() {
    _controller.forward();

    initialValue = widget.start;

    Future.delayed(Duration(milliseconds: 500), () {
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
    return AnimatedSize(duration: const Duration(milliseconds: 1000), curve: Curves.easeIn, child: Container(
        height: initialValue,
        child: widget.child));
  }
}
