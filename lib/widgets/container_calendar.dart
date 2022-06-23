import '../utils/export.dart';

class ContainerCalendar extends StatelessWidget {
  final title;
  final description;
  final date;
  final dateTime;

  const ContainerCalendar({
    required this.title,
    required this.description,
    required this.date,
    required this.dateTime
  });

  @override
  Widget build(BuildContext context) {

    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    final today = DateTime.now();
    final difference = dateTime.difference(today).inDays;
    final datePrint = difference>0?difference:'0';

    return  Container(
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width*0.6,
                  padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Barlow',
                      color: PaletteColor.greyTitle,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                  width: width*0.6,
                  child: Text(description,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Barlow',
                      color: PaletteColor.greyTitle,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  height: height*0.18,
                  decoration: BoxDecoration(
                    color: Color(0xff5DA531),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('restam',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Barlow',
                            color: PaletteColor.white,
                          ),
                        ),
                      ),
                      Text('$datePrint dias',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Barlow',
                          color: PaletteColor.yellow,
                        ),
                      ),
                      Divider(color: PaletteColor.white,indent: 5,endIndent: 5,height: 6,),
                      Text('data final',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Barlow',
                          color: PaletteColor.white,
                        ),
                      ),
                      Text(date,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Barlow',
                          color: PaletteColor.white,
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
