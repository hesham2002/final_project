import 'package:flutter/material.dart';

class Animated3DCard extends StatefulWidget {
  final String coverImage;
  final String title;
  const Animated3DCard({
    super.key,
    required this.coverImage,
    required this.title,
  });

  @override
  Animated3DCardState createState() => Animated3DCardState();
}

class Animated3DCardState extends State<Animated3DCard>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      lowerBound: 0.0,
      upperBound: 0.7,
      value: 0.0,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isHovered = !isHovered;
              if (isHovered) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            });
          },
          onHover: (hovered) {
            setState(() {
              isHovered = hovered;
              if (isHovered) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            });
          },
          child: Container(
            width: 250,
            height: 250,
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.75),
                        blurRadius: 32,
                        offset: const Offset(2, 35),
                      ),
                    ]
                  : [],
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.0001)
                      ..rotateX(_controller.value * -1),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(widget.coverImage),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          const Color(0xFF0C0D13).withOpacity(0.5),
                          const Color(0xFF0C0D13),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: isHovered ? 120 : 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          const Color(0xFF0C0D13).withOpacity(0.5),
                          const Color(0xFF0C0D13),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
