import 'package:flutter/material.dart';
import 'package:spacex/pages/home_page.dart';
import 'package:spacex/service/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ServiceProvider(
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
