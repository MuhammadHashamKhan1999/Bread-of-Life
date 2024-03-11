import 'dart:io';

import 'package:flutter/foundation.dart';

Future<Uint8List> networkImageToByte(String path) async {
  HttpClient httpClient = HttpClient();
  var request = await httpClient.getUrl(Uri.parse(path));
  var response = await request.close();
  Uint8List bytes = await consolidateHttpClientResponseBytes(response);
  return bytes;
}