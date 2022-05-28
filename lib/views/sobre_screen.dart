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
              margin: EdgeInsets.all(16),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: PaletteColor.white,
                ),
                width: double.infinity,
                margin: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TitleCustomWidget(
                      text: 'Sobre',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Este aplicativo provê acesso às informações de utilidade pública no interesse da comunidade de pescadores artesanais na Amazônia brasileira.\n\nÉ uma tecnologia aberta e de domínio público construída em rede pelos colaboradores do Instituto Fronteiras, do Coletivo Proteja, da WCS Brasil, da Colônia de Pescadores Artesanais Z1 de Cruzeiro do Sul/AC e por pesquisadores do Grupo de Pesquisa Fronteiras Regenerativas na Amazônia, da Universidade Federal do Acre, Campus Floresta.',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Barlow',
                          fontSize: 14,
                          color: PaletteColor.greyTitle
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
    );
  }
}
