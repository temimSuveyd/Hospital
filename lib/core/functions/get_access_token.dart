import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

Future<String> get_access_token() async {
  final serviceAccountJson = {
    "type": "service_account",
    "project_id": "hospital-714a1",
    "private_key_id": "c21a5397b3b18c26cbfeacd5a680b7a8cb236250",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCjIX3/B9vzZF/0\n0GAmks94Z+SIgwmI/qV7mh4VoIBxPaMT5/v6FZKEyoyKPfBXY4roYBI0Dw+CwhRP\nBeTukr1aBi77iSn25S+YO6wAFs9YoISkCpaeE59t0xTCNrj3euInCkSKEuCyKrAm\n+XR1IygDP0mW4bzSydtzVe4gJec7WiLuKstel34lK6dfWMH1U7niIn3wVyIIcFT6\nmKAewoSC6Poi6Alq1vJOF0s2uifPxq7c/dfmME+oETYJ91lVefJrxygbaO1wFqVh\n4RluxUiAk1k9YAzcajQ3oKIz58RWs2EcDAZj+MENwiqneTExeIoscxm/2WTdSRZj\nqEEqq07tAgMBAAECggEAA+PsADg/gv/ZOE/SLzFP8H2SdL1NQv6xqG+IjqL6f9ja\nCgLoXofZAUDfAPqmVUCFjZz26itpcbNFA+JuhHsBjYNOvQcXILEesAkiRQlGOMVG\njIPydhgeife0oRy9egIXS8TiAA9LBldgG+SAkLzoesqtq627+08+5B1VQF/Zsm+z\ng91pIACITaZO3sgmbgPwbQbdmBpTq2dsr2mnLgs6NUemCpkqkHL9KpHVELQZ3DBR\ntFD/lHEqFZE8DvRwQ90vwGH7sStbSbPlD6iurfUT1aP9S1ZxIcXNe1aeMhz5W9Fl\nW6HOvjpWiK1fhf5crZd3/JxpONmJfd4SxFA2/6kawQKBgQDXpJCkdS0BpyJle5uq\nj++yfTEYNrdLK9TMt9C6Us79YxwDCSAjOFsOFGnQTiysmXADLRUd7kAUpzDjG0kq\nXyNRvQYgKap94ZC0mEC0V6X2P0gQJOhrgkAu5bQuHuhFPntYKaM57ajvJ75SNwu2\nqr0SzT0lM6JtJxRaU034Q6kwQQKBgQDBqRSM6qVcrCBnbNiyhmdM/+ovJSfsTv1+\nwpGHhuYmmyYq/1IvVzThauKRqBXRUlh9a3avxK9LadFGaW6+nd520kJnexfAscca\nGK/G+gig7+cKCPaoyI9Xe1IK4w2kZHAiOLgYt5lA2rbzgEQzfLr2SZDAyUusQhrO\nNZCStojzrQKBgQCpiNO+t/C+T+wW5OspWSgVp58lbj8Edl1C5XDQS7I4O+cV6+K8\nTd4oX5whDJTKzYbmuFbVxS3UDu28XwNSsKFP7dAXESrc9K2Tje+w2Qe9ZVr+dkXT\n3/8d37GcYOgzKEBIu9N8A4DBJPnYITawUeN8GKdty/5y2jqCGOQ/vtIRAQKBgQCT\n/cOolD/d++OfZbyLYM5cN00czgYePZbWYZWYvevvIK0gOpDxgHD2uhl+ObbCiWz6\nGz9Nvr4+oRS9/CAXJsk0gCUisxxJsxF1zdu18KjbY7lpH8Ru4yU3MxRVIYHxWJeg\nbzuwF83Tk9AvcJutxOmTAFDQIoPjlXiqkKB0nW022QKBgEl4MmboXJ11AZABgCkI\nvfr42qRk7YMh7DDJDGim6j7O25WIdY1ZWbC5KNAt/8cj53IdFq7UNZYNGwJBHQ01\n/HPRyQAEkI5gmFbmMoKQEpC2htFVQdgUt66vuByhaqMwxpAIYMdGLcT6Yqa7lC0S\nefr8F+oSVE9kdykXfKZaF9Ky\n-----END PRIVATE KEY-----\n",
    "client_email":
        "firebase-adminsdk-fbsvc@hospital-714a1.iam.gserviceaccount.com",
    "client_id": "113837865627633681426",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40hospital-714a1.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  };

  List<String> scopes = [
    "https://www.googleapis.com/auth/userinfo.email",
    "https://www.googleapis.com/auth/firebase.database",
    "https://www.googleapis.com/auth/firebase.messaging"
  ];

  http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

  auth.AccessCredentials credentials =
      await auth.obtainAccessCredentialsViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
          scopes,
          client);
  client.close();

final String accessToken = credentials.accessToken.data;


 if (accessToken.isNotEmpty) {
   return accessToken;
 }else {
  return "access token is empty";
 }
}
