import '../index.dart';

Widget mainDrawer(context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        // DrawerHeader(
        //   child: Text('Drawer Header'),
        //   decoration: BoxDecoration(
        //     color: Colors.blue,
        //   ),
        // ),
        SizedBox(
          height: 50.0,
        ),
        ListTile(
          title: Text('Home'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        ListTile(
          title: Text('Rooms'),
          onTap: () {
            //navigate to
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => RoomsHomeScreen()),
            );
          },
        ),
        ListTile(
          title: Text('Halls'),
          onTap: () {
            //navigate to
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HallsHomeScreen()),
            );
          },
        ),
        ListTile(
          title: Text('About Us'),
          onTap: () {
            //navigate to
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AboutScreen()),
            );
          },
        ),
        ListTile(
          title: Text('Contact Us'),
          onTap: () {
            //navigate to
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ContactScreen()),
            );
          },
        ),
      ],
    ),
  );
}
