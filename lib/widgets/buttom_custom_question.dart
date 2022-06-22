import '../utils/export.dart';

class ButtonCustomQuestion extends StatelessWidget {

  String question;
  final onTapFavorite;
  final iconFavorite;

  ButtonCustomQuestion({required this.question,required this.onTapFavorite, required this.iconFavorite});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
              width: width*0.58,
              child: AutoSizeText(question,
                style: TextStyle(
                    color: PaletteColor.blueTitle,
                    fontSize: 12,
                    fontFamily: 'Barlow',
                    fontWeight: FontWeight.w600
                ),
                maxLines: 5,
                minFontSize: 5,
              ),
            ),
            Spacer(),
            Container(
              height: 50,
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(right: 6.0),
              child: GestureDetector(
                onTap: onTapFavorite,
                child: Icon(iconFavorite==false? Icons.favorite_border:Icons.favorite,color: PaletteColor.searchGreen,)),
            )
          ],
        ),
      ),
    );
  }
}
