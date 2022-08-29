import 'package:electrict_bill/bill/bill_request.dart';
import 'package:electrict_bill/commission/commission_page.dart';
import 'package:electrict_bill/passbook/passbook_page.dart';
import 'package:electrict_bill/rate/rate_page.dart';
import 'package:electrict_bill/report/report_page.dart';
import 'package:electrict_bill/setting/setting_page.dart';
import 'package:electrict_bill/user/user_list.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          IntrinsicHeight(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _userStat(10, "Super \nDistributor", 5004),
                    const VerticalDivider(
                        thickness: 3,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.grey),
                    _userStat(20, "Distributor", 5004),
                    const VerticalDivider(
                        thickness: 3,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.grey),
                    _userStat(70, "Retailer", 55004),
                  ]),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _saleState(40, "Today Sale", context),
              _saleState(330, "Monthly Sale", context),
              _saleState(40000, "Total Sale", context),
            ],
          ),
          const SizedBox(height: 20),
          _commStat(
              Icons.wallet_giftcard_sharp, "Today's", "Wallet Recharge", 5004),
          const SizedBox(height: 5),
          _commStat(Icons.percent_outlined, "Today's", "Commission Pay", 5004),
          const SizedBox(height: 5),
          _commStat(Icons.percent, "Total", "Commission Pay", 5004),
          const SizedBox(height: 20),
          _dashMenu(),
        ]),
      ),
    );
  }

  Container _dashMenu() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
        color: Colors.white,
      ),
      child: GridView.count(
        crossAxisCount: 4,
        primary: false,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          _dashIcon(context, Icons.person, "User"),
          _dashIcon(context, Icons.request_quote, "Bill Request"),
          _dashIcon(context, Icons.report, "Report"),
          _dashIcon(context, Icons.monetization_on_sharp, "Commission"),
          _dashIcon(context, Icons.rate_review, "Rate"),
          _dashIcon(context, Icons.list, "Passbook"),
          _dashIcon(context, Icons.settings, "Setting"),
        ],
      ),
    );
  }
}

GestureDetector _dashIcon(context, IconData icon, String title) {
  return GestureDetector(
    onTap: () {
      switch (title) {
        case "User":
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserList(),
            ),
          );
          break;
        case "Bill Request":
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BillRequest(),
            ),
          );
          break;
        case "Report":
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ReportPage(),
            ),
          );
          break;
        case "Commission":
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CommissionPage(),
            ),
          );
          break;
        case "Rate":
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RatePage(),
            ),
          );
          break;
        case "Passbook":
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PassbookPage(),
            ),
          );
          break;
        case "Setting":
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingPage(),
            ),
          );
          break;
      }
    },
    child: Column(
      children: [
        Icon(icon, size: 40),
        const SizedBox(height: 10),
        Text(title),
      ],
    ),
  );
}

Widget _userStat(int number, String usertype, int balance) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '$number',
        style: const TextStyle(fontSize: 20),
      ),
      Text(
        usertype,
        style: const TextStyle(fontSize: 14),
        textAlign: TextAlign.center,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '₹',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '$balance',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    ],
  );
}

Widget _saleState(int number, String saleType, BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(5),
    width: MediaQuery.of(context).size.width / 4,
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          spreadRadius: 5,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$number',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 3),
        Text(
          saleType,
          style: const TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget _commStat(IconData icon, String subTitle, String title, int amount) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          spreadRadius: 5,
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon),
            const SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subTitle,
                  style: const TextStyle(fontSize: 10),
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        Text(amount.toString(), style: const TextStyle(fontSize: 20)),
      ],
    ),
  );
}
