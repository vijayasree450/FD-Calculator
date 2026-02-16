import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(
      MaterialApp(
             debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: Icon(
          Icons.notes,
          size: 30,
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
       body:body(),
    );
  }
  Widget body(){
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
             
                bottomRight: Radius.circular(100),
              ),
            ),
             child: Padding(
               padding: const EdgeInsets.only(bottom: 8.0),
               child: Align(
                alignment: Alignment.center,
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Fixed Deposit",
                    style: GoogleFonts.robotoMono(
                      fontSize: 35,
                      color: Colors.white,),
                    ),
                     Text("Calculator",
                    style: GoogleFonts.robotoMono(
                      fontSize: 35,
                      color: Colors.white,),
                    ),
                    
                    
                  ],
                 ),
               ),
             ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(30,10,40,0),
            child: Column(
              children: [
                 inputForm(), 
              ],
            ),
          )
          
        ],
      ),
    );
  }
  Widget inputForm(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          Text(
            "title",
            style: GoogleFonts.robotoMono(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          
          ),
            SizedBox(height: 10,),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                hintText: "hint text",
              ),
            ),
          ),
          SizedBox(height: 10,)
         ],
      
      ),
    );
  }
 
}
