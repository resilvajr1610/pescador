import '../utils/export.dart';

class SedesColoniaScreen extends StatefulWidget {
  const SedesColoniaScreen({Key? key}) : super(key: key);

  @override
  _SedesColoniaScreenState createState() => _SedesColoniaScreenState();
}

class _SedesColoniaScreenState extends State<SedesColoniaScreen> {
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
                  ContainerContactsWidget(
                    location: 'Colônia Z1',
                    address: 'Rua Minas Gerais, 201, bairro Alumínio - Cruzeiro do Sul/ AC',
                    phone: '(68) 9992-7040',
                  ),
                  ContainerContactsWidget(
                    location: 'Federação dos Pescados do Estado do Acre - FEDEAC',
                    address: 'Rua Minas Gerais, 201, bairro Alumínio - Cruzeiro do Sul/ AC',
                    phone: '(68) 9992-7040',
                  )
                ],
              ),
            ),
          )
        ],
    );
  }
}
