import '../utils/export.dart';

class MeusDeveresScreen extends StatefulWidget {
  const MeusDeveresScreen({Key? key}) : super(key: key);

  @override
  _MeusDeveresScreenState createState() => _MeusDeveresScreenState();
}

class _MeusDeveresScreenState extends State<MeusDeveresScreen> {

  final controller = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  var _controllerData = StreamController<QuerySnapshot>.broadcast();
  List _allResults = [];
  List _resultsList = [];
  Future? resultsLoaded;
  late int idUsuario;

  _data() async {

    print('entrou');
    var data = await db.collection("deveres").orderBy('time').get();

    setState(() {
      _allResults = data.docs;
    });
    resultSearchList();
    return "complete";
  }

  _search() {
    resultSearchList();
  }

  resultSearchList() {
    var showResults = [];

    if (controller.text != "") {
      for (var items in _allResults) {
        var brands = QuestionModel.fromSnapshot(items).question.toLowerCase();

        if (brands.contains(controller.text.toLowerCase())) {
          showResults.add(items);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
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

  _showDialogFavorite() {
    showDialog(
        context: context,
        builder: (context) {
          return ShowDialogFavorite();
        });
  }

  saveFavorite(String idQuestion, String question, String answer)async{
    db.collection("users").doc(idUsuario.toString()).collection('favorites').doc(idQuestion)
        .set({
      "idQuestion": idQuestion,
      "question": question,
      "answer": answer,
    }).then((_) => _showDialogFavorite());
  }

  readId(){
    idUsuario = context.watch<AppSettings>().idUsuario;
  }

  @override
  void initState() {
    super.initState();
    _data();
    controller.addListener(_search);
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(_search);
    controller.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = _search();
  }

  @override
  Widget build(BuildContext context) {

    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    readId();

    return Stack(
      children: [
        Container(color: PaletteColor.blueBackground,
            height:height,
            width: width),
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
            height: height*0.8,
            width: double.infinity,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: PaletteColor.white,
              borderRadius: BorderRadius.circular(30)
            ),
            child: ListView(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset( "assets/image/icon_duties.png",width: 150),
                          Text('Meus\ndeveres',
                            style: TextStyle(
                                color: PaletteColor.searchGreen,
                                fontSize: 24,
                                fontWeight: FontWeight.w600
                            )
                          )
                        ],
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 112),
                      child: InputSearch(
                        hint: "",
                        controller: controller,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: height * 0.48,
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
                          if (_resultsList.length == 0) {
                            return Center(
                                child: Text('Sem dados!', style: TextStyle(
                                    color: PaletteColor.searchGreen,
                                    fontSize: 20),)
                            );
                          } else {
                            return ListView.builder(
                                itemCount: _resultsList.length,
                                itemBuilder: (BuildContext context, index) {
                                  DocumentSnapshot item = _resultsList[index];

                                  String id = item["id"];
                                  String question = item["pergunta"];
                                  String answer = item["resposta"];

                                  return GestureDetector(
                                    onTap:()=> _showDialog(answer),
                                    child: ButtonCustomQuestion(
                                      onTapFavorite: ()=>saveFavorite(id,question,answer),
                                      iconFavorite: false,
                                      question: question,
                                    ),
                                  );
                                });
                          }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
