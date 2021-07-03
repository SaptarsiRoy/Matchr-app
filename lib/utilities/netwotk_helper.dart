import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url = "http://13.233.164.87/cgi-bin/";
  Future<String> runContainer(
      {required String osName,
      required String imgName,
      required int fromPort,
      required int toPort}) async {
    String createContianerUrl = url +
        'create_container.py?os={osName}&image={imgName}&from={formPort}&to={toPort}';
    http.Response response = await http.get(Uri.parse(createContianerUrl));
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
    String createImageUrl =
        url + 'create_image.py?url={imgUrl}&img={imgName}&tag={imgTag}';
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
