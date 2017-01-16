import 'dart:html';

_b64DecodeUnicode(str) {
  var rgx = new RegExp(r'(.)');
  return Uri.decodeComponent(window.atob(str).replaceAllMapped(rgx, (m) {
    var p = m[1];
    var code = p.codeUnitAt(0).toRadixString(16).toUpperCase();

    if (code.length < 2) code = '0$code';
    return '%$code';
  }));
}

String decode(String str) {
  var output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw 'Illegal base64url string!"';
  }

  try {
    return _b64DecodeUnicode(output);
  } catch (_) {
    return window.atob(output);
  }
}
