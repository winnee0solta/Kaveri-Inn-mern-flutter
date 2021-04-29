import 'package:kaveri_inn_app/screens/hall_book_screen.dart';

import '../index.dart';

class HallsSingleScreen extends StatefulWidget {
  final hall;
  HallsSingleScreen({Key key, @required this.hall}) : super(key: key);

  @override
  _HallsSingleScreenState createState() => _HallsSingleScreenState();
}

class _HallsSingleScreenState extends State<HallsSingleScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                widget.hall['hall_image'],
                // height: 350,
                // width: 350,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.hall['title'],
                        style: TextStyle(fontSize: 30.0, color: Colors.brown),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.hall['availability']
                                ? "Availability: Available"
                                : "Availability: Unavailable",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                          ),
                          Text(
                            "Price:  Nrs. ${widget.hall['price']}",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                          ),
                          Text(
                            "Description: ${widget.hall['description']}",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: SmoothStarRating(
                                allowHalfRating: false,
                                onRated: (v) {},
                                starCount: 5,
                                rating: double.parse(
                                    widget.hall['avg_rating'].toString()),
                                size: 25.0,
                                isReadOnly: true,
                                color: Colors.orange,
                                borderColor: Colors.orange,
                                spacing: 0.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: MaterialButton(
                              onPressed: () async {
                                //check if logged in
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();

                                print(prefs.getString('user_id'));
                                if (prefs.getString('user_id') == null &&
                                    prefs.getString('email') == null) {
                                  //not logged in
                                  _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                          content: Text("Log in to Book")));
                                  return;
                                }

                                //booking page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HallBookScreen(hall: widget.hall)),
                                );
                              },
                              color: Colors.green[900],
                              minWidth: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  'Book Hall',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "For online payment/rating use the web application.",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue,
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
