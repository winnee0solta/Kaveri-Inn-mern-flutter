import '../index.dart';
import 'package:http/http.dart' as http;

class RoomsHomeScreen extends StatefulWidget {
  RoomsHomeScreen({Key key}) : super(key: key);

  @override
  _RoomsHomeScreenState createState() => _RoomsHomeScreenState();
}

class _RoomsHomeScreenState extends State<RoomsHomeScreen> {
  List rooms = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppbar(context),
      drawer: mainDrawer(context),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: rooms.length,
        itemBuilder: _buildItemsForListView,
      ),
    );
  }

  Widget _buildItemsForListView(BuildContext context, int index) {
    var price = "\Nrs." + rooms[index]['price'].toString();
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
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: SmoothStarRating(
                            allowHalfRating: false,
                            onRated: (v) {},
                            starCount: 5,
                            rating: double.parse(
                                rooms[index]['avg_rating'].toString()),
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

  @override
  void initState() {
    super.initState();
    _populateData();
  }

  Future<void> _populateData() async {
    var response = await http
        .get(ApiRoutes.allrooms, headers: {'Accept': 'application/json'});

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      var data = json.decode(response.body);
      if(mounted)
      setState(() {
        rooms.clear();
        rooms = data['rooms'];
      });
      return data;
    } else {
      print('Request failed with status: ${response.reasonPhrase}.');
      throw Exception('Failed to login');
    }
  }
}
