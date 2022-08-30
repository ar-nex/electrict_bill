import 'dart:convert';

import 'package:electrict_bill/utils/user_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:electrict_bill/utils/constants.dart' as constants;
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  SharedPreferences? _prefs;
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _invalidMobile = false;
  bool _invalidPassword = false;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    initLogin();
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void initLogin() async {
    _prefs = await SharedPreferences.getInstance();
    bool hasCredential = _prefs!.getBool("hasLoggedIn") ?? false;
    if (hasCredential) {
      _mobileController.text = _prefs!.getString("mobile")!;
      _passwordController.text = _prefs!.getString("password")!;
    }
  }

  showSnackBar(BuildContext context, String message, bool success) {
    ScaffoldMessenger.of(context).showSnackBar((SnackBar(
      content: Text(message),
      backgroundColor: success ? Colors.green : Colors.red,
    )));
  }

  onLoginPressed() async {
    setState(() {
      _invalidMobile = _mobileController.text.isEmpty;
      _invalidPassword = _passwordController.text.isEmpty;
      if (_invalidMobile || _invalidPassword) {
        _isSubmitting = false;
        return;
      }
      _isSubmitting = true;
    });
    await doLogin();
  }

  Future doLogin() async {
    final response = await http.post(Uri.parse("${constants.apiUrl}login"),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: jsonEncode(<String, String>{
          'mobile': _mobileController.text,
          'password': _passwordController.text
        }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final respBody = json.decode(response.body);
      bool success = respBody['success'];
      if (success) {
        await UserSecureStorage.setToken(respBody['access_token']);
        _prefs = await SharedPreferences.getInstance();
        _prefs!.setString('mobile', _mobileController.text);
        _prefs!.setString('password', _passwordController.text);
        _prefs!.setBool('isLoggedIn', true);
        _prefs!.setString('usertype', respBody['usertype']);
        _prefs!.setString('name', respBody['name']);
        _prefs!.setInt('userId', respBody['id']);
        Navigator.pushReplacementNamed(context, 'home');
      } else {
        setToInvalid();
        showSnackBar(context, "Invalid username or password", false);
      }
    } else {
      setToInvalid();
      showSnackBar(context, "Login failed.", false);
    }
  }

  setToInvalid() {
    setState(() {
      _invalidMobile = true;
      _invalidPassword = true;
      _isSubmitting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: _mobileController,
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    errorText: _invalidMobile ? 'Invalid Mobile' : null,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    errorText: _invalidPassword ? 'Invalid Password' : null,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_isSubmitting) return;
                      await onLoginPressed();
                      // _prefs = await SharedPreferences.getInstance();
                      // _prefs?.setString('userType', 'admin');
                      // Navigator.pushReplacementNamed(context, 'home');
                    },
                    child: _isSubmitting
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Login'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
