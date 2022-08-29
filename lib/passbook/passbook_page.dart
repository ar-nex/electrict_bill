import 'package:flutter/material.dart';

class PassbookPage extends StatefulWidget {
  const PassbookPage({Key? key}) : super(key: key);

  @override
  State<PassbookPage> createState() => _PassbookPageState();
}

class _PassbookPageState extends State<PassbookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passbook'),
      ),
      body: const Center(
        child: Text('Passbook'),
      ),
    );
  }
}
