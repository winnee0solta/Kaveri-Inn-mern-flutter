import '../index.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String about =
      "KAVERI Inn is an exquisite form of art in the form of hospitality , as delicately painted, crafted and nurtured as a Picasso painting. Standing tall in the busy yet sublime location of the Gyaneshwor, right next to jain mandir, and in theneighbourhood of Lord pashupatinath , Kathmandu durbar square, King’s Way, Thamel and city centre, Kaveri inn provides with a perfect blend of high end amenities to all sets of guests: Business to spiritual. Run by the team of more than 20 years of hospitality experience in Nepal and abroad, kaveri inn is a post modern infrastructure dedicated deeply to eastern values, providing cruise like facilities without leaving a hole in your pocket.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppbar(context),
      drawer: mainDrawer(context),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/img_1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Card(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Center(
                    child: Text(
                  'About Us',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    about,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
