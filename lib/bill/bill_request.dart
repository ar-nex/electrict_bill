import 'package:flutter/material.dart';

class BillRequest extends StatefulWidget {
  const BillRequest({Key? key}) : super(key: key);

  @override
  State<BillRequest> createState() => _BillRequestState();
}

class _BillRequestState extends State<BillRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Request'),
      ),
      body: const Center(
        child: Text('Bill Request'),
      ),
    );
  }
}
