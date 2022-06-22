import '../utils/export.dart';

class SobreScreen extends StatefulWidget {
  const SobreScreen({Key? key}) : super(key: key);

  @override
  _SobreScreenState createState() => _SobreScreenState();
}

class _SobreScreenState extends State<SobreScreen> {
  @override
  Widget build(BuildContext context) {

    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    return Stack(
        children: [
          Container(
              color: PaletteColor.blueBackground,
              height:height,
              width: width
          ),
          Image.asset(
            "assets/image/background_home.png",
            alignment: Alignment.topCenter,
            height: height*0.6,
            width: width,
            fit: BoxFit.fitWidth,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            drawer: DrawerCustom(),
            appBar: AppBarCustom(),
            body: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
              ),
              margin: EdgeInsets.all(16),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: PaletteColor.white,
                ),
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TitleCustomWidget(
                        text: 'Sobre',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Este aplicativo provê acesso às informações de utilidade pública no interesse da comunidade de pescadores artesanais na Amazônia brasileira.\n\nÉ uma tecnologia aberta e de domínio público construída em rede pelos colaboradores do Instituto Fronteiras, do Coletivo Proteja, da WCS Brasil, da Colônia de Pescadores Artesanais Z1 de Cruzeiro do Sul/AC e por pesquisadores do Grupo de Pesquisa Fronteiras Regenerativas na Amazônia, da Universidade Federal do Acre, Campus Floresta.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Barlow',
                            fontSize: 14,
                            color: PaletteColor.greyTitle
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: width,
                        child: Text('REALIZAÇÃO',style: TextStyle(
                          fontFamily: 'Barlow',
                          fontWeight: FontWeight.w700,
                          color: PaletteColor.blueText,
                          fontSize: 12.0
                        ),),
                      ),
                      Container(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/image/realizacao1.png",
                              alignment: Alignment.topCenter,
                              height: 60,
                              width: width*0.2,
                              fit: BoxFit.fitWidth,
                            ),
                            Image.asset(
                              "assets/image/realizacao2.png",
                              alignment: Alignment.topCenter,
                              height: 60,
                              width: width*0.2,
                              fit: BoxFit.fitWidth,
                            ),
                            Image.asset(
                              "assets/image/realizacao3.png",
                              alignment: Alignment.topCenter,
                              height: 55,
                              width: width*0.18,
                              fit: BoxFit.fitHeight,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: width,
                        child: Text('COLABORAÇÃO',style: TextStyle(
                            fontFamily: 'Barlow',
                            fontWeight: FontWeight.w700,
                            color: PaletteColor.blueText,
                            fontSize: 12.0
                        ),),
                      ),
                      Container(
                        height: 70,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 70,
                              width: width*0.3,
                              child: Image.asset(
                                "assets/image/realizacao4.jpeg",
                                alignment: Alignment.topCenter,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 70,
                              width: width*0.25,
                              child: Image.asset(
                                "assets/image/colaboracao1.png",
                                alignment: Alignment.topCenter,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/image/colaboracao2.png",
                              alignment: Alignment.topCenter,
                              height: 50,
                              width: width*0.65,
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/image/colaboracao4.png",
                              alignment: Alignment.topCenter,
                              height: height*0.18,
                              width: width*0.18,
                              fit: BoxFit.fitWidth,
                            ),
                            Image.asset(
                              "assets/image/download 1.png",
                              alignment: Alignment.topCenter,
                              height: height*0.18,
                              width: width*0.18,
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/image/colaboracao3.png",
                              alignment: Alignment.topCenter,
                              height: 60,
                              width: width*0.6,
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: width,
                        child: Text('APOIO',style: TextStyle(
                            fontFamily: 'Barlow',
                            fontWeight: FontWeight.w700,
                            color: PaletteColor.blueText,
                            fontSize: 12.0
                        ),),
                      ),
                      Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/image/apoio1.png",
                              alignment: Alignment.topCenter,
                              height: height*0.2,
                              width: width*0.25,
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40,)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
    );
  }
}
