import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> fcmNotification(String discription) async {
  var headersList = {
    'Accept': '*/*',
    'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
    'Content-Type': 'application/json',
    'Authorization':
        'key=AAAAYNemwKc:APA91bHdC3Zxs9WNQ9IBCoFmXIIDeYrLatBuvY01kT3HPn1aJNFKsJ5D02TEUnDSsPHa2fYLr49jkWSSwBIL0hcm-Z2TjeGqoMrl37_en8cS8vLRFCltSNuIYMRR6mDpFPWEPPeq7yvZ'
  };
  var url = Uri.parse('https://fcm.googleapis.com/fcm/send');

  var body = {
    "to": "/topics/all",
    "notification": {
      "title": "Champion Gem",
      "body": discription,
    }
  };

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);
  req.body = json.encode(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();

  if (res.statusCode >= 200 && res.statusCode < 300) {
    print(resBody);
  } else {
    print(res.reasonPhrase);
  }
}
