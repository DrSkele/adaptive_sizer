import 'package:adaptive_sizer/adaptive_sizer/adaptive_sizer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveSizeBuilder(
      referenceSize: Size(360, 640),
      builder: (context) => MaterialApp(
        home: Scaffold(
          body: Center(
            child: Container(
              width: 360.w,
              height: 640.h,
              color: Colors.amber,
              child: Text(
                'Hello World!',
                style: TextStyle(fontSize: 16.dp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
