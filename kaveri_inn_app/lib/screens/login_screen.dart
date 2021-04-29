import '../index.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool logingin = false;
  final Color fieldColor = Color(0xffedeef3);
  final Color brandColor = Color(0xffb0a999);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 80.0,
              ),
              SizedBox(
                height: 100.0,
              ),
              //welcome back
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: <Widget>[
                    //email
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: fieldColor,
                        hintText: 'Email',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),

                    //password
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: fieldColor,
                        hintText: 'Password',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(
                      height: 45.0,
                    ),

                    //button
                    MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        _loginUser();
                      },
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          !logingin ? 'Login' : 'Please Wait..',
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
              SizedBox(
                height: 40.0,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text(
                  "Don\'t have account ? Register",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loginUser() async {
    var username = usernameController.text;
    var password = passwordController.text;
    if (username == '' || password == '') {
      //show snackbar
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('Empty Fields!')));
      return;
    }

    var response = await http.post(ApiRoutes.loginurl, headers: {
      'Accept': 'application/json'
    }, body: {
      'email': username,
      'password': password,
    });

    print('Response body: ${response.body}');
    var data = json.decode(response.body);

    if (data['success']) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user_id', data['user_id']);
      prefs.setString('email', data['email']);
      prefs.setString('token', data['token']);

      //go home
      // navigate to
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(data['message'].toString())));
      //
    }
  }
}
