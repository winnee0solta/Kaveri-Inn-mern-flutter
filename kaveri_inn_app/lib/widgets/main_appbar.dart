import 'package:kaveri_inn_app/screens/profile_screen.dart';

import '../index.dart';

Widget mainAppbar(context) {
  return AppBar(title: Text('Kaveri Inn'), actions: <Widget>[
    IconButton(
        icon: Icon(Icons.face),
        onPressed: () {
          print("navigate");
          // navigate to
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        }),
  ]);
}
