import 'package:semipruebatiempo/data_service.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  late var _response;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _response = null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_response != null)
                  Column(
                    children: [
                      Image.network(_response.iconUrl),
                      Text(
                        '${_response.tempInfo.temperature}'+'º',
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(_response.weatherInfo.description)
                    ],
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                        controller: _cityTextController,
                        decoration: InputDecoration(labelText: 'Ciudad'),
                        textAlign: TextAlign.center),
                  ),
                ),
                ElevatedButton(onPressed: _search, child: Text('Buscar'))
              ],
            ),
          ),
        ));
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);

    /*print(response.cityName);
    print(response.tempInfo.temperature);
    print(response.weatherInfo.description);*/



//  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



  }
}