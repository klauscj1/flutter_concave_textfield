import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';

class InnerShadowText extends StatelessWidget {
  static final backgroundInputDark = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    gradient: LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          Color(0xff2C333A),
          Color(0xff121416),
          Color(0xff1C1E22),
        ],
        stops: [
          -.7157,
          -.7156,
          .2861
        ]),
  );

  const InnerShadowText({Key key, this.height = 46, this.width = 280})
      : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        InnerShadow(
          blur: 5,
          color: const Color(0xFF070709),
          offset: const Offset(2, 2),
          child: Container(
            decoration: backgroundInputDark,
            height: height,
            width: width,
          ),
        ),
        Container(
          width: width,
          height: height,
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.transparent,
              filled: true,
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    Key key,
    this.blur = 10,
    this.color = Colors.black38,
    this.offset = const Offset(10, 10),
    Widget child,
  }) : super(key: key, child: child);

  final double blur;
  final Color color;
  final Offset offset;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final _RenderInnerShadow renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderInnerShadow renderObject) {
    renderObject
      ..color = color
      ..blur = blur
      ..dx = offset.dx
      ..dy = offset.dy;
  }
}

class _RenderInnerShadow extends RenderProxyBox {
  double blur;
  Color color;
  double dx;
  double dy;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final Rect rectOuter = offset & size;
    final Rect rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width,
      size.height,
    );
    final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
    context.paintChild(child, offset);
    final Paint shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(sigmaX: blur, sigmaY: blur)
      ..colorFilter = ColorFilter.mode(color, BlendMode.srcOut);

    canvas
      ..saveLayer(rectOuter, shadowPaint)
      ..saveLayer(rectInner, Paint())
      ..translate(dx, dy);
    context.paintChild(child, offset);
    context.canvas..restore()..restore()..restore();
  }
}
