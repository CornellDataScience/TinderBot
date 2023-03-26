// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:tinbot_frontend/Screens/aboutus.dart';
import 'package:tinbot_frontend/Screens/homepage.dart';
import 'package:carousel_images/carousel_images.dart';
import 'package:tinbot_frontend/Screens/my_matches.dart';

String host = Platform.environment['MONGO_DART_DRIVER_HOST'] ?? '127.0.0.1';
String port = Platform.environment['MONGO_DART_DRIVER_PORT'] ?? '27017';


class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget{
  const LoginDemo({super.key});


  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends widgets.State<LoginDemo>{
  //variables used in the class
  String username = "";
  String password ="";
  final List<String> listImages =[
    'https://images.unsplash.com/photo-1474552226712-ac0f0961a954?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGxvdmV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
    'https://images.unsplash.com/photo-1531747056595-07f6cbbe10ad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGxvdmV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
    'https://images.unsplash.com/photo-1513279922550-250c2129b13a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGxvdmV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'
  ];



  @override
   Widget build(BuildContext context) {
    return Stack(
    children: [

      buildBackground(),
      
      
      Scaffold(
        backgroundColor: Colors.transparent,
      appBar: buildAppBar(context),
      
      //main
      body:

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //body row has 2 containers
                  children: [
                    Expanded(
                        flex:1,
                        child: Container()),
                    Expanded(
                      flex: 2,
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 50,),

                          const Text ("Login", style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(250, 255, 253, 246),
                                ),),
                          const SizedBox(height: 20,),
                          const Text("Welcome back! Login with your credentials",style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(250, 255, 253, 246),
                                      ),),
                        //prob#2 : the text fields don't work :(
                          // TextField(
                         //
                         // showCursor: true,
                         // decoration: const InputDecoration(
                         // border: UnderlineInputBorder(),
                         // labelText: 'Enter your username',
                         // fillColor: Colors.black,
                         // filled: true,
                         // ),
                         // cursorColor: const Color.fromRGBO(209, 146, 113, 78),
                         // onChanged: (a){username =a;},//assigns username with value a
                         //
                         // )
                          const SizedBox(height: 50,),

                          TextField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            cursorColor: Colors.white,
                            onChanged: (a){username =a;},

                          ),
                          const SizedBox(height:50),
                          TextField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your password',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            cursorColor: Colors.white,
                            onChanged: (b){password = b;},

                          ),
                          const SizedBox(height:50),
                          TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(133, 124, 131, 89),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const MyHomePage()),
                            );
                          }, child: Text("          Let's Go!          ", style: Theme.of(context).textTheme.bodyMedium,)
                          ),

                        ],
                      ),

                      // adapted code from https://www.nintyzeros.com/2021/01/flutter-login-signup.html



                    ),

                  Expanded(
                      flex: 1,
                      child: Container()),
                  Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.center,
                      width: 600,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(217, 217, 217, 100),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Let us find your perfect match..", style: TextStyle( fontWeight: FontWeight.bold,
                          fontSize: 20, fontStyle: FontStyle.italic, ),),
                          CarouselImages(listImages: listImages, height: 500)
                        ],
                      ),


                    ),
                  ),



                  ],

              ),
            ),
          )


    )
    
    ]);


    
    
    
    
   }

  Container buildBackground() {
    return Container(
        //prob 1: the words below dont show
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1564045288780-5c11658fefa3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjJ8fGxvdmV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'), // <-- BACKGROUND IMAGE
            fit: BoxFit.cover,
          ),

        ),

      );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      //getting a transparent appbar
      backgroundColor: Colors.transparent, elevation: 0.0,
      centerTitle: false,
      title: Image.asset('/Users/andreasiby/CDS/TinderBot/FrontEnd/tinbot_frontend/lib/pictures/TinderBot_Logo-removebg-preview.png', fit: BoxFit.fitHeight,
      ),
      actions: <Widget>[
      Row(
            children: [

              //padding to make sure not at the edge of the screen
                    TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const AboutUs()),
                                                  );},

                                    child: Text('About Us', style: Theme.of(context).textTheme.bodyLarge,),


                                  ),


                const SizedBox(width:50),


            ],

      )


  ]);
  }
}

