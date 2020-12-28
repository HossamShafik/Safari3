import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:project/view/details_screens/hotel_details.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;

class HotelsService extends StatefulWidget {
  @override
  _HotelsServiceState createState() => _HotelsServiceState();
}

class _HotelsServiceState extends State<HotelsService> {

  Color deepPurple = Colors.deepPurpleAccent;
  Color pink = Colors.pink[600];
  Color blue = Colors.indigo;
  Color black = Colors.black;
  Color grey = Colors.grey[900];

  String dropdownValue = 'Cairo';
  double minPrice = 0;
  double maxPrice = 2000;
  double _lowerValue = 50;
  double _upperValue = 500;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 8),
        child: Column(
          children: [
            head(),
            SizedBox(height: 10,),
            body(),
          ],
        ),
      ),
    );
  }

  Widget head(){
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 55,
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 7),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey[50],
                        child: IconButton(
                          icon: Icon(
                            Icons.tune,
                            color: blue,
                          ),
                          onPressed: () {
                            _showFilter(context);
                          },
                        ),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[700],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: blue,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget body() {
    return Expanded(
      child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width*0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15),),
                          image: DecorationImage(
                            image: NetworkImage('https://images.pexels.com/photos/189296/pexels-photo-189296.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12,top: 12),
                                  child: Text('Horus Hotel',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 9,top: 8),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on_sharp,color: blue,size: 16,),
                                      Text('Cairo',style: TextStyle(),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12,top: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Price : ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey[900]),),
                                          Text('600'+'L.E'+'/Day',style: TextStyle(color: pink.withOpacity(0.8),fontWeight: FontWeight.w500,),)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12,bottom: 17),
                                child: Row(
                                  children: [
                                    Icon(Icons.star_rate_rounded,size: 19,color: Colors.orange,),
                                    Text('4.5',style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.w400),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HotelsDetailsScreen()));
                },
              ),
            );
          }
      ),
    );
  }

  void _showFilter(context) {
    showBarModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.55,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Filters",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: pink,
                        ),
                        textAlign: TextAlign.center,
                      ),
                   SizedBox(
                     height: 30,
                   ),
                   Align(
                     alignment: Alignment.topLeft,
                     child: Text(
                       "City:",
                       style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                     ),
                   ),
                   StatefulBuilder(
                     builder: (BuildContext context,
                         StateSetter setState) =>
                         Align(
                           alignment: Alignment.topLeft,
                           child: DropdownButton<String>(
                             value: dropdownValue,
                             style: TextStyle(color: Color(0xff77747b)),
                             items: <String>[
                               'Cairo',
                               'Giza',
                               'Sharm ElSheikh',
                               'Luxor',
                               'Aswan',
                               'Hurghada',
                               'Alexandria',
                             ].map<DropdownMenuItem<String>>(
                                     (String value) {
                                   return DropdownMenuItem<String>(
                                     value: value,
                                     child: Row(
                                         children: [
                                       Icon(
                                         FontAwesomeIcons.mapMarkerAlt,
                                         color: deepPurple,
                                         size: 22,
                                       ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                       Text(value),
                                     ]),
                                   );
                                 }).toList(),
                             onChanged: (String newValue) {
                               setState(() {
                                 dropdownValue = newValue;
                               });
                             },
                           ),
                         ),
                   ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Price Range:",
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Minimum",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey.shade900,
                            ),
                          ),
                          Text(
                            "Maximum",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey.shade900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 2.5,
                    activeTrackColor: deepPurple,
                    thumbColor: deepPurple,
                    valueIndicatorColor:  deepPurple,
                    inactiveTrackColor: deepPurple.withOpacity(0.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: frs.RangeSlider(
                      min: minPrice,
                      max: maxPrice,
                      lowerValue: _lowerValue,
                      upperValue: _upperValue,
                      divisions: 5,
                      showValueIndicator: true,
                      valueIndicatorMaxDecimals: 1,
                      onChanged:
                          (double newLowerValue, double newUpperValue) {
                        setState(() {
                          _lowerValue = newLowerValue;
                          _upperValue = newUpperValue;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    width: 150,
                    height: 45,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      color: Colors.indigo,
                      child: Text(
                        'Save Filters',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      elevation: 8,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}