import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {

    final ButtonStyle style =
    OutlinedButton.styleFrom(
        textStyle: const TextStyle(
            fontSize: 20,
            fontFamily: 'Nunito',),
        primary: Colors.white70,
       );

// ButtonStyle(
//     backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
//   )
    const double horPaddingVal = 50;

    return Scaffold(
      body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xff073617),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 80.0),
                  child: Center(
                      child: Text('Welcome Traveller',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Nunito',
                      ),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: horPaddingVal,
                      vertical: 5),
                  child: OutlinedButton(
                    style: style,
                    onPressed: (){
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text('> I have been here before \n[login]\n'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: horPaddingVal,
                      vertical: 5),
                  child: OutlinedButton(
                    style: style,
                    onPressed: (){
                      Navigator.pushNamed(context, '/new');
                    },
                    child: const Text('> Where am I? \n[new user]\n'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: horPaddingVal,
                    vertical: 5),
                  child: OutlinedButton(
                    style: style,
                    onPressed: (){
                      Navigator.pushNamed(context, '/nav');
                    },
                    child: const Text('> I want to explore \n[nav]\n'),
                  ),
                ),],
            ),
          )),
    );
  }
}
