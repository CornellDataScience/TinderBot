import 'package:flutter/material.dart';
import 'package:flutter_tinderbot/Screens/homepage.dart';
import 'package:flutter_tinderbot/Screens/loginpage.dart';
import 'package:flutter_tinderbot/Screens/my_matches.dart';

class PrevPreferences extends StatefulWidget {
  const PrevPreferences({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<PrevPreferences> createState() => _PrevPreferences();
}

class _PrevPreferences extends State<PrevPreferences> {
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
              child: buildAppBar(context),
            ),
            body: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(253, 241, 236, 10),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 200,
                    width: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Edit preferences menu manually",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              )),
                          TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                textStyle: const TextStyle(fontSize: 150),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyHomePage()),
                                );
                              },
                              child: Text(
                                "Edit preferences menu manually",
                                style: Theme.of(context).textTheme.bodyMedium,
                              )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Container(
                    width: 500,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(253, 241, 236, 10),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Previous Matches!",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              )),
                          TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(146, 98, 74, 89),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyHomePage()),
                                );
                              },
                              child: Text(
                                "          Let's Go!          ",
                                style: Theme.of(context).textTheme.bodyMedium,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  //background widget
  Container buildContainer() {
    return Container(
      //prob 1: the words below dont show
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1467810563316-b5476525c0f9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Njd8fGxvdmV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'), // <-- BACKGROUND IMAGE
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  //Appbar widget
  AppBar buildAppBar(BuildContext context) {
    return AppBar(

        //getting a transparent appbar
        backgroundColor: const Color.fromRGBO(209, 146, 113, 76),
        elevation: 0.0,
        centerTitle: false,
        title: Image.asset(
          '/Users/andreasiby/CDS/TinderBot/FrontEnd/flutter_application_1/lib/pictures/TinderBot_Logo-removebg-preview.png',
          fit: BoxFit.fitHeight,
        ),
        actions: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 23,
              ),
              Row(
                children: [
                  //padding to make sure not at the edge of the screen
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage()),
                      );
                    },
                    style: TextButton.styleFrom(
                        //backgroundColor: const Color.fromRGBO(146, 98, 74, 89),
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                    child: Text(
                      'Home',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyMatches()),
                        );
                      },
                      style: TextButton.styleFrom(
                          //backgroundColor: const Color.fromRGBO(146, 98, 74, 89),
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                      child: Text(
                        "Matching Preferences",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                          //backgroundColor: const Color.fromRGBO(146, 98, 74, 89),
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                      child: Text(
                        "Previous Matches",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )),

                  SizedBox(
                    width: 20,
                  ),

                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                          //backgroundColor: const Color.fromRGBO(146, 98, 74, 89),
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                      child: Text(
                        "Login/Signup",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )),

                  const SizedBox(width: 50),
                ],
              ),
            ],
          )
        ]);
  }
}
