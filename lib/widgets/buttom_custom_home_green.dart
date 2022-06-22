import '../utils/export.dart';

class ButtonCustomHomeGreen extends StatelessWidget {
  final image;
  final title;
  final onTap;
  final heightImage;
  final widthImage;

  ButtonCustomHomeGreen({
    required this.image,
    required this.title,
    required this.onTap,
    required this.heightImage,
    required this.widthImage,
  });

  @override
  Widget build(BuildContext context) {

    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 93,
        width: width*0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:PaletteColor.titleGreen,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Color(0Xff256D2A),
              spreadRadius: 1,
              offset: Offset(0,-3), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Image.asset(image,height: heightImage,width: widthImage,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:5),
              child: AutoSizeText(title,
                textAlign: TextAlign.center,
                maxLines: 2,
                minFontSize: 5,
                style: TextStyle(color: PaletteColor.white,fontSize: 12,fontFamily: 'Barlow'),),
            ),
          ],
        ),
      ),
    );
  }
}
