import '../index.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:dio/dio.dart';

class RoomBookScreen extends StatefulWidget {
  final room;
  RoomBookScreen({Key key, @required this.room}) : super(key: key);

  @override
  _RoomBookScreenState createState() => _RoomBookScreenState();
}

class _RoomBookScreenState extends State<RoomBookScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    phonecontroller.dispose();
    super.dispose();
  }

  var checkindate;
  var checkoutdate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Booking Information',
                          style: TextStyle(fontSize: 30.0),
                        ),
                      ),

                      SizedBox(
                        height: 30.0,
                      ),

                      // Name
                      TextField(
                        controller: namecontroller,
                        decoration: InputDecoration(
                          filled: true,
                          // fillColor: fieldColor,
                          hintText: 'Name',
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

                      // Phone
                      TextField(
                        controller: phonecontroller,
                        decoration: InputDecoration(
                          filled: true,
                          // fillColor: fieldColor,
                          hintText: 'Phone',
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
                      //check in time
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(checkindate == null
                            ? 'Booking Date Time : None'
                            : "Booking Date Time : ${checkindate}"),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      //button
                      MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () {
                          DatePicker.showDateTimePicker(context,
                              showTitleActions: true, onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');

                            setState(() {
                              checkindate = date;
                            });
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            ' Add Booking Date Time ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 40.0,
                      // ),
                      // //check out time
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10.0),
                      //   child: Text(checkoutdate == null
                      //       ? 'Check Out Time : None'
                      //       : "Check Out Time : ${checkoutdate}"),
                      // ),
                      // SizedBox(
                      //   height: 30.0,
                      // ),
                      // //button
                      // MaterialButton(
                      //   minWidth: double.infinity,
                      //   onPressed: () {
                      //     DatePicker.showDateTimePicker(context,
                      //         showTitleActions: true, onChanged: (date) {
                      //       print('change $date');
                      //     }, onConfirm: (date) {
                      //       print('confirm $date');

                      //       setState(() {
                      //         checkoutdate = date;
                      //       });
                      //     },
                      //         currentTime: DateTime.now(),
                      //         locale: LocaleType.en);
                      //   },
                      //   color: Theme.of(context).primaryColor,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(15.0),
                      //     child: Text(
                      //       ' Add Check Out Time ',
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 18.0,
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      SizedBox(
                        height: 50.0,
                      ),

                      MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () {
                          _bookData();
                        },
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Continue Booking',
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
          ],
        ));
  }

  Future<void> _bookData() async {
    print(widget.room['_id']);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var name = namecontroller.text;
    var phone = phonecontroller.text;
    if (name == null || name == '') {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Add Name")));
      return;
    }
    if (phone == null || phone == '') {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Add Phone")));
      return;
    }
    if (checkindate == null) {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Add Booking Date Time")));
      return;
    }

    print(prefs.getString('token'));

    //continue booking

    var response = await http
        .post(ApiRoutes.bookroom + "/" + widget.room['_id'], headers: {
      'Accept': 'application/json',
      'authorization': prefs.getString('token'),
    }, body: {
      'user_id': prefs.getString('user_id'),
      'dateTime': checkindate.toString(),
      'name': name.toString(),
      'phone': phone.toString(),
    });

    print('Response body: ${response.body}');
    var data = json.decode(response.body);

    if (response.statusCode == 401) {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(data['message'].toString())));

      prefs.clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }

    if (data['success']) {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(data['message'].toString())));

      //go home
      //
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
  // Future<void> _bookData() async {
  //   print(widget.room['_id']);

  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   if (checkindate == null || checkoutdate == null) {
  //     _scaffoldKey.currentState
  //         .showSnackBar(SnackBar(content: Text("Add Check In / Out Time")));
  //     return;
  //   }
  //   print(prefs.getString('token'));

  //   //continue booking
  //   // var formData = FormData.fromMap({
  //   //   'checkin_date': 'checkindate',
  //   //   'checkout_date': checkoutdate,
  //   // });
  //   // var dio = Dio();
  //   // final response = await dio.post(
  //   //   ApiRoutes.bookroom + "/" + widget.room['_id'],
  //   //   data: formData,
  //   //   options: Options(
  //   //     headers: {
  //   //       'Accept': 'application/json',
  //   //       'authorization': prefs.getString('token'),
  //   //     },
  //   //   ),
  //   // );

  //   var response = await http
  //       .post(ApiRoutes.bookroom + "/" + widget.room['_id'], headers: {
  //     'Accept': 'application/json',
  //     'authorization': prefs.getString('token'),
  //   }, body: {
  //     'checkin_date': checkindate.toString(),
  //     'checkout_date': checkoutdate.toString(),
  //   });

  //   print('Response body: ${response.body}');
  //   var data = json.decode(response.body);

  //   if (response.statusCode == 401) {
  //     _scaffoldKey.currentState
  //         .showSnackBar(SnackBar(content: Text(data['message'].toString())));

  //     prefs.clear();
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => LoginScreen()),
  //     );
  //   }

  //   if (data['success']) {
  //     _scaffoldKey.currentState
  //         .showSnackBar(SnackBar(content: Text(data['message'].toString())));

  //     //go home
  //     //
  //     // navigate to
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomeScreen()),
  //     );
  //   } else {
  //     _scaffoldKey.currentState
  //         .showSnackBar(SnackBar(content: Text(data['message'].toString())));
  //     //
  //   }
  // }
}
