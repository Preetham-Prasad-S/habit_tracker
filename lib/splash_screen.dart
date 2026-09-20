import 'package:flutter/material.dart';
import 'package:schedule_tracker/features/home/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) {
        return;
      }
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-0.6, -0.6),
            radius: 1.2,
            colors: [
              Color(0xFFFF9A6C),
              Color(0xFFFF7A50),
              Color(0xFFE85D3D),
              Color(0xFFC4432B),
            ],
            stops: [0.0, 0.35, 0.7, 1.0],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Flexible(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      elevation: 0,
                      color: Color.fromRGBO(255, 255, 255, 0.382),
                      margin: EdgeInsets.all(0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ImageIcon(
                          AssetImage("assets/fire_icon.png"),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Habit Tracker",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    Text(
                      "Build momentum, one day at a time",
                      style: TextStyle(
                        color: Color.fromARGB(165, 255, 255, 255),
                      ),
                    ),
                    SizedBox(height: 15),

                    Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color.fromARGB(110, 255, 255, 255),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      elevation: 0,
                      color: Color.fromRGBO(255, 255, 255, 0.261),
                      margin: EdgeInsets.all(0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                          "DAILY MOMENTUM",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        backgroundColor: Color.fromARGB(106, 255, 255, 255),
                        minHeight: 6,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "v1.0.0",
                      style: TextStyle(
                        fontFamily: "Inter",
                        color: Color.fromARGB(169, 255, 255, 255),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 25),
                    SizedBox(
                      width: 130,
                      child: Divider(
                        height: 10,
                        thickness: 6,
                        radius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(71, 255, 255, 255),
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
}
