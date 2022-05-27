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
              fit: BoxFit.fill
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: width*0.55,
                alignment: Alignment.centerLeft,
                child: Text('QUAL É O APP?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Barlow',
                  color: Colors.white
                ),),
              ),
              Container(
                width: width*0.55,
                alignment: Alignment.centerLeft,
                child: Text('DO PESCADOR',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Barlow',
                      color: Colors.white
                  ),),
              ),
              Container(
                height: height*0.22,
                width: height*0.22,
                alignment: Alignment.center,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset('assets/image/logo.png',
                  height: height*0.2,
                  width: height*0.2,
                ),
              ),
              GestureDetector(
                onTap: ()=>Navigator.pushNamed(context, '/home'),
                child: Container(
                  width: width*0.6,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10),
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
