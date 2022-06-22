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

  List<DateTime> dates =[
    DateTime(2022,06,30),
    DateTime(2022,07,10),
  ];

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  @override
  void initState() {

    initializeDateFormatting();

    for(int i =0; i <dates.length; i++){
      _markedDateMap.add(
          dates[i],
        Event(
          date: dates[i],
          icon: Container(
            padding: EdgeInsets.all(2.5),
            decoration: BoxDecoration(
                color: PaletteColor.greenCalendar,
                borderRadius: BorderRadius.all(Radius.circular(1000))
            ),
            child: Center(
              child: Text(
                dates[i].day.toString(),
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
                          title: 'Entrega de xxxxx',
                          description: 'Levar documentos xxxx para xxxxxxx.',
                          date: '10/07',
                          dateTime: DateTime.parse('2022-07-10 11:10:55.539743'),
                        ),
                        ContainerCalendar(
                          title: 'Entrega de xxxxx',
                          description: 'Levar documentos xxxx para xxxxxxx.',
                          date: '30/06',
                          dateTime: DateTime.parse('2022-06-30 11:10:55.539743'),
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