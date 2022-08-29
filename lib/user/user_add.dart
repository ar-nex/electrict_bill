import 'package:flutter/material.dart';

class UserAdd extends StatefulWidget {
  const UserAdd({Key? key}) : super(key: key);

  @override
  State<UserAdd> createState() => _UserAddState();
}

class _UserAddState extends State<UserAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Add'),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("User type"),
              Row(
                children: [
                  Radio(
                    value: 'super',
                    groupValue: 'usertype',
                    onChanged: (value) {
                      setState(() {
                        print(value);
                      });
                    },
                  ),
                  const Text('Super Distributor'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'Distributor',
                    groupValue: 'usertype',
                    onChanged: (value) {
                      setState(() {
                        print(value);
                      });
                    },
                  ),
                  const Text('User'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'retailer',
                    groupValue: 'usertype',
                    onChanged: (value) {
                      setState(() {
                        print(value);
                      });
                    },
                  ),
                  const Text('Retailer'),
                ],
              ),
            ]),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Shop Name',
              ),
            ),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Mobile',
              ),
            ),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                labelText: 'PAN Number',
              ),
            ),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                labelText: 'PIN',
              ),
            ),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                labelText: 'District',
              ),
            ),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                labelText: 'State',
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add User'),
                )),
          ]),
        )));
  }
}
