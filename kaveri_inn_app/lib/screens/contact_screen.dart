import '../index.dart';

class ContactScreen extends StatefulWidget {
  ContactScreen({Key key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppbar(context),
      drawer: mainDrawer(context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/img_1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Center(
                  child: Text('Contact Us',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Center(
                    child: Text(
                  'Pashupati Marga Gyaneshwor, \n Kathmandu, Nepal',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Center(
                    child: Text(
                  ' +977-01-4522103',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Center(
                    child: Text(
                  'info@kaveriinn.com',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                )),
              ),
              // contactForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget contactForm() {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Get in touch',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    // fillColor: fieldColor,
                    hintText: 'Name',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    // fillColor: fieldColor,
                    hintText: 'Phone ',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  minLines: 5,
                  maxLines: 5,
                  decoration: InputDecoration(
                    filled: true,
                    // fillColor: fieldColor,
                    hintText: 'Message ',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              //button
              MaterialButton(
                minWidth: double.infinity,
                onPressed: () {
                  // if (!logingin) _loginUser();
                },
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    ' Send ',
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
    );
  }
}
