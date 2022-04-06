import 'package:reactive_forms/reactive_forms.dart';

class FsValidators {
  static ValidatorFunction password = Validators.pattern(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z@$!%*#?&\d]{8,}$');
}