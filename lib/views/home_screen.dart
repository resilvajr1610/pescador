import '../utils/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  FirebaseFirestore db = FirebaseFirestore.instance;
  var _controllerData = StreamController<QuerySnapshot>.broadcast();
  late int idUsuario;
  late int idFirebase;
  late int idUserFire;
  late int idPrefs;
  List _listFavorites = [];
  bool visibleFavorites=false;

  readId(){
    idUsuario = context.watch<AppSettings>().idUsuario;
    print('tttt == $idUsuario');
  }

  dataFavoriteUser() async {
    var data = await db.collection("users").doc(idUsuario.toString()).collection('favorites').get();

    setState(() {
      _listFavorites = data.docs;

      print('tenm : ${_listFavorites.length}');
    });
    return "complete";
  }

  dataFirebase()async{
    DocumentSnapshot snapshot = await db.collection("ids").doc('ids').get();

    Map<String,dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    idFirebase = data?["id"];
    print('fire === $idFirebase');

    dataUsers();
    dataFavoriteUser();
  }

  dataUsers()async{

    if(idUsuario!=0){
      DocumentSnapshot snapshot = await db.collection("users").doc(idUsuario.toString()).get();
      Map<String,dynamic>? data = snapshot.data() as Map<String, dynamic>?;
      idUserFire = data?["id"];

      print('user === $idUserFire');
    }else{
      int newUser = idFirebase+1;
      context.read<AppSettings>().setId(newUser);

      db.collection("users").doc(newUser.toString())
          .set({
        "id": newUser,
      }).then((_) =>   db.collection("ids").doc('ids').set({
        "id": newUser,
      }));
    }
  }

  deleteFavorite(String id)async{
    db.collection("users").doc(idUsuario.toString()).collection('favorites').doc(id).delete().then((_){
      setState(() {
        dataFavoriteUser();
      });
    });
  }

  _showDialog(String answer) {
    showDialog(
        context: context,
        builder: (context) {
          return ShowDialogAnswer(
              text: answer
          );
        });
  }

  @override
  void initState() {
    super.initState();
    dataFirebase();
  }

  @override
  Widget build(BuildContext context) {

    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    readId();

    return Stack(
      children: [
        Container(color: PaletteColor.white,
          height:height,
          width: width),
        Image.asset(
          "assets/image/background_home.png",
          height: height*0.8,
          width: width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          drawer: DrawerCustom(),
          appBar: AppBarCustom(),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonCustomHomeGreen(
                      onTap: ()=>Navigator.pushNamed(context, '/calendario'),
                      title: 'calendário do pescador',
                      image: 'assets/image/icon_calendar.png',
                    ),
                    ButtonCustomHomeGreen(
                      onTap: ()=>Navigator.pushNamed(context, '/orgaos'),
                      title: 'orgãos importantes',
                      image: 'assets/image/icon_brazil.png',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonCustomHomeWhite(
                      onTap: ()=>Navigator.pushNamed(context, '/trabalho'),
                      title: 'Onde\ntrabalho',
                      image: 'assets/image/icon_work.png',
                    ),
                    ButtonCustomHomeWhite(
                      onTap: ()=>Navigator.pushNamed(context, '/eu'),
                      title: 'Eu,\npescador',
                      image: 'assets/image/icon_fisherman.png',
                    ),
                    ButtonCustomHomeWhite(
                      onTap: ()=>Navigator.pushNamed(context, '/direitos'),
                      title: 'Meus\ndireitos',
                      image: 'assets/image/icon_boat.png',
                    ),
                    ButtonCustomHomeWhite(
                      onTap: ()=>Navigator.pushNamed(context, '/deveres'),
                      title: 'Meus\ndeveres',
                      image: 'assets/image/icon_duties.png',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Card(
                  elevation:3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        height: 50,
                        width: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            tileMode: TileMode.repeated,
                            colors: [
                              PaletteColor.normalGreenHome,
                              PaletteColor.lightGreenHome
                            ],
                            stops: [0.0, 0.6],
                          ),
                        ),
                      ),
                      Text('pergunta frequente',
                        style: TextStyle(
                            color: PaletteColor.blueTitle,
                            fontSize: 14,
                            fontFamily: 'Barlow',
                            fontWeight: FontWeight.w600
                        ),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(visibleFavorites==false){
                      visibleFavorites=true;
                    }else{
                      visibleFavorites=false;
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36,vertical: 5),
                  child: Card(
                    elevation:3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              tileMode: TileMode.repeated,
                              colors: [
                                PaletteColor.normalGreenHome,
                                PaletteColor.lightGreenHome
                              ],
                              stops: [0.0, 0.6],
                            ),
                          ),
                          child: Icon(Icons.favorite,color: Colors.white,size: 40,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('pergunta frequente',
                            style: TextStyle(
                                color: PaletteColor.blueTitle,
                                fontSize: 14,
                                fontFamily: 'Barlow',
                                fontWeight: FontWeight.w600
                            ),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: visibleFavorites,
                child: Container(
                  height: _listFavorites.length==0?height * 0.17: height * 0.17*_listFavorites.length,
                  child: StreamBuilder(
                    stream: _controllerData.stream,
                    builder: (context, snapshot) {
                      if(snapshot.hasError)
                        return Text("Erro ao carregar dados!");

                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.active:
                        case ConnectionState.waiting:
                        case ConnectionState.done:
                          if (_listFavorites.length == 0) {
                            return Center(
                                child: Text('Sem Perguntas favoritas!', style: TextStyle(
                                    color: PaletteColor.searchGreen,
                                    fontSize: 20),)
                            );
                          } else {
                            return ListView.builder(
                                itemCount: _listFavorites.length,
                                itemBuilder: (BuildContext context, index) {
                                  DocumentSnapshot item = _listFavorites[index];

                                  String id = item["idQuestion"];
                                  String question = item["question"];
                                  String answer = item["answer"];

                                  return GestureDetector(
                                    onTap:()=> _showDialog(answer),
                                    child: ButtonCustomQuestion(
                                      onTapFavorite: ()=> deleteFavorite(id),
                                      iconFavorite: true,
                                      question: question,
                                    ),
                                  );
                                });
                          }
                      }
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: ()=>Navigator.pushNamed(context, '/fala'),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 35,vertical: 5),
                    child: Image.asset('assets/image/botton_home.png')
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
