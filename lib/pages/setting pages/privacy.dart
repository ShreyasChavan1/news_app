import 'package:flutter/material.dart';
import 'package:newsapp/pages/setting%20pages/setting_temp.dart';

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      appBar: AppBar(
        title: Text('Privacy Policy', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Effective Date: [Insert Date]',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 20),
              Text(
                '1. Introduction',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'Your privacy is important to us. This Privacy Policy explains how we collect, use, and share your personal information when you use our app.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                '2. Information We Collect',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'We may collect the following types of information:',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '- Personal Information: Name, email address, etc.',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '- Usage Data: Information about how you use the app.',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '- Device Information: Information about your device, such as IP address and browser type.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                '3. How We Use Your Information',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'We use the information we collect for the following purposes:',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '- To provide and maintain our app.',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '- To improve user experience and analyze app usage.',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '- To communicate with you about updates and promotions.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                '4. Data Sharing',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'We do not sell or rent your personal information. We may share your information with third parties in the following situations:',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '- With service providers who assist us in providing the app.',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '- To comply with legal obligations.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                '5. Data Security',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'We take reasonable measures to protect your information from unauthorized access, use, or disclosure.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                '6. Your Rights',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'You have the right to:',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '- Access the personal information we hold about you.',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '- Request corrections to your information.',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '- Delete your information.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                '7. Cookies and Tracking Technologies',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'Our app may use cookies to enhance user experience. You can manage your cookie preferences in your browser settings.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                '8. Changes to This Privacy Policy',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy in the app.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                '9. Contact Us',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'If you have any questions or concerns about this Privacy Policy, please contact us at: [Your Contact Information]',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
