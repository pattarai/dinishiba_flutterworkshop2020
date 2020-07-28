import 'package:flutter/material.dart';

class Stack extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Stack();
  }

}
class _Stack extends State<Stack> {

  TextEditingController _stackController = new TextEditingController();

  List<int> stack = new List<int>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("STACK"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(child: Text("Enter a number to push")),
            TextFormField(
              controller: _stackController,

            ),
            Padding(padding: EdgeInsets.all(10),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text("PUSH"),
                    color: Colors.tealAccent,
                    onPressed: (){
                      stack.add(int.parse(_stackController.text));
                      print(stack.toString());
                      setState(() {

                      });
                    }
                ),
                Padding(padding: EdgeInsets.all(10),),
                RaisedButton(
                    child: Text("POP"),
                    color: Colors.tealAccent,
                    onPressed: (){
                      stack.removeLast();
                      print(stack.toString());
                      setState(() {

                      });
                    }
                )
              ],
            ),
            Center(child: Text("Elements in the stack are:")),
            Padding(padding: EdgeInsets.all(10),),
            Column(
              children: returnStackElements(),
            )

          ],
        ),
      ),
    );
  }
  List<Widget> returnStackElements(){
    List<Widget> elementsToReturn = [];
    stack.forEach((element) {
      elementsToReturn.add(
          Text(element.toString())
      );
    });
    return elementsToReturn;
  }
}