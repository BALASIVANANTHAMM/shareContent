import 'package:flutter/cupertino.dart';

class ShareProvider extends ChangeNotifier {
  late String userName;
  ShareProvider({this.userName = 'Default Name'});
  void changeName({
    required String newName,
  }) async {
    userName = newName;
    notifyListeners();
  }
}
