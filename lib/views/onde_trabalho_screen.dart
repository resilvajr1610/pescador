import 'package:pescadorapp/views/showDialogAnswer.dart';

import '../utils/export.dart';

class OndeTrabalhoScreen extends StatefulWidget {
  const OndeTrabalhoScreen({Key? key}) : super(key: key);

  @override
  _OndeTrabalhoScreenState createState() => _OndeTrabalhoScreenState();
}

class _OndeTrabalhoScreenState extends State<OndeTrabalhoScreen> {

  final controller = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  var _controllerData = StreamController<QuerySnapshot>.broadcast();
  List _allResults = [];
  List _resultsList = [];
  Future? resultsLoaded;

  _data() async {
    var data = await db.collection("trabalho").get();

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
          body: Container(
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
                          Image.asset( "assets/image/icon_work.png",width: 150),
                          Text('Onde\ntrabalho',
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
                        width: width*0.65,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: height * 0.6,
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
