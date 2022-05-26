import '../utils/export.dart';

class InputSearch extends StatelessWidget {

  final controller;
  final hint;
  final width;

  InputSearch({
    required this.controller,
    required this.hint,
    required this.width,
});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: PaletteColor.searchGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Icons.search,color: PaletteColor.white,),
          Container(
            alignment: Alignment.topCenter,
            width: this.width,
            height: 35,
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            decoration: BoxDecoration(
              color: PaletteColor.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              style: TextStyle(color: PaletteColor.searchGreen),
              controller: this.controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: this.hint,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
