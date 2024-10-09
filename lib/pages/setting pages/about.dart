import 'package:flutter/material.dart';
import 'package:newsapp/pages/setting%20pages/setting_temp.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      appBar: AppBar(
        title: Text('About Us', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About NewsApp',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to NewsApp, your go-to source for the latest news from around the world. We strive to provide our users with up-to-date information and diverse perspectives on various topics, including technology, business, entertainment, sports, and more.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Our Mission',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'At NewsApp, our mission is to empower our users by providing them with reliable and timely news. We believe that informed individuals contribute to a better society, and we aim to foster that knowledge through our platform.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Key Features',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                '- **Personalized News Feed**: Tailor your news experience by choosing categories that interest you.\n'
                '- **Bookmark Articles**: Save your favorite articles to read later.\n'
                '- **Push Notifications**: Stay updated with real-time news alerts.\n'
                '- **User-Friendly Interface**: Navigate easily through our app with a clean and intuitive design.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Our Team',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'Our team consists of passionate journalists, developers, and designers who are committed to delivering quality content and a seamless user experience. We continuously work on improving the app based on user feedback and the latest technological advancements.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Contact Us',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'We love to hear from our users! If you have any questions, feedback, or suggestions, please reach out to us at: [Your Contact Email]',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Thank you for choosing NewsApp. We hope you enjoy using our app as much as we enjoyed building it!',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
