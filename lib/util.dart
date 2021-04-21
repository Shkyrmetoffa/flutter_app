// base64 library
import 'dart:convert' as convert;
import 'dart:io' as Io;

// file related
import 'dart:io';
class Util {
/*
     * Base64 encryption
  */
  static String base64Encode(String data){
    var content = convert.utf8.encode(data);
    var digest = convert.base64Encode(content);
    return digest;
  }
  /*
     * Base64 decryption
  */
  static String base64Decode(String data){
    List<int> bytes = convert.base64Decode(data);
    // Many of the online searches are String.fromCharCodes, this Chinese will be garbled
    //String txt1 = String.fromCharCodes(bytes);
    String result = convert.utf8.decode(bytes);
    return result;
  }

  /*
     * Convert images to Base64 strings via image path
  */
  static image2Base64(String path) {
    final bytes = Io.File(path).readAsBytesSync();
    // String img64 = base64Encode(bytes);

    return UriData.fromBytes(bytes, mimeType: "image/jpg").toString();
  }
  /*
     * Convert image files to Base64 strings
  */
  static imageFile2Base64(File file) async {
    List<int> imageBytes = await file.readAsBytes();
    return convert.base64Encode(imageBytes);
  }

}