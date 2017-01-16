import 'dart:convert';
import 'src/base64_url_decode.dart' as b64;

Map decode(String token, {bool header: false}) {
  int pos = header == true ? 0 : 1;
  return JSON.decode(b64.decode(token.split('.')[pos]));
}
