import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flex'),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    child: Text('Item 1-Pretty Big'),
                    color: Color.fromARGB(115, 244, 67, 54),
                  ),
                  Container(
                    height: 100,
                    width: 500,
                    child: Text('Item 2'),
                    color: Color.fromARGB(134, 33, 149, 243),
                  ),
                  Container(
                    height: 100,
                    child: Text('Item 3'),
                    color: Color.fromARGB(122, 76, 175, 79),
                  )
                ],
              ),
              Container(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 100,
                      child: Text('Item 1-Pretty Big'),
                      color: Color.fromARGB(115, 244, 67, 54),
                    ),
                    Container(
                      height: 100,
                      width: 500,
                      child: Text('Item 2'),
                      color: Color.fromARGB(134, 33, 149, 243),
                    ),
                    Container(
                      height: 100,
                      child: Text('Item 3'),
                      color: Color.fromARGB(122, 76, 175, 79),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
