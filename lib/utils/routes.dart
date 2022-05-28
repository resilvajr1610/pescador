import '../utils/export.dart';

class Routes{
    static Route<dynamic>? generateRoute(RouteSettings settings){

      switch(settings.name){
        case "/home" :
          return MaterialPageRoute(
              builder: (_) => HomeScreen()
          );
        case "/splash" :
          return MaterialPageRoute(
              builder: (_) => SplashScreen()
          );
        case "/fala" :
          return MaterialPageRoute(
              builder: (_) => FalaPescadorScreen()
          );
        case "/trabalho" :
          return MaterialPageRoute(
              builder: (_) => OndeTrabalhoScreen()
          );
        case "/eu" :
          return MaterialPageRoute(
              builder: (_) => EuPescadorScreen()
          );
        case "/direitos" :
          return MaterialPageRoute(
              builder: (_) => MeusDireitosScreen()
          );
        case "/deveres" :
          return MaterialPageRoute(
              builder: (_) => MeusDeveresScreen()
          );
        case "/sedes" :
          return MaterialPageRoute(
              builder: (_) => SedesColoniaScreen()
          );
        case "/sobre" :
          return MaterialPageRoute(
              builder: (_) => SobreScreen()
          );
        default :
          _erroRota();
      }
    }
    static  Route <dynamic> _erroRota(){
      return MaterialPageRoute(
          builder:(_){
            return Scaffold(
              appBar: AppBar(
                title: Text("Tela em desenvolvimento"),
              ),
              body: Center(
                child: Text("Tela em desenvolvimento"),
              ),
            );
          });
    }
  }