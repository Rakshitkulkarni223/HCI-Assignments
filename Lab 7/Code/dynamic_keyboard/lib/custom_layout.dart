import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

class CustomLayoutKeys extends VirtualKeyboardLayoutKeys {
  // ignore: non_constant_identifier_names
  late final List Row1;
  // ignore: non_constant_identifier_names
  late final List Row2;
  // ignore: non_constant_identifier_names
  late final List Row3;
  // ignore: non_constant_identifier_names
  late final List Row4;
  CustomLayoutKeys(this.Row1, this.Row2, this.Row3, this.Row4);

  @override
  int getLanguagesCount() => 1;

  @override
  List<List> getLanguage(int index) {
    return EnglishLayout(this.Row1, this.Row2, this.Row3, this.Row4);
  }
}

List<List> EnglishLayout(List Row1, List Row2, List Row3, List Row4) {
  List<List> _englishLayout = [
    Row1,
    Row2,
    Row3,
    Row4,
    [
      VirtualKeyboardKeyAction.Shift,
      '@',
      VirtualKeyboardKeyAction.Space,
      '-',
      '_',
    ]
  ];
  return _englishLayout;
}
