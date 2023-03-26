
import 'package:flutter/material.dart';
import 'package:tinbot_frontend/Screens/edit_pref.dart';
import 'package:tinbot_frontend/Screens/homepage.dart';
import 'package:tinbot_frontend/Screens/loginpage.dart';
import 'package:tinbot_frontend/Screens/prev_matches.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';


class MyMatches extends StatefulWidget {
  const MyMatches({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<MyMatches> createState() => _MyMatches();
}

  class _MyMatches extends State<MyMatches> {
    final CardSwiperController controller = CardSwiperController();

    //final cards = candidates.map((candidate) => ExampleCard(candidate)).toList();

  List<Container> cards = [
        Container(
          alignment: Alignment.center,
            decoration: const BoxDecoration(
            image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'), // <-- BACKGROUND IMAGE
            fit: BoxFit.contain,),),),
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'), // <-- BACKGROUND IMAGE
              fit: BoxFit.contain,),),
        ),
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1524504388940-b1c1722653e1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60'), // <-- BACKGROUND IMAGE
              fit: BoxFit.contain,),),
        )
  ];

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
            body: SafeArea(
              child: Column(
                  children:[Flexible(
                    child: CardSwiper(
                      cards: cards,
                      controller: controller,
                      onSwipe: _swipe,
                      padding: const EdgeInsets.all(24.0),
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          FloatingActionButton(
                            onPressed: controller.swipeLeft,
                            child: const Icon(Icons.clear_rounded),
                          ),
                          FloatingActionButton(
                            onPressed: controller.swipeRight,
                            child: const Icon(Icons.check),
                          ),

                        ],
                      ),
                    ),


                  ]

              ),
            ),

           
        )
      ],




    );
  }
  //swipe method:
    void _swipe(int index, CardSwiperDirection direction) {
      debugPrint('the card $index was swiped to the: ${direction.name}');
    }

  //background widget
  Container buildContainer() {
    return Container(
      //prob 1: the words below dont show
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1467810563316-b5476525c0f9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Njd8fGxvdmV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'), // <-- BACKGROUND IMAGE
          fit: BoxFit.cover,
        ),

      ),


    );
  }

  //Appbar widget
  AppBar buildAppBar(BuildContext context) {
    return AppBar(

      //getting a transparent appbar
        backgroundColor: const Color.fromRGBO(209, 146, 113, 76), elevation: 0.0,
        centerTitle: false,
        title: Image.asset('/Users/andreasiby/CDS/TinderBot/FrontEnd/tinbot_frontend/lib/pictures/TinderBot_Logo-removebg-preview.png', fit: BoxFit.fitHeight,
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
                          MaterialPageRoute(builder: (context) => const EditPreferences()),
                        );},
                      style: TextButton.styleFrom(
                        //backgroundColor: const Color.fromRGBO(146, 98, 74, 89),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      child: Text("Matching Preferences", style: Theme.of(context).textTheme.bodyLarge,)),
                  const SizedBox(width: 20,),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PrevPreferences()),
                        );},
                      style: TextButton.styleFrom(
                        //backgroundColor: const Color.fromRGBO(146, 98, 74, 89),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      child: Text("Previous Matches", style: Theme.of(context).textTheme.bodyLarge,)),

                  const SizedBox(width: 20,),

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
