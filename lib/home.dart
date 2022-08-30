import 'package:electrict_bill/dashboard/admin.dart';
import 'package:electrict_bill/dashboard/distributor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard/retailer.dart';
import 'dashboard/super.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences? _prefs;
  String? _userType;

  @override
  void initState() {
    super.initState();
    _initPage();
  }

  void _logout() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs?.clear();
    Navigator.of(context).pushReplacementNamed('login');
  }

  void _initPage() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _userType = _prefs?.getString('usertype');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Welcome', style: TextStyle(fontSize: 14)),
                Text('User Name'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text('Balance', style: TextStyle(fontSize: 14)),
                Text('Rs. 450'),
              ],
            ),
          ],
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ), //don't specify icon if you want 3 dot menu
            color: Colors.blue,
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text(
                  "Change Password",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
            onSelected: (item) => {
              if (item == 0)
                {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const ChangePassword()))
                }
              else if (item == 1)
                {_logout()}
            },
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    Widget body;
    switch (_userType) {
      case "admin":
        body = const Admin();
        break;
      case "super":
        body = const Super();
        break;
      case "distributor":
        body = const Distributor();
        break;
      case "retailer":
        body = const Retailer();
        break;
      default:
        body = const Text('Unknown user type');
        break;
    }
    return body;
  }
}
