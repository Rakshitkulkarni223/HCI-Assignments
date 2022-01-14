import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "OrderNow App",
      debugShowCheckedModeBanner: false,
      home: FavoriteCity(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
      )));
}

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _favoriteCityState();
  }
}

class _favoriteCityState extends State<FavoriteCity> {
  var household_items = [
    "Silverware",
    "Steak knives",
    "Drinking glasses",
    "Silverware divider",
    "Washing up liquid",
    "Dishwasher tablets",
    "Dishwasher salt",
    "Dishwasher cleaner",
    "Washing up gloves",
    "Washing up brush",
    "Scourer",
    "Microfibre cloth",
    "Multipurpose cleaner",
    "Antibacterial spray",
    "Stainless steel cleaner",
    "Glass cleaner",
    "Lime scale remover",
    "Oven cleaner",
    "White wine vinegar",
    "Microfibre cleaning cloths",
    "Kitchen roll",
    "Microfibre duster cloths",
    "Microfibre window cloths",
    "Microfibre polishing cloths",
    "Feather duster",
    "Wood polish spray",
    "Dusting spray",
    "Silver polish",
    "Washing detergent",
    "Fabric conditioner",
    "Laundry bleach",
    "Stain remover",
    "Lint roller",
    "Wooden floor cleaner",
    "General floor cleaner",
    "eCloth floor mop",
    "Dustpan and brush",
    "Cleaning cloth",
    "Polishing cloth",
    "Glass cleaner",
    "Trash bags – large",
    "Trash bags – small",
    "Food recycling bags",
    "Cleaning gloves",
    "Toilet brush",
    "Toilet paper",
    "Antibacterial spray cleaner",
    "Shower cleaner",
    "Toilet bleach",
    "Limescale remover",
    "Drain cleaner",
    "Liquid hand soap",
    "Hand sanitizer",
    "Saran Wrap / Cling Film",
    "Tin foil",
    "Greaseproof paper",
    "Baking parchment",
    "Freezer bags"
  ];

  var product = "Silverware";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OrderNow Activity Screen 1"),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Select the house hold items from the dropdown list",
                  style: TextStyle(fontSize: 20.0)),
            ),
            Container(
                margin: EdgeInsets.only(top: 20.0),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.redAccent,
                          Colors.blueAccent,
                          Colors.purpleAccent
                          //add more colors
                        ]),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color.fromRGBO(
                                  0, 0, 0, 0.57), //shadow for button
                              blurRadius: 5) //blur radius of shadow
                        ]),
                    child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: DropdownButton<String>(
                          items: household_items.map((String product) {
                            return DropdownMenuItem<String>(
                                value: product, child: Text(product));
                          }).toList(),
                          value: product,
                          onChanged: (String? product) =>
                              setState(() => this.product = product!),
                          isExpanded: true,
                          //make true to take width of parent widget
                          underline: Container(),
                          //empty line
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          dropdownColor: Colors.green,
                          iconEnabledColor: Colors.white, //Icon color
                        )))),
            Container(
                margin: EdgeInsets.only(top: 10.0),
                child: getImage('images/image2.jpeg')),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            bottom: 70,
            width: 200,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                alertmessage(context, "Added To Cart",
                    "You can select some more items or you can buy now!!");
              },
              child: Text(
                "ADD TO CART",
                textDirection: TextDirection.ltr,
                textScaleFactor: 1.5,
              ),
              elevation: 6.0,
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            right: 0,
            width: 200,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                alertmessage(
                    context, "Order Placed", "Visit Again.Thank you!!!");
              },
              child: Text(
                "BUY NOW",
                textDirection: TextDirection.ltr,
                textScaleFactor: 1.5,
              ),
              elevation: 6.0,
              color: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 105,
            width: 200,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                gotoSecondActivity(context);
              },
              child: Text(
                "NEXT PAGE",
                textDirection: TextDirection.ltr,
                textScaleFactor: 1.5,
              ),
              elevation: 6.0,
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          // Add more floating buttons if you want
          // There is no limit
        ],
      ),
    );
  }

  void alertmessage(BuildContext context, String text, String subtitile) {
    var alrtmsg = AlertDialog(
      title: Text(text),
      content: Text(subtitile),
    );

    showDialog(context: context, builder: (BuildContext context) => alrtmsg);
  }

  Widget getImage(String image_name) {
    AssetImage assetimage = AssetImage(image_name);
    Image image = Image(
      image: assetimage,
    );
    return Container(
      child: image,
      width: 425.0,
      height: 425.0,
    );
  }

  gotoSecondActivity(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen()),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondScreen();
  }
}

