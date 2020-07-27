import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class Stack extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Stack();
  }
}

class _Stack extends State<Stack> {
  List<int> stk = new List<int>();
  TextEditingController edit = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal,
          title: Text(
            'STACK',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                textAlign: TextAlign.center,
                controller: edit,
                onEditingComplete: () {
                  setState(() {});
                },
              ),
              Text(edit.text),
              RaisedButton(
                child: Text("PUSH"),
                onPressed: () {
                  stk.add(int.parse(edit.text));
                  setState(() {

                  });
                },
              ),
              RaisedButton(
                child: Text("POP"),
                onPressed: () {
                  try{
                    stk.removeLast();
                  }on RangeError catch(e) {
                    print("Underflow Detected!");
                  }
                  setState(() {

                  });
                },
              ),
              Column(
                children: returnStackElements(),
              )
            ],
          ),
        )
    );
  }
    List<Widget> returnStackElements() {
    List<Widget> ToReturn = [];
    stk.reversed.forEach((element) {
      ToReturn.add(
        Text(
          element.toString()
        )
      );
    });
    return ToReturn;
  }
}