import '../index.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userid;
  var email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.home, color: Colors.white),
          onPressed: () {
            //pop screens untill splash screen is 1st screen
            Navigator.of(context).popUntil((route) => route.isFirst);
            //Home route
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: userid != null
          ? SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "User Id : ${userid.toString()}",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        "Email : ${email.toString()}",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      MaterialButton(
                        minWidth: 200.0,
                        onPressed: () {
                          _logoutUser();
                        },
                        color: Colors.redAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : SizedBox(),
    );
  }

  @override
  void initState() {
    super.initState();
    _checkIfAuthenticated();
  }

  Future<void> _checkIfAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print(prefs.getString('user_id'));
    if (prefs.getString('user_id') != null &&
        prefs.getString('email') != null) {
      //logged in
      //
      setState(() {
        userid = prefs.getString('user_id');
        email = prefs.getString('email');
      });
    } else {
      //go to login page

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  void _logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
