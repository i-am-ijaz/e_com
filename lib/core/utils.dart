import 'package:e_com/core/extensions.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> appLunchUrl(String url) async {
  try {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  } catch (e) {
    e.logError();
  }
}

Future<void> showToast(String message) async {
  try {
    await Fluttertoast.showToast(msg: message);
  } catch (e) {
    e.logError();
  }
}
