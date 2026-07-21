import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  double? interest;
  double? total;

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  void calculate() {
    // Hide keyboard when calculate is tapped
    FocusScope.of(context).unfocus();

    final double? principal = double.tryParse(_controller1.text);
    final double? rate = double.tryParse(_controller2.text);
    final double? time = double.tryParse(_controller3.text);

    if (principal == null || rate == null || time == null || principal <= 0 || rate < 0 || time <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter valid positive numbers for all fields."),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final double calculatedInterest = (principal * rate * time) / 100;

    setState(() {
      interest = calculatedInterest;
      total = principal + calculatedInterest;
    });
  }

  void reset() {
    _controller1.clear();
    _controller2.clear();
    _controller3.clear();
    setState(() {
      interest = null;
      total = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: const Icon(Icons.notes, size: 30, color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, size: 28, color: Colors.white),
            onPressed: reset,
            tooltip: 'Reset',
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.info_outline, size: 28, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 170,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100)),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Fixed Deposit",
                        style: GoogleFonts.robotoMono(
                            fontSize: 35, color: Colors.white),
                      ),
                      Text(
                        "Calculator",
                        style: GoogleFonts.robotoMono(
                            fontSize: 35, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    inputForm(
                      title: "Deposit Amount",
                      controller: _controller1,
                      hintText: "eg: 30000",
                    ),
                    inputForm(
                      title: "Rate of Interest (%)",
                      controller: _controller2,
                      hintText: "eg: 5.5",
                    ),
                    inputForm(
                      title: "Time Period (Years)",
                      controller: _controller3,
                      hintText: "eg: 2",
                    ),
                    const SizedBox(height: 20),

                    /// BUTTONS
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: calculate,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Calculate",
                                  style: GoogleFonts.robotoMono(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: reset,
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Reset",
                                style: GoogleFonts.robotoMono(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    /// RESULT CARD
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(13),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Result:",
                            style: GoogleFonts.robotoMono(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                          const Divider(),
                          const SizedBox(height: 5),
                          Text(
                            "Interest Earned : ${interest != null ? interest!.toStringAsFixed(2) : "0.00"}",
                            style: GoogleFonts.robotoMono(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Total Amount    : ${total != null ? total!.toStringAsFixed(2) : "0.00"}",
                            style: GoogleFonts.robotoMono(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.robotoMono(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                hintText: hintText,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
