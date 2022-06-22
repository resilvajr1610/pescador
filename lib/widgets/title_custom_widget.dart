import '../utils/export.dart';

class TitleCustomWidget extends StatelessWidget {
  final text;

  TitleCustomWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(24),
      child: Text(text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: 'Barlow',
          color: PaletteColor.greyTitle,
          // shadows: <Shadow>[
          //   Shadow(
          //     offset: Offset(0.0, 3.0),
          //     blurRadius: 12.0,
          //     color: PaletteColor.greyTitle,
          //   ),
          // ],
        ),
      )
    );
  }
}
