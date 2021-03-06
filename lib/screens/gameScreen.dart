import 'package:fellonews/widgets/gamePagewidgets.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GamePage();
}

class _GamePage extends State<GamePage> with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    setState(() {
      _controller = AnimationController(
        duration: const Duration(milliseconds: 360),
        vsync: this,
      );
    });
  }

  void jump(AnimationController _controller) {
    return setState(() {
      if (!_controller.isAnimating) {
        _controller.forward().then((_) {
          _controller.reverse().then((_) {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: _height * 0.1,
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                    0,
                    Tween<double>(begin: 0, end: -120)
                        .animate(_controller)
                        .value),
                child: GamePageWidgets.gameObject(),
              );
            },
          ),
          SizedBox(
            height: _height * 0.1,
          ),
          InkWell(
            onTap: () {
              jump(_controller);
            },
            child: GamePageWidgets.jumpButton(_height, _width),
          )
        ],
      ),
    );
  }
}
