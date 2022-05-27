import '../utils/export.dart';

class ButtonCustomQuestion extends StatelessWidget {

  final question;

  ButtonCustomQuestion({required this.question});

  @override
  Widget build(BuildContext context) {

    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        elevation:3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              height: 50,
              width: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.repeated,
                  colors: [
                    PaletteColor.normalGreenHome,
                    PaletteColor.lightGreenHome
                  ],
                  stops: [0.0, 0.6],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6.0),
              width: width*0.5,
              child: AutoSizeText(question,
                style: TextStyle(
                    color: PaletteColor.blueTitle,
                    fontSize: 14,
                    fontFamily: 'Barlow',
                    fontWeight: FontWeight.w600
                ),
                maxLines: 5,
                minFontSize: 5,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
              child: Icon(Icons.favorite_border,color: PaletteColor.searchGreen,),
            )
          ],
        ),
      ),
    );
  }
}
