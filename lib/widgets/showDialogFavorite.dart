import '../utils/export.dart';

class ShowDialogFavorite extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(4),
          child: Row(
            children: [
              Icon(Icons.favorite,color: PaletteColor.searchGreen),
              Text('  você salvou essa resposta!',
                  style: TextStyle(color: PaletteColor.blueTitle)
              ),
            ],
          )
        ),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 10),
    );
  }
}
