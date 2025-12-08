import 'package:flutter/material.dart';

class Static {
  static String ipconfig = "192.168.137.1";
  static const String cairo = "Cairo";
  static Color basiccolor = const Color.fromARGB(255, 103, 199, 140);
  // static String token =
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjMiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJnaGFsaWFoYXplbTIwMDNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQ2l0aXplbiIsImV4cCI6MTc2NTEyODA1OCwiaXNzIjoiTXlBcHAiLCJhdWQiOiJNeUFwcFVzZXJzIn0.M_907NyejV5enT9GU4c-FWELXSivD-CsLt_3tlKP-ZM";

  static double getheight(BuildContext context, double size) {
    return (MediaQuery.of(context).size.height / 932) * size;
  }

  static double getwidth(BuildContext context, double size) {
    return (MediaQuery.of(context).size.width / 430) * size;
  }

  static void showCustomSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