class _SecondScreen extends State<SecondScreen> {
  var DISHWASHING = [
    "Washing up liquid",
    "Dishwasher tablets",
    "Dishwasher salt",
    "Dishwasher cleaner",
    "Washing up gloves",
    "Washing up brush",
    "Scourer",
    "Microfibre cloth"
  ];

  var dishwashing = "Washing up liquid";

  var CLEANING = [
    "Multipurpose cleaner",
    "Antibacterial spray",
    "Stainless steel cleaner",
    "Glass cleaner",
    "Lime scale remover",
    "Oven cleaner",
    "White wine vinegar",
    "Microfibre cleaning cloths",
    "Kitchen roll"
  ];

  var cleaning = "Multipurpose cleaner";

  var DUSTING_AND_POLISHING = [
    "Microfibre duster cloths",
    "Microfibre window cloths",
    "Microfibre polishing cloths",
    "Feather duster",
    "Wood polish spray",
    "Dusting spray",
    "Silver polish"
  ];

  var dusting_and_polishing = "Microfibre duster cloths";

  var LAUNDRY = [
    "Washing detergent",
    "Fabric conditioner",
    "Laundry bleach",
    "Stain remover",
    "Lint roller"
  ];

  var laundry = "Washing detergent";

  var FLOORS = [
    "Wooden floor cleaner",
    "General floor cleaner",
    "eCloth floor mop",
    "Dustpan and brush"
  ];

  var floors = "Wooden floor cleaner";

  var WINDOWS = ["Cleaning cloth", "Polishing cloth", "Glass cleaner"];

  var windows = "Cleaning cloth";

  var TRASH = [
    "Trash bags – large",
    "Trash bags – small",
    "Food recycling bags"
  ];

  var trash = "Trash bags – large";

  var BATHROOM = [
    "Cleaning gloves",
    "Toilet brush",
    "Toilet paper",
    "Antibacterial spray cleaner",
    "Shower cleaner",
    "Toilet bleach",
    "Limescale remover",
    "Drain cleaner"
  ];

  var bathroom = "Cleaning gloves";

  var HYGIENE = ["Liquid hand soap", "Hand sanitizer"];

  var hygiene = "Liquid hand soap";

  var FOOD_CARE = [
    "Saran Wrap / Cling Film",
    "Tin foil",
    "Greaseproof paper",
    "Baking parchment",
    "Freezer bags"
  ];

