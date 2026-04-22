import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key, required this.Title});

  final String Title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Center(child: Text(Title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            SizedBox(height: 10),
            Text(
              "Work in Progress...",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            Lottie.asset(
              'assets/Animation/coding.json',
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
