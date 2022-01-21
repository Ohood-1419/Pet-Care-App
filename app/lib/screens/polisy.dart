import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Policy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Registration is mandatory to enable application services", textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cambria Math',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "- When you register and use the application, you agree to provide your information that you enter our system when using the application.", textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cambria Math',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "- When you use our application, connect to our services, and create cloud account, we collect content you provided like access logs, access to camera to take or upload photo, use map to present clinic location, calendar, and user language", textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cambria Math',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "The collection and processing of personal data is carried out in accordance with the relevant data protection regulations.", textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cambria Math',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "- The personal information we collect keeps you up to date with the latest software and service updates.", textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cambria Math',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "- The personal information we collect also helps us develop and protect our services and content", textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cambria Math',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "-  Your personal information helps us communicate to send you notifications about updates to the application's terms, conditions, and policies.", textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cambria Math',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "These Content is privacy and there are no other parties that access and sharing user information, Users can not be able to edit and make a request to see their data.", textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cambria Math',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
