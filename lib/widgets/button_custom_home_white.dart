import '../utils/export.dart';

class ButtonCustomHomeWhite extends StatelessWidget {
  final title;
  final image;

  ButtonCustomHomeWhite({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation:3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Image.asset(image,width: 80,height: 65,),
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
    );
  }
}