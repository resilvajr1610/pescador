import '../utils/export.dart';

class ButtonCustomHomeWhite extends StatelessWidget {
  final title;
  final image;
  final onTap;

  ButtonCustomHomeWhite({required this.title, required this.image,required this.onTap});

  @override
  Widget build(BuildContext context) {

    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Card(
            elevation:3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(image,width: width*0.22,height: width*0.18,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: PaletteColor.blueTitle,
                  fontSize: 14,
                  fontFamily: 'Barlow',
                  fontWeight: FontWeight.w600
              ),
            ),
          )
        ],
      ),
    );
  }
}
