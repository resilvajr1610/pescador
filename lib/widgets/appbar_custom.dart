import '../utils/export.dart';

class AppBarCustom extends StatelessWidget  with PreferredSizeWidget{
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: PaletteColor.white),
      leading: InkWell(
        onTap: () => Scaffold.of(context).openDrawer(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Image.asset("assets/image/drawer.png",
            height: 30,
            width: 30,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: ()=>Navigator.pushNamed(context, '/orgaos'),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              'assets/image/icon_brazil.png',
              height: 27,
              width: 40,
            ),
          ),
        ),
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
