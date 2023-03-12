import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/homepage.dart';
import 'package:flutter_application_1/Screens/loginpage.dart';
import 'package:flutter_application_1/Screens/my_matches.dart';


class EditPreferences extends StatefulWidget {
  const EditPreferences({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<EditPreferences> createState() => _EditPreferences();
}

class _EditPreferences extends State<EditPreferences> {


  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Stack(
      children: [
        buildContainer(),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(75.0),
              child:buildAppBar(context) ,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: const BoxDecoration(color: Color.fromRGBO(253, 241, 236, 10),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container()),
                    Expanded(
                      flex: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50,),
                          const Text("Editing Preferences", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                          const SizedBox(height: 50,),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text("Preferred Gender:", style: TextStyle(fontSize: 30, )),
                                      SizedBox(height:30),
                                      Text("Preferred Age:", style: TextStyle(fontSize: 30, )),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height:5),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(onPressed: (){},
                                              child: Text("Male")),
                                          TextButton(onPressed: (){},
                                              child: Text("Female")),
                                          TextButton(onPressed: (){},
                                              child: Text("Other"))
                                        ],
                                      ),
                                      const SizedBox(height:30),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            border: UnderlineInputBorder(),
                                          focusColor: Color.fromRGBO(253, 241, 236, 10),
                                          hintText: 'Input your desired age range here'
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                    child: Container())
                              ],
                            ),
                          )


                        ]

                      ),
                    )

                  ],
                ),

              ),
            )
        )
      ],




    );
  }


  //background widget
  Container buildContainer() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1535615615570-3b839f4359be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8bG92ZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60'), // <-- BACKGROUND IMAGE
          fit: BoxFit.cover,
        ),

      ),


    );
  }

  //Appbar widget
  AppBar buildAppBar(BuildContext context) {
    return AppBar(


        backgroundColor: const Color.fromRGBO(209, 146, 113, 76), elevation: 0.0,
        centerTitle: false,
        title: Image.asset('/Users/andreasiby/CDS/TinderBot/FrontEnd/flutter_application_1/lib/pictures/TinderBot_Logo-removebg-preview.png', fit: BoxFit.fitHeight,
        ),
        actions: <Widget>[
          Column(
            children: [
              const SizedBox(height: 23,),
              Row(

                children: [

                  //padding to make sure not at the edge of the screen
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage()),
                      );},
                    style: TextButton.styleFrom(
                      //backgroundColor: const Color.fromRGBO(146, 98, 74, 89),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),

                    child: Text('Home', style: Theme.of(context).textTheme.bodyLarge,),),
                  const SizedBox(width: 20,),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyMatches()),
                        );},
                      style: TextButton.styleFrom(
                        //backgroundColor: const Color.fromRGBO(146, 98, 74, 89),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      child: Text("Matching Preferences", style: Theme.of(context).textTheme.bodyLarge,)),
                  SizedBox(width: 20,),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LogInPage()),
                        );},
                      style: TextButton.styleFrom(
                        //backgroundColor: const Color.fromRGBO(146, 98, 74, 89),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      child: Text("Previous Matches", style: Theme.of(context).textTheme.bodyLarge,)),

                  SizedBox(width: 20,),

                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LogInPage()),
                        );},
                      style: TextButton.styleFrom(
                        //backgroundColor: const Color.fromRGBO(146, 98, 74, 89),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      child: Text("Login/Signup", style: Theme.of(context).textTheme.bodyLarge,)),

                  const SizedBox(width:50),



                ],

              ),
            ],
          )


        ]);
  }


}
