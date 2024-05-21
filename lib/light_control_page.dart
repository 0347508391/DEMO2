import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ControlLightPage extends StatefulWidget {
  @override
  _ControlLightPageState createState() => _ControlLightPageState();
}

class _ControlLightPageState extends State<ControlLightPage> {
  bool _isLightOn = false;
  final String _arduinoIPAddress = "192.168.101.23"; // Địa chỉ IP của Arduino

  Future<void> _turnOnLight() async {
    await _updateLightStatus(true);
  }

  Future<void> _turnOffLight() async {
    await _updateLightStatus(false);
  }

  Future<void> _updateLightStatus(bool turnOn) async {
    String status = turnOn ? "on" : "off";
    String apiUrl = "http://$_arduinoIPAddress/";

    try {
      final response = await http.post(
        Uri.parse('$apiUrl$status'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          _isLightOn = turnOn;
        });
      } else {
        throw Exception('Failed to update light status');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Light Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _isLightOn
                ? Image.asset(
                    'assets/light_on.png',
                    width: 100,
                    height: 100,
                  )
                : Image.asset(
                    'assets/light_off.jpg',
                    width: 100,
                    height: 100,
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _turnOnLight,
              child: Text('Turn On Light'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                textStyle: TextStyle(fontSize: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _turnOffLight,
              child: Text('Turn Off Light'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                textStyle: TextStyle(fontSize: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
