import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gyroscope_animation/screen/home_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      );
    });
  }
}





// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   static const _interval = 0.02;
//   static const _backgroundScale = 1.2;
//   static const _backgroundMoveOffsetScale = 0.7;
//   static const _maxAngle = 120;
//   static const _maxForegroundMove = Offset(80, 80);
//   static const _inititalForegroundOffset = Offset(400, 30);
//   static const _inititalBackgroundOffset = Offset(0, 0);

//   Offset _foregroundOffset = _inititalForegroundOffset;
//   Offset _backgroundOffset = _inititalBackgroundOffset;
//   late StreamSubscription<sensors.GyroscopeEvent> _streamGyrpscopeEvent;

//   @override
//   void initState() {
//     // _streamGyrpscopeEvent =
//     //     sensors.gyroscopeEvents.listen((_listenGyroscopeEvent));
//     super.initState();
//   }

//   void _listenGyroscopeEvent(sensors.GyroscopeEvent event) {
//     // print(" X : ${event.x}");
//     // print(" Y : ${event.y}");
//     final angle = Offset(
//       event.x * _interval * 180 / pi,
//       event.y * _interval * 180 / pi,
//     );

//     print(angle);
//     if (angle.dx >= _maxAngle || angle.dy >= _maxAngle) {
//       return;
//     }

//     final addForegroundOffset = Offset(
//       angle.dx / _maxAngle * _maxForegroundMove.dx * 4,
//       angle.dy / _maxAngle * _maxForegroundMove.dy * 4,
//     );

//     // final addForegroundOffset = Offset(0, 0);

//     final newForegroundOffse = _foregroundOffset + addForegroundOffset;

//     if (newForegroundOffse.dx >=
//             _inititalForegroundOffset.dx + _maxForegroundMove.dx ||
//         newForegroundOffse.dx <=
//             _inititalForegroundOffset.dx - _maxForegroundMove.dx ||
//         newForegroundOffse.dy >=
//             _inititalForegroundOffset.dy + _maxForegroundMove.dy ||
//         newForegroundOffse.dy <=
//             _inititalForegroundOffset.dy - _maxForegroundMove.dy) {
//       return;
//     }

//     setState(() {
//       _foregroundOffset = _foregroundOffset + addForegroundOffset;
//       _backgroundOffset =
//           _backgroundOffset - addForegroundOffset * _backgroundMoveOffsetScale;
//     });
//   }

//   @override
//   void dispose() {
//     _streamGyrpscopeEvent.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: GyroscopeEffect.builder(
//         maxMovableDistance: 20,
//         // offsetMultiplier: 2,
//         child: _buildMiddleText,
//         childBuilder: (context, offset, child) {
//           return Stack(
//             fit: StackFit.expand,
//             children: [
//               TweenAnimationBuilder(
//                 tween: Tween<Offset>(begin: Offset.zero, end: offset),
//                 duration: const Duration(milliseconds: 300),
//                 curve: Curves.easeOutBack,
//                 builder: (context, Offset offset, child) {
//                   return Transform.translate(
//                     offset: -offset / 2,
//                     child: child,
//                   );
//                 },
//                 child: Transform.scale(
//                   scale: _backgroundScale,
//                   child: _buildBackgroundImage(size),
//                 ),
//               ),
//               TweenAnimationBuilder(
//                 tween: Tween<Offset>(begin: Offset.zero, end: offset),
//                 duration: const Duration(milliseconds: 300),
//                 curve: Curves.easeOutBack,
//                 builder: (context, Offset offset, child) {
//                   return Transform.translate(
//                     offset: -offset * 0.8,
//                     child: child,
//                   );
//                 },
//                 child: Transform.scale(
//                   scale: 1,
//                   child: _buildEffect(size),
//                 ),
//               ),
//               // Positioned(
//               //   top: _foregroundOffset.dx - _inititalForegroundOffset.dx,
//               //   left: _foregroundOffset.dy - _inititalForegroundOffset.dy,
//               //   child: Transform.scale(
//               //     scale: 1,
//               //     child: _buildEffect(size),
//               //   ),
//               // ),
//               TweenAnimationBuilder(
//                 tween: Tween<Offset>(begin: Offset.zero, end: offset),
//                 duration: const Duration(milliseconds: 300),
//                 curve: Curves.easeOutBack,
//                 builder: (context, offset, child) {
//                   return Transform.translate(
//                       offset: -offset * 1.5, child: child);
//                 },
//                 child: Transform.scale(
//                   scale: 0.5,
//                   child: _buildHalloween,
//                 ),
//               ),
//               Positioned(
//                 top: 160,
//                 right: 16,
//                 child: child!,
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget get _buildMiddleText => const Text(
//         '3D効果は\nユーザにどのような影響を\n与えるのだろう...',
//         style: TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.w700,
//           fontSize: 22,
//         ),
//       );

//   Widget _buildBackgroundImage(Size size) => Image.asset(
//         'assets/background.png',
//         fit: BoxFit.fitWidth,
//         height: size.height,
//         width: size.width,
//       );

//   Widget get _buildHalloween => Image.asset(
//         'assets/halloween.png',
//         height: 150,
//         width: 150,
//       );

//   Widget _buildEffect(Size size) => Image.asset(
//         'assets/effect.png',
//         height: size.height,
//         width: size.width,
//         fit: BoxFit.fitHeight,
//       );
// }
