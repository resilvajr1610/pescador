import '../utils/export.dart';

class InputSearch extends StatelessWidget {

  final controller;
  final hint;

  InputSearch({
    required this.controller,
    required this.hint,
});

  @override
  Widget build(BuildContext context) {

    double width= MediaQuery.of(context).size.width;

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
            width: width*0.6,
            height: 35,
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
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
