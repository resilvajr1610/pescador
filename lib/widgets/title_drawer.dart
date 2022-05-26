import '../utils/export.dart';

class TitleDrawer extends StatelessWidget {
  IconData icon;
  final image;
  final title;
  final color;
  final sizeIcon;

  TitleDrawer({required this.title,this.image,required this.icon,required this.color,required this.sizeIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon,color: Color(0xff70B62E),size: sizeIcon),
              image!= null?Image.asset(image,width: 20,height: 20,color: color,):Container(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title,style: TextStyle(color: color,fontSize: 14,fontFamily: 'Barlow'),),
              )
            ],
          ),
          Divider(color: PaletteColor.blue,thickness: 1)
        ],
      ),
    );
  }
}
