import '../utils/export.dart';

class ButtonCustomHomeGreen extends StatelessWidget {
  final image;
  final title;
  final onTap;

  ButtonCustomHomeGreen({required this.image, required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {

    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Image.asset(image,height: 40,width: 50,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:10),
              child: AutoSizeText(title,
                textAlign: TextAlign.center,
                maxLines: 1,
                minFontSize: 5,
                style: TextStyle(color: PaletteColor.white,fontSize: 12,fontFamily: 'Barlow'),),
            ),
          ],
        ),
      ),
    );
  }
}
