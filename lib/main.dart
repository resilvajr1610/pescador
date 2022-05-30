import '../utils/export.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
        create: (context)=> AppSettings(),
        child: MaterialApp(
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.generateRoute,
          initialRoute: "/splash",
        ),
    )
  );
}

