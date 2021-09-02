import 'package:flutter/material.dart';
import 'package:hear_phone_store/util/routs.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Image.asset(
                  'assets/images/login_image.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 28,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter User Name',
                        labelText: 'User Name',
                      ),
                    ),
                    // SizedBox(
                    //   height: 10.0,
                    // ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(150, 40),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRouts.homeRout);
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
