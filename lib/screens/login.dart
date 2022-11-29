import 'dart:ui';

import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode.addListener(() {
      setState(() {});
    });
    myFocusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff323a99),
            Color(0xfff988fc),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GetImagContainer(),
            GetContainrBox(),
          ],
        ),
      ),
    );
  }

  Widget GetImagContainer() {
    return Positioned(
      top: 40,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Image(
            image: AssetImage('images/rocket.png'),
          ),
          Container()
        ],
      ),
    );
  }

  Widget GetContainrBox() {
    return Column(
      children: [
        Expanded(child: Container()),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff1c1f2e),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign in to ',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Image(
                        image: AssetImage('images/mood.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44),
                    child: TextFormField(
                      focusNode: myFocusNode2,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: myFocusNode2.hasFocus
                                ? Color(0xfff35383)
                                : Color(0xffc5c5c5),
                            fontSize: 15,
                            fontFamily: 'GM'),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide:
                              BorderSide(color: Color(0xffc5c5c5), width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            width: 3,
                            color: Color(0xfff35383),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44),
                    child: TextFormField(
                      focusNode: myFocusNode,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: myFocusNode.hasFocus
                                ? Color(0xfff35383)
                                : Color(0xffc5c5c5),
                            fontSize: 15,
                            fontFamily: 'GM'),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide:
                              BorderSide(color: Color(0xffc5c5c5), width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            width: 3,
                            color: Color(0xfff35383),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () {},
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    myFocusNode2.dispose();
    super.dispose();
  }
}
