import '../utils/export.dart';

class CalendarioPescadorScreen extends StatefulWidget {
  const CalendarioPescadorScreen({Key? key}) : super(key: key);

  @override
  _CalendarioPescadorScreenState createState() => _CalendarioPescadorScreenState();
}

class _CalendarioPescadorScreenState extends State<CalendarioPescadorScreen> {

  DateTime _currentDate = DateTime.now();
  DateTime _targetDateTime = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());

  DateTime startDateDefeso = DateTime(2021,11,15);
  DateTime startDateCarteira = DateTime(2022,03,30);
  DateTime startDateRecolhimento = DateTime(2022,06,01);
  DateTime endDateDefeso = DateTime(2022,03,15);
  DateTime endDateCarteira = DateTime(2022,05,30);
  DateTime endDateRecolhimento = DateTime(2022,08,01);
  DateTime dayFishMan = DateTime(2022,06,29);

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );


  @override
  void initState() {

    getDaysBetweenDefeso(){
      final int diference = endDateDefeso.difference(startDateDefeso).inDays;
      return diference;
    }

    getDaysBetweenCarteira(){
      final int diference = endDateCarteira.difference(startDateCarteira).inDays;
      return diference;
    }
    getDaysBetweenRecolhimento(){
      final int diference = endDateRecolhimento.difference(startDateRecolhimento).inDays;
      return diference;
    }

    final itemsDefeso = List<DateTime>.generate(getDaysBetweenDefeso(), (index){
      DateTime date = startDateDefeso;

      return date.add(Duration(days: index));
    });

    final itemsCarteira = List<DateTime>.generate(getDaysBetweenCarteira(), (index){
      DateTime date = startDateCarteira;

      return date.add(Duration(days: index));
    });

    final itemsRecolhimento = List<DateTime>.generate(getDaysBetweenRecolhimento(), (index){
      DateTime date = startDateRecolhimento;

      return date.add(Duration(days: index));
    });

    initializeDateFormatting();

    for(int i =0; i <itemsDefeso.length; i++){
      _markedDateMap.add(
          itemsDefeso[i],
          Event(
              date: itemsDefeso[i],
              icon: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: PaletteColor.greenCalendar,
                    borderRadius: BorderRadius.all(Radius.circular(1000))
                ),
                child: Center(
                  child: Text(
                    itemsDefeso[i].day.toString(),
                    style: TextStyle(
                        color: PaletteColor.blueTitle,
                        fontSize: 16
                    ),
                  ),
                ),
              )
          )
      );
    }

    for(int i =0; i <itemsRecolhimento.length; i++){
      _markedDateMap.add(
          itemsRecolhimento[i],
          Event(
              date: itemsRecolhimento[i],
              icon: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: PaletteColor.blue,
                    borderRadius: BorderRadius.all(Radius.circular(1000))
                ),
                child: Center(
                  child: Text(
                    itemsRecolhimento[i].day.toString(),
                    style: TextStyle(
                        color: PaletteColor.grey,
                        fontSize: 16
                    ),
                  ),
                ),
              )
          )
      );
    }

    for(int i =0; i <itemsCarteira.length; i++){
      _markedDateMap.add(
          itemsCarteira[i],
          Event(
              date: itemsCarteira[i],
              icon: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: PaletteColor.greenCalendar,
                    borderRadius: BorderRadius.all(Radius.circular(1000))
                ),
                child: Center(
                  child: Text(
                    itemsCarteira[i].day.toString(),
                    style: TextStyle(
                        color: PaletteColor.grey,
                        fontSize: 16
                    ),
                  ),
                ),
              )
          )
      );
    }

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    final _calendarCarouselNoHeader = CalendarCarousel<Event>(
      weekdayTextStyle: TextStyle(color: PaletteColor.blueTitle,fontSize: 0),
      daysTextStyle: TextStyle(color: PaletteColor.blueTitle),
      selectedDayButtonColor: PaletteColor.blueTitle,
      weekendTextStyle: TextStyle(
        color: Colors.green,
      ),
      markedDatesMap: _markedDateMap,
      height: height*0.35,
      targetDateTime: _targetDateTime,
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      markedDateMoreShowTotal: null,
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      //markedDateShowIcon: true,
      todayButtonColor: PaletteColor.greyCalendar,
      selectedDayTextStyle: TextStyle(
        color: Colors.grey,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      markedDateIconBuilder: (event){
        return event.icon;
      },
    );

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
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.all(12),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: PaletteColor.white,
              ),
              width: double.infinity,
              margin: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    height: height*0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: PaletteColor.white,
                            elevation: 0
                          ),
                          icon: Icon(Icons.arrow_back_ios,color: PaletteColor.searchGreen,),
                          label: Text(''),
                          onPressed: () {
                            setState(() {
                              _targetDateTime = DateTime(_targetDateTime.year, _targetDateTime.month -1);
                              _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                            });
                          },
                        ),
                        Text(
                            DateFormat(DateFormat.MONTH, 'pt_BR').format(_targetDateTime.toUtc()).toUpperCase()
                            +" "+ DateFormat(DateFormat.YEAR, ).format(_targetDateTime.toUtc()).toUpperCase(),
                        style: TextStyle(color: PaletteColor.searchGreen),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: PaletteColor.white,
                              elevation: 0
                          ),
                          icon: Icon(Icons.arrow_forward_ios,color: PaletteColor.searchGreen),
                          label: Text(''),
                          onPressed: () {
                            setState(() {
                              _targetDateTime = DateTime(_targetDateTime.year, _targetDateTime.month +1);
                              _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: height*0.3,
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: _calendarCarouselNoHeader,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 4),
                    alignment: Alignment.centerLeft,
                    child: Text('DATAS PRÓXIMAS',
                      style: TextStyle(color: PaletteColor.searchGreen),
                    ),
                  ),
                  Container(
                    height: height*0.34,
                    child: ListView(
                      children: [
                        ContainerCalendar(
                          title: 'Período do defeso',
                          description: 'Paralisação temporária da pesca para fins de reprodução das espécies e aumento do recurso pesqueiro. Carteira de pesca devidamente atualizada; guia da providencia social.',
                          date: '15/03',
                          dateTime: DateTime.parse('2022-03-15 11:10:55.539743'),
                        ),
                        ContainerCalendar(
                          title: 'Atualização da carteira de sócio da Colônia Z1',
                          description: 'Comprovante de endereço atualizado; RG, CPF, titulo de eleitor, documento dos filhos, NIT atualizado.',
                          date: '30/05',
                          dateTime: DateTime.parse('2022-05-30 11:10:55.539743'),
                        ),
                        ContainerCalendar(
                          title: 'Recolhimento para a previdência social',
                          description: 'Trazer por escrito a quantidade de peixes capturados durante o ano.',
                          date: '01/08',
                          dateTime: DateTime.parse('2022-08-01 11:10:55.539743'),
                        ),
                        ContainerCalendar(
                          title: 'Dia do pescador',
                          description: '',
                          date: '29/06',
                          dateTime: DateTime.parse('2022-06-29 11:10:55.539743'),
                        )
                      ],
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