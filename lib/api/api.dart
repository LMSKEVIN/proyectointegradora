import 'dart:convert';
import 'package:http/http.dart' as http;


apiDatos() async {
  var url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=28.637734&lon=-106.075330&appid=3ad940d11200dce4bc6f297ea1e6aa90');
  var response = await http.get(url);
    final respuestaJson = json.decode(response.body);
    return respuestaJson;
}




