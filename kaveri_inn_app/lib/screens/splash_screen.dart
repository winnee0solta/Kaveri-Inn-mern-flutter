import '../index.dart';

//splash screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Kaveri Inn',
                style: TextStyle(
                    fontSize: 35.0, color: Theme.of(context).accentColor),
              ),
              SizedBox(
                height: 20.0,
              ),
              CircularProgressIndicator()
            ],
          )),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    checkIfAuthenticated();
  }

  //check auth
  void checkIfAuthenticated() async {
    //pop screens untill splash screen is 1st screen
    Navigator.of(context).popUntil((route) => route.isFirst);
    //check if authenticated
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
