import 'package:http/http.dart' as http;
import 'package:recipie_app/recipiesModel.dart';

reciepiesItems() async {
  Uri url = Uri.parse('https://dummyjson.com/recipes');
  var res = await http.get(url);
  try {
    if (res.statusCode == 200) {
      var data = recipiesModelFromJson(res.body);
      return data.recipes;
    } else {
      print("Error Occured");
    }
  } catch (e) {
    print(e.toString);
  }
}
