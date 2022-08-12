import '../utils/export.dart';

class SedesColoniaScreen extends StatefulWidget {
  const SedesColoniaScreen({Key? key}) : super(key: key);

  @override
  _SedesColoniaScreenState createState() => _SedesColoniaScreenState();
}

class _SedesColoniaScreenState extends State<SedesColoniaScreen> {

  FirebaseFirestore db = FirebaseFirestore.instance;

  List _allResults=[];

  _data()async{
    var data = await db.collection("cologne").orderBy("time").get();

    setState(() {
      _allResults = data.docs;
      print(_allResults.length);
    });
  }

  @override
  void initState() {
    super.initState();
    _data();
  }


  @override
  Widget build(BuildContext context) {

    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    return Stack(
        children: [
          Container(color: PaletteColor.white,
              height:height,
              width: width
          ),
          Image.asset(
            "assets/image/background_home.png",
            alignment: Alignment.topCenter,
            height: height*0.3,
            width: width,
            fit: BoxFit.fitWidth,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            drawer: DrawerCustom(),
            appBar: AppBarCustom(),
            body: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: PaletteColor.white,
              ),
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(16),
              child: Column(
                children: [
                  TitleCustomWidget(
                    text: 'Sedes da Colônia',
                  ),
                  Container(
                    height: height*0.65,
                    child: ListView.builder(
                      itemCount: _allResults.length,
                      itemBuilder: (BuildContext context,int index){
                        DocumentSnapshot item = _allResults[index];

                        return ContainerContactsWidget(
                          location: item['institution'],
                          address: item['address'],
                          phone: item['phone'],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
    );
  }
}
