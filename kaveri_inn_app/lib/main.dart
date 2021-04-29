import 'package:kaveri_inn_app/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Kaveri Inn',
      theme: ThemeData(
        primaryColor: Color(0xFF0061a8), //#0061a8
        accentColor: Color(0xFFf4eee8),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: SplashScreen(),
      home: HomeScreen(),
    );
  }
}
