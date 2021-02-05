import 'package:flutter/material.dart';

class ResizeInheritedWidget extends InheritedWidget {
  ResizeInheritedWidget({
    @required this.child,
    this.resizeBloc,
  });

  @override
  final Widget child;
  final ResizeBloc resizeBloc;

  static ResizeInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

class BuilderMaterialApp {
  static Widget resizeTablet(BuildContext context, Widget child) {
    return ResizeInheritedWidget(
      resizeBloc: ResizeBloc(),
      child: ResizeTable(
        child: child,
      ),
    );
  }
}

class ResizeBloc extends ChangeNotifier {
  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}

class ResizeTable extends StatelessWidget {
  const ResizeTable({Key key, this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    final _resizeBloc = ResizeInheritedWidget.of(context).resizeBloc;
    return AnimatedBuilder(
      animation: _resizeBloc,
      child: child,
      builder: (context, childAnimated) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          child: SetResizeTablet(
            child: childAnimated,
          ),
        );
      },
    );
  }
}

class SetResizeTablet extends StatelessWidget {
  SetResizeTablet({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    return FittedBox(
      fit: BoxFit.fill,
      child: Container(
        width: 411.0,
        height: 731.0,
        child: MediaQuery(
          data: _mediaQuery.copyWith(
            size: Size(411.0, 731.0),
            padding: EdgeInsets.zero,
            viewInsets: EdgeInsets.zero,
            viewPadding: EdgeInsets.zero,
            devicePixelRatio: 1.0,
          ),
          child: child,
        ),
      ),
    );
  }
}
