import 'package:flutter/material.dart';
import 'package:tinbot_frontend/Screens/edit_pref.dart';
import 'package:tinbot_frontend/Screens/homepage.dart';
import 'package:tinbot_frontend/Screens/loginpage.dart';
import 'package:tinbot_frontend/Screens/prev_matches.dart';



class AboutUs extends StatefulWidget {
  const AboutUs({super.key});


  @override
  State<AboutUs> createState() => _AboutUs();
}

class _AboutUs extends State<AboutUs> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75.0),
        child:buildAppBar(context) ,
      ),
      body:
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Disclaimer",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w100),),
              SizedBox(height:10),
              Text("We are a group of students who are attempting to use Machine Learning to find better matches for "
                  "people through services. We also want to practice creating a full-stack project, hence this server.",
                style: TextStyle(fontSize: 20),),
              SizedBox(height: 15,),
              Text("This project is for educational purposes only**",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            ],
          ),
        )

    );
  }

  //background widget
  Container buildContainer() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1509114397022-ed747cca3f65?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDF8fGxvdmV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'), // <-- BACKGROUND IMAGE
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
        title: Image.asset('/Users/andreasiby/CDS/TinderBot/FrontEnd/tinbot_frontend/lib/pictures/TinderBot_Logo-removebg-preview.png', fit: BoxFit.fitHeight,
        ),
        actions: <Widget>[
          Column(
            children: [
              const SizedBox(height: 23,),
              Row(

                children: [
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