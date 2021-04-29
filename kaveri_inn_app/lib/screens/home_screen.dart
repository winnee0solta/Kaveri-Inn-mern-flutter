import '../index.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List rooms = [];
  List halls = [];

  String aboutHotel =
      "Kaveri Inn is an exquisite form of art in the form of hospitality , as delicately painted, crafted and nurtured as a Picasso painting. Standing tall in the location of the Gyaneshwor, right next to jain mandir, and in the neighbourhood of Lord Pashupatinath , Kathmandu Durbar Square, King’s Way, Thamel and City Centre, Kaveri Inn provides with a perfect blend of high end amenities to all sets of guests: Business to spiritual. Run by the team of more than 20 years of hospitality experience in Nepal and abroad, Kaveri Inn is a post modern infrastructure dedicated deeply to eastern values, providing cruise like facilities without leaving a hole in your pocket.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppbar(context),
      drawer: mainDrawer(context),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/img_1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //about hotel
                Card(
                  // elevation: 0,
                  // color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          'About Kaveri Inn',
                          style: TextStyle(fontSize: 30.0),
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            aboutHotel,
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.black45),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                      child: Text('Rooms',
                          style:
                              TextStyle(fontSize: 30.0, color: Colors.white))),
                ),

                //rooms
                roomBuilder(context),
                //halls
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                      child: Text(
                    'Halls',
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  )),
                ),

                // hallsBuilder(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget roomBuilder(context) {
    List<Widget> roomsArr = [];

    for (var i = 0; i < rooms.length; i++) {
      // _buildItemsForListViewRoom(context,i);

      roomsArr.add(_buildItemsForListViewRoom(context, i));
    }

    return Column(
      children: roomsArr,
    );
  }

  Widget _buildItemsForListViewRoom(BuildContext context, int index) {
    var price = "\$" + rooms[index]['price'].toString();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                //img
                Image.network(
                  rooms[index]['room_image'],
                  height: 100,
                  width: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        rooms[index]['title'],
                        style: TextStyle(fontSize: 20.0, color: Colors.blue),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          price,
                          style: TextStyle(fontSize: 14.0, color: Colors.green),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 5.0),
                      //   child: SmoothStarRating(
                      //       allowHalfRating: false,
                      //       onRated: (v) {},
                      //       starCount: 5,
                      //       rating: double.parse(
                      //           rooms[index]['avg_rating'].toString()),
                      //       size: 20.0,
                      //       isReadOnly: true,
                      //       color: Colors.orange,
                      //       borderColor: Colors.orange,
                      //       spacing: 0.0),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RoomSingleScreen(room: rooms[index])),
                            );
                          },
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Text(
                              'View Room',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget hallsBuilder(context) {
    List<Widget> roomsArr = [];

    for (var i = 0; i < halls.length; i++) {
      // _buildItemsForListViewRoom(context,i);

      roomsArr.add(_buildItemsForListViewHall(context, i));
    }

    return Column(
      children: roomsArr,
    );
  }

  Widget _buildItemsForListViewHall(BuildContext context, int index) {
    var price = "\$" + halls[index]['price'].toString();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                //img
                Image.network(
                  halls[index]['hall_image'],
                  height: 100,
                  width: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        halls[index]['title'],
                        style: TextStyle(fontSize: 20.0, color: Colors.blue),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          price,
                          style: TextStyle(fontSize: 14.0, color: Colors.green),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: SmoothStarRating(
                            allowHalfRating: false,
                            onRated: (v) {},
                            starCount: 5,
                            rating: double.parse(
                                halls[index]['avg_rating'].toString()),
                            size: 20.0,
                            isReadOnly: true,
                            color: Colors.orange,
                            borderColor: Colors.orange,
                            spacing: 0.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HallsSingleScreen(hall: halls[index])),
                            );
                          },
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Text(
                              'View Room',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _populateDataRoom();
    // _populateDataHall();

    // _newUserPopup();

    //  showAlertDialog(context);
  }

  Future<void> _populateDataRoom() async {
    print("Fetching Room");
    var response = await http
        .get(ApiRoutes.homerooms, headers: {'Accept': 'application/json'});

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      var data = json.decode(response.body);
      setState(() {
        rooms.clear();
        rooms = data['rooms'];
      });
      return data;
    } else {
      print('Request failed with status: ${response.reasonPhrase}.');
      // throw Exception('Failed to login');
    }
  }

  Future<void> _populateDataHall() async {
    print("Fetching hall");
    var response = await http
        .get(ApiRoutes.homehalls, headers: {'Accept': 'application/json'});

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      var data = json.decode(response.body);
      setState(() {
        halls.clear();
        halls = data['halls'];
      });
      return data;
    } else {
      print('Request failed with status: ${response.reasonPhrase}.');
      // throw Exception('Failed to fetcxh');
    }
  }

  void _newUserPopup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print(prefs.getString('user_id'));
    if (prefs.getString('user_id') != null &&
        prefs.getString('email') != null) {
      print("show banner");
      //loggedin
      if (prefs.getBool('shown_banner') == null) {
        //show banner
        _showAlert(context, prefs.getString('email'));
      } else {
        if (!prefs.getBool('shown_banner')) {
          //show banner
          _showAlert(context, prefs.getString('email'));
        }
      }

      //set show_banner tru
      //  prefs.setBool('shown_banner',true);
    }
  }
}

void _showAlert(BuildContext context, email) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Center(
              child: Text(
                "Hi There! ${email} please try our varieties of rooms and halls available !! ",
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/img_3.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: MaterialButton(
                    minWidth: 150.0,
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      prefs.setBool('shown_banner', true);
                      Navigator.of(context).pop();
                    },
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Sure',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
}
