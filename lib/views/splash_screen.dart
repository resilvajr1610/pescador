import '../utils/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image/background.png'),
              colorFilter: ColorFilter.mode(Colors.white24, BlendMode.screen),
              fit: BoxFit.fill
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/image/logoHome.png',
                height: height*0.3,
                width: height*0.3,
              ),
              GestureDetector(
                onTap: ()=>Navigator.pushNamed(context, '/home'),
                child: Container(
                  width: height*0.3,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 23),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.repeated,
                      colors: [
                        PaletteColor.darkGreen,
                        PaletteColor.lightGreen
                      ],
                      stops: [0.0, 0.6],
                    ),
                  ),
                  child: Text('ENTRAR',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Barlow',
                        color: Colors.white70
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
