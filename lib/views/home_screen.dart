import '../utils/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(color: PaletteColor.white),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  "assets/image/icon_contacts.png",
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonCustomHomeGreen(
                      title: 'calendário do pescador',
                      image: 'assets/image/icon_calendar.png',
                    ),
                    ButtonCustomHomeGreen(
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
                      onTap: (){},
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
              Padding(
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
