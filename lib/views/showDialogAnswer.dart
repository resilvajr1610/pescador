import 'package:pescadorapp/utils/export.dart';

import '../Utils/export.dart';

class ShowDialogAnswer extends StatelessWidget {

  final text;

  ShowDialogAnswer({required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Text(text,
              style: TextStyle(color: PaletteColor.blueTitle)
          )
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: PaletteColor.white,
            elevation: 0
          ),
          onPressed: ()=>Navigator.pop(context),
          child: Text('fechar',style: TextStyle(color: Colors.red),),
        )
      ],
    );
  }
}
