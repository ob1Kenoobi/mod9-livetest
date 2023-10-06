import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  String selectedSize = '';

  void _showSnackBar(String size) {
    setState(() {
      selectedSize = size;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Size: $size'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  ElevatedButton _buildButton(String size) {
    return ElevatedButton(
      onPressed: () => _showSnackBar(size),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return selectedSize == size ? Colors.orange : Colors.grey;
          },
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(100.0, 50.0), // Adjust width and height for the desired size
        ),
      ),
      child: Text(
        size,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Selector'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: _buildButton('S'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildButton('M'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildButton('L'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: _buildButton('XL'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildButton('XXL'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildButton('XXXL'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
