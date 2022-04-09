import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:vil_editor/src/features/main/main_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: FlexColorScheme.dark(
          blendLevel: 20,
          scheme: FlexScheme.amber,
          fontFamily: 'JetBrainsMono',
        ).toTheme.copyWith(
              scrollbarTheme: ScrollbarThemeData(
                isAlwaysShown: true,
                thickness: MaterialStateProperty.all(0),
                thumbColor: MaterialStateProperty.all(Colors.transparent),
                radius: const Radius.circular(10),
                minThumbLength: 0,
              ),
            ),
        builder: (context, child) => ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: child!,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
