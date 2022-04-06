import 'package:open_mail_app/open_mail_app.dart';

class EmailService {
  openEmailApp() async{
    OpenMailAppResult result = await OpenMailApp.openMailApp();
    return result.didOpen || result.canOpen;
  }
}

final emailService = EmailService();