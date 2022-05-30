import '../utils/export.dart';

class AppSettings extends ChangeNotifier{
  late SharedPreferences _prefs;
  int idUsuario = 0;

  AppSettings(){
    _startSettings();
  }
  _startSettings()async{
   await _startPreferences();
   await _readIdUsuario();
  }

  Future<void> _startPreferences()async{
    _prefs = await SharedPreferences.getInstance();
  }
  _readIdUsuario(){
    final id = _prefs.getInt('idUsuario') ?? 0;
    idUsuario = id;
    notifyListeners();
  }
  setId(int id)async{
    await _prefs.setInt('idUsuario', id);
    await _readIdUsuario();
  }
}