import '../utils/export.dart';

class AppBarCustom extends StatelessWidget  with PreferredSizeWidget{
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: PaletteColor.white),
      actions: [
        GestureDetector(
          onTap: ()=>Navigator.pushNamed(context, '/sedes'),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              "assets/image/icon_contacts.png",
              height: 30,
              width: 30,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
