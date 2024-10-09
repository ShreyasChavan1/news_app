import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final String pageTitle;
  final Widget bodyContent;

  PageTemplate({required this.pageTitle, required this.bodyContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      appBar: AppBar(
        title: Text(pageTitle, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: bodyContent,
      ),
    );
  }
}
