import '../utils/export.dart';

class OrgaosImportantesScreen extends StatefulWidget {
  const OrgaosImportantesScreen({Key? key}) : super(key: key);

  @override
  _OrgaosImportantesScreenState createState() => _OrgaosImportantesScreenState();
}

class _OrgaosImportantesScreenState extends State<OrgaosImportantesScreen> {
  @override
  Widget build(BuildContext context) {

    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    return Stack(
        children: [
          Container(color: PaletteColor.grey,
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
                color: PaletteColor.grey,
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
                    child: ListView(
                      children: [
                        ContainerContactsCompleteWidget(
                          location: 'SFA/AC | Federal',
                          description: 'Superintendência Federalde Agricultura, Pecuaria e Abastecimento do Acre',
                          name: 'Fernando Bortoloso | Superintendente',
                          email: 'gab-ac@agro.gov.br',
                          address: 'Rodovia AC-40, 793, Segundo Distrito - Rio Branco/ac',
                          phone: '(68) 3212-1305',
                        ),
                        ContainerContactsCompleteWidget(
                          location: 'SFA/AC | Estadual',
                          description: 'Serviço de Aquicultura e Pesca',
                          name: 'Marcelo Araripe | Chefe',
                          email: 'marcelo.araripe@agricultura.gov.br',
                          address: 'Rodovia AC-40, 793, Segundo Distrito - Rio Branco/ac',
                          phone: '(68) 3212-1309',
                        ),
                        ContainerContactsCompleteWidget(
                          location: 'FEPEAC | Estadual',
                          description: 'Federação de Pescadores do Estado do Acre',
                          name: 'Elenildo De Souza | Presidente',
                          email: 'fepeac@gmail.com',
                          address: 'Rua Rio Grande do Sul, 141, Centro, Rio Branco/ac',
                          phone: '(68) 99957-6900',
                        ),
                        ContainerContactsCompleteWidget(
                          location: 'ICMBio | Federal',
                          description: 'Instituto Chico Mendes de Conservação da Biodiversidade em Cruzeiro do Sul',
                          name: 'Elenildo De Souza | Presidente',
                          email: 'fepeac@gmail.com',
                          address: 'Rua Jamináuas, 1556, Bairro Cruzeirão',
                          phone: '(68) 3322-3380',
                        ),
                      ],
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
