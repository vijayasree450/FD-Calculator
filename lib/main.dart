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
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();

  double? interest;
  double? total;

  void calculate() {
    double principal = double.parse(_controller1.text);
    double rate = double.parse(_controller2.text);
    double time = double.parse(_controller3.text);

    double calculatedInterest = (principal * rate * time) / 100;

    setState(() {
      interest = calculatedInterest;
      total = principal + calculatedInterest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: Icon(Icons.notes, size: 30, color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.info, size: 30, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(100)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Fixed Deposit",
                        style: GoogleFonts.robotoMono(
                            fontSize: 35, color: Colors.white)),
                    Text("Calculator",
                        style: GoogleFonts.robotoMono(
                            fontSize: 35, color: Colors.white)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 40, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  inputForm(
                      title: "Deposit Amount",
                      controller: _controller1,
                      hintText: "eg: 30000"),
                  inputForm(
                      title: "Rate of Interest",
                      controller: _controller2,
                      hintText: "eg: 5"),
                  inputForm(
                      title: "Time Period (Years)",
                      controller: _controller3,
                      hintText: "eg: 2"),
                  SizedBox(height: 20),

                  /// BUTTON
                  GestureDetector(
                    onTap: calculate,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Calculate",
                          style: GoogleFonts.robotoMono(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  /// RESULT
                  Text("Result:",
                      style: GoogleFonts.robotoMono(fontSize: 20)),
                  SizedBox(height: 10),
                  Text("Interest : ${interest?.toStringAsFixed(2) ?? "0"}",
                      style: GoogleFonts.robotoMono(fontSize: 20)),
                  SizedBox(height: 10),
                  Text("Total : ${total?.toStringAsFixed(2) ?? "0"}",
                      style: GoogleFonts.robotoMono(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputForm({
    required String title,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.robotoMono(
                  fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                hintText: hintText,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
