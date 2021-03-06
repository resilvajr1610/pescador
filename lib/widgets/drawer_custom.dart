import '../utils/export.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width= MediaQuery.of(context).size.width;

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: width*0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TitleDrawer(
                onTap: ()=>Navigator.pushNamed(context, '/home'),
                title: 'home',
                color: PaletteColor.lightGreen,
                icon: Icons.home,
                sizeIcon: 30.0,
              ),
              TitleDrawer(
                onTap: ()=>Navigator.pushNamed(context, '/calendario'),
                title: 'calendário',
                color: PaletteColor.lightGreen,
                icon: Icons.calendar_today,
                image: 'assets/image/icon_calendar.png',
                sizeIcon: 0.0,
              ),
              TitleDrawer(
                  onTap: ()=>Navigator.pushNamed(context, '/trabalho'),
                  title: 'onde trabalho',
                  image: 'assets/image/icon_work.png',
                  icon: Icons.calendar_today,
                  color: PaletteColor.titleGreen,
                  sizeIcon: 0.0
              ),
              TitleDrawer(
                  onTap: ()=>Navigator.pushNamed(context, '/deveres'),
                  title: 'meus deveres',
                  image: 'assets/image/icon_duties.png',
                  icon: Icons.calendar_today,
                  color: PaletteColor.titleGreen,
                  sizeIcon: 0.0
              ),
              TitleDrawer(
                  onTap: ()=>Navigator.pushNamed(context, '/eu'),
                  title: 'eu, pescador (a)',
                  image: 'assets/image/icon_fisherman.png',
                  icon: Icons.calendar_today,
                  color: PaletteColor.titleGreen,
                  sizeIcon: 0.0
              ),
              TitleDrawer(
                  onTap: ()=>Navigator.pushNamed(context, '/direitos'),
                  title: 'meus direitos',
                  image: 'assets/image/icon_boat.png',
                  icon: Icons.calendar_today,
                  color: PaletteColor.titleGreen,
                  sizeIcon: 0.0
              ),
              TitleDrawer(
                  onTap: ()=>Navigator.pushNamed(context, '/fala'),
                  title: 'fala pescador(a)',
                  image: 'assets/image/icon_person.png',
                  icon: Icons.calendar_today,
                  color: PaletteColor.lightGreen,
                  sizeIcon: 0.0
              ),
              TitleDrawer(
                  onTap: ()=>Navigator.pushNamed(context, '/orgaos'),
                  title: 'órgãos importantes',
                  image: 'assets/image/icon_brazil.png',
                  icon: Icons.calendar_today,
                  color: PaletteColor.lightGreen,
                  sizeIcon: 0.0
              ),
              TitleDrawer(
                onTap: ()=>Navigator.pushNamed(context, '/sedes'),
                title: 'sedes da colônia',
                color: PaletteColor.lightGreen,
                icon: Icons.location_on_outlined,
                sizeIcon: 30.0,
              ),
              TitleDrawer(
                onTap: ()=>Navigator.pushNamed(context, '/sobre'),
                title: 'sobre',
                color: PaletteColor.lightGreen,
                icon: Icons.location_on_outlined,
                sizeIcon: 0.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
