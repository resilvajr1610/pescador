import '../utils/export.dart';

class ContainerCalendar extends StatelessWidget {
  final title;
  final description;
  final date;

  const ContainerCalendar({Key? key, this.title, this.description, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    return  Container(
      height: height*0.18,
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                  child: Text(date,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Barlow',
                      color: PaletteColor.white,
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
