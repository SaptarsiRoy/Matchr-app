import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url = "http://3.108.185.135/cgi-bin/";
  Future<String> runContainer(
      {required String osName,
      required String imageName,
      required String fromPort,
      required String toPort}) async {
    String createContianerUrl = url +
        'create_container.py?os=$osName&image=$imageName&from=$fromPort&to=$toPort';
    http.Response response = await http.get(Uri.parse(createContianerUrl));
    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else {
      return "Error in running command";
    }
  }

  Future<String> createImage(
      {required String fieldId,
      required String imgName,
      required String tagName}) async {
    String createImageUrl =
        url + 'create_image.py?fieldId=$fieldId&img=$imgName&tag=$tagName';
    http.Response response = await http.get(Uri.parse(createImageUrl));
    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else {
      print(response.statusCode);
      return "Error in running command";
    }
  }

  Future<String> getContainers() async {
    String listContainerUrl = url + 'list_container.py';
    http.Response response = await http.get(Uri.parse(listContainerUrl));
    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else {
      return "Error in running command";
    }
  }
}
