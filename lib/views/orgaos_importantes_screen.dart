import '../utils/export.dart';

class OrgaosImportantesScreen extends StatefulWidget {
  const OrgaosImportantesScreen({Key? key}) : super(key: key);

  @override
  _OrgaosImportantesScreenState createState() => _OrgaosImportantesScreenState();
}

class _OrgaosImportantesScreenState extends State<OrgaosImportantesScreen> {

  FirebaseFirestore db = FirebaseFirestore.instance;

  List _allResults=[];

  _data()async{
    var data = await db.collection("governament").orderBy("time").get();

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
                    text: 'Órgãos importantes',
                  ),
                  Container(
                    height: height*0.65,
                    child: ListView.builder(
                      itemCount: _allResults.length,
                      itemBuilder: (BuildContext context,int index){
                        DocumentSnapshot item = _allResults[index];

                        return ContainerContactsCompleteWidget(
                          location: '${item['institution']} | ${item['management']}',
                          description: '',
                          name: '${item['name']} | ${item['office']}',
                          email: item['email'],
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
