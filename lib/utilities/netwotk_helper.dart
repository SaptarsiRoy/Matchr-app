import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url = "";
  Future<String> runContainer(
      {required String osName,
      required String imgName,
      required int fromPort,
      required int toPort}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else {
      return "Error in running command";
    }
  }

  Future<String> createImage(
      {required String imgUrl,
      required String imgName,
      required String imgTag}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else {
      return "Error in running command";
    }
  }

  Future<String> getContainers() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else {
      return "Error in running command";
    }
  }
}
