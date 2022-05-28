import '../utils/export.dart';

class ContainerContactsCompleteWidget extends StatelessWidget {

  final location;
  final description;
  final address;
  final phone;
  final email;
  final name;

  const ContainerContactsCompleteWidget({Key? key, this.location, this.address, this.phone, this.description, this.email, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location,
              style: TextStyle(
                color: PaletteColor.greyTitle,
                fontFamily: 'Barlow',
                fontSize: 12,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(description,
              style: TextStyle(
                  color: PaletteColor.greyTitle,
                  fontFamily: 'Barlow',
                  fontSize: 12,
                  fontWeight: FontWeight.w600
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(name,
                style: TextStyle(
                    color: PaletteColor.greyTitle,
                    fontFamily: 'Barlow',
                    fontSize: 12,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            Text(email,
              style: TextStyle(
                  color: PaletteColor.greyTitle,
                  fontFamily: 'Barlow',
                  fontSize: 12,
                  fontWeight: FontWeight.w600
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        PaletteColor.darkGreen,
                        PaletteColor.normalGreen
                      ],
                    ),
                  ),
                  child: Icon(Icons.person,color: PaletteColor.white,size: 35,),
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on_outlined,color: PaletteColor.searchGreen,size: 25,),
                        Container(
                          width: width*0.5,
                          padding: EdgeInsets.only(left: 5,bottom: 5),
                          child: Text(address,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Barlow',
                              fontWeight: FontWeight.w500,
                              color: PaletteColor.greyTitle
                            ),)
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: PaletteColor.searchGreen,
                          size: 22,
                        ),
                        Container(
                            width: width*0.48,
                            padding: EdgeInsets.only(left: 5),
                            child: Text(phone,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Barlow',
                                  fontWeight: FontWeight.w500,
                                  color: PaletteColor.greyTitle
                              ),)
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
