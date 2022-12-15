import 'package:flutter/widgets.dart';
  
class CustomIcons {
  FFIcons._();

  static const String _sentMoneyFamily = 'SentMoney';
  static const String _recievedMoneyFamily = 'RecievedMoney';

  // icomoon
  static const IconData sentMoney =
      IconData(0xe900, fontFamily: _sentMoneyFamily);

  // recieved_money
  static const IconData recievedMoney =
      IconData(0xe900, fontFamily: _recievedMoneyFamily);
}