  var food_care = "Saran Wrap / Cling Film";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OrderNow Activity Screen 2")),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Select the house hold items from the drawer header",
                  style: TextStyle(fontSize: 20.0)),
            ),
            Container(
                margin: EdgeInsets.only(top: 20.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.redAccent,
                        Colors.blueAccent,
                        Colors.purpleAccent
                        //add more colors
                      ]),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color.fromRGBO(
                                0, 0, 0, 0.57), //shadow for button
                            blurRadius: 5) //blur radius of shadow
                      ]),
                )),
            Container(
                margin: EdgeInsets.only(top: 10.0),
                child: getImage('images/image1.jpg')),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            bottom: 70,
            width: 200,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                alertmessage(context, "Added To Cart",
                    "You can select some more items or you can buy now!!");
              },
              child: Text(
                "ADD TO CART",
                textDirection: TextDirection.ltr,
                textScaleFactor: 1.5,
              ),
              elevation: 6.0,
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            right: 0,
            width: 200,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                alertmessage(
                    context, "Order Placed", "Visit Again.Thank you!!!");
              },
              child: Text(
                "BUY NOW",
                textDirection: TextDirection.ltr,
                textScaleFactor: 1.5,
              ),
              elevation: 6.0,
              color: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 105,
            width: 200,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                goBackToPreviousScreen(context);
              },
              child: Text(
                "PREVIOUS PAGE",
                textDirection: TextDirection.ltr,
                textScaleFactor: 1.5,
              ),
              elevation: 6.0,
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          // Add more floating buttons if you want
          // There is no limit
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Select house hold items'),
            ),
            ListTile(
              title: const Text('DISHWASHING ',
                  style: TextStyle(fontSize: 18, color: Colors.deepOrange)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 40.0),
                child: DropdownButton<String>(
                  items: DISHWASHING.map((String dishwashing) {
                    return DropdownMenuItem<String>(
                        value: dishwashing, child: Text(dishwashing));
                  }).toList(),
                  value: dishwashing,
                  onChanged: (String? dishwashing) =>
                      setState(() => this.dishwashing = dishwashing!),
                  isExpanded: true,
                  //make true to take width of parent widget
                  underline: Container(),
                  //empty line
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  dropdownColor: Colors.green,
                  iconEnabledColor: Colors.white, //Icon color
                )),
            ListTile(
              title: const Text('CLEANING',
                  style: TextStyle(fontSize: 18, color: Colors.pinkAccent)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 40.0),
                child: DropdownButton<String>(
                  items: CLEANING.map((String cleaning) {
                    return DropdownMenuItem<String>(
                        value: cleaning, child: Text(cleaning));
                  }).toList(),
                  value: cleaning,
                  onChanged: (String? cleaning) =>
                      setState(() => this.cleaning = cleaning!),
                  isExpanded: true,
                  //make true to take width of parent widget
                  underline: Container(),
                  //empty line
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  dropdownColor: Colors.green,
                  iconEnabledColor: Colors.white, //Icon color
                )),
            ListTile(
              title: const Text('DUSTING & POLISHING',
                  style: TextStyle(fontSize: 18, color: Colors.cyanAccent)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 40.0),
                child: DropdownButton<String>(
                  items:
                      DUSTING_AND_POLISHING.map((String dusting_and_polishing) {
                    return DropdownMenuItem<String>(
                        value: dusting_and_polishing,
                        child: Text(dusting_and_polishing));
                  }).toList(),
                  value: dusting_and_polishing,
                  onChanged: (String? dusting_and_polishing) => setState(() =>
                      this.dusting_and_polishing = dusting_and_polishing!),
                  isExpanded: true,
                  //make true to take width of parent widget
                  underline: Container(),
                  //empty line
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  dropdownColor: Colors.green,
                  iconEnabledColor: Colors.white, //Icon color
                )),
            ListTile(
              title: const Text('LAUNDRY',
                  style:
                      TextStyle(fontSize: 18, color: Colors.lightGreenAccent)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 40.0),
                child: DropdownButton<String>(
                  items: LAUNDRY.map((String laundry) {
                    return DropdownMenuItem<String>(
                        value: laundry, child: Text(laundry));
                  }).toList(),
                  value: laundry,
                  onChanged: (String? laundry) =>
                      setState(() => this.laundry = laundry!),
                  isExpanded: true,
                  //make true to take width of parent widget
                  underline: Container(),
                  //empty line
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  dropdownColor: Colors.green,
                  iconEnabledColor: Colors.white, //Icon color
                )),
            ListTile(
              title: const Text('FLOORS',
                  style: TextStyle(fontSize: 18, color: Colors.yellowAccent)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 40.0),
                child: DropdownButton<String>(
                  items: FLOORS.map((String floors) {
                    return DropdownMenuItem<String>(
                        value: floors, child: Text(floors));
                  }).toList(),
                  value: floors,
                  onChanged: (String? floors) =>
                      setState(() => this.floors = floors!),
                  isExpanded: true,
                  //make true to take width of parent widget
                  underline: Container(),
                  //empty line
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  dropdownColor: Colors.green,
                  iconEnabledColor: Colors.white, //Icon color
                )),
            ListTile(
              title: const Text('WINDOWS',
                  style: TextStyle(fontSize: 18, color: Colors.tealAccent)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 40.0),
                child: DropdownButton<String>(
                  items: WINDOWS.map((String windows) {
                    return DropdownMenuItem<String>(
                        value: windows, child: Text(windows));
                  }).toList(),
                  value: windows,
                  onChanged: (String? windows) =>
                      setState(() => this.windows = windows!),
                  isExpanded: true,
                  //make true to take width of parent widget
                  underline: Container(),
                  //empty line
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  dropdownColor: Colors.green,
                  iconEnabledColor: Colors.white, //Icon color
                )),
            ListTile(
              title: const Text('TRASH',
                  style: TextStyle(fontSize: 18, color: Colors.purpleAccent)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 40.0),
                child: DropdownButton<String>(
                  items: TRASH.map((String trash) {
                    return DropdownMenuItem<String>(
                        value: trash, child: Text(trash));
                  }).toList(),
                  value: trash,
                  onChanged: (String? trash) =>
                      setState(() => this.trash = trash!),
                  isExpanded: true,
                  //make true to take width of parent widget
                  underline: Container(),
                  //empty line
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  dropdownColor: Colors.green,
                  iconEnabledColor: Colors.white, //Icon color
                )),
            ListTile(
              title: const Text('BATHROOM',
                  style: TextStyle(fontSize: 18, color: Colors.greenAccent)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 40.0),
                child: DropdownButton<String>(
                  items: BATHROOM.map((String bathroom) {
                    return DropdownMenuItem<String>(
                        value: bathroom, child: Text(bathroom));
                  }).toList(),
                  value: bathroom,
                  onChanged: (String? bathroom) =>
                      setState(() => this.bathroom = bathroom!),
                  isExpanded: true,
                  //make true to take width of parent widget
                  underline: Container(),
                  //empty line
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  dropdownColor: Colors.green,
                  iconEnabledColor: Colors.white, //Icon color
                )),
            ListTile(
              title: const Text('HYGIENE',
                  style: TextStyle(fontSize: 18, color: Colors.indigoAccent)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 40.0),
                child: DropdownButton<String>(
                  items: HYGIENE.map((String hygiene) {
                    return DropdownMenuItem<String>(
                        value: hygiene, child: Text(hygiene));
                  }).toList(),
                  value: hygiene,
                  onChanged: (String? hygiene) =>
                      setState(() => this.hygiene = hygiene!),
                  isExpanded: true,
                  //make true to take width of parent widget
                  underline: Container(),
                  //empty line
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  dropdownColor: Colors.green,
                  iconEnabledColor: Colors.white, //Icon color
                )),
            ListTile(
              title: const Text('FOOD CARE',
                  style: TextStyle(fontSize: 18, color: Colors.amberAccent)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 40.0),
                child: DropdownButton<String>(
                  items: FOOD_CARE.map((String food_care) {
                    return DropdownMenuItem<String>(
                        value: food_care, child: Text(food_care));
                  }).toList(),
                  value: food_care,
                  onChanged: (String? food_care) =>
                      setState(() => this.food_care = food_care!),
                  isExpanded: true,
                  //make true to take width of parent widget
                  underline: Container(),
                  //empty line
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  dropdownColor: Colors.green,
                  iconEnabledColor: Colors.white, //Icon color
                )),
          ],
        ),
      ),
    );
  }

  goBackToPreviousScreen(BuildContext context) {
    Navigator.pop(context);
  }

  Widget getImage(String image_name) {
    AssetImage assetimage = AssetImage(image_name);
    Image image = Image(
      image: assetimage,
    );
    return Container(
      child: image,
      width: 425.0,
      height: 425.0,
    );
  }

  void alertmessage(BuildContext context, String text, String subtitile) {
    var alrtmsg = AlertDialog(
      title: Text(text),
      content: Text(subtitile),
    );

    showDialog(context: context, builder: (BuildContext context) => alrtmsg);
  }
}
