import 'package:indian_currency_to_word/indian_currency_to_word.dart';

class CommonCalculations {
  int get100YearsAgo() {
    int currentYear = DateTime.now().year;

    return currentYear - 100;
  }

  String less1cr(String amount) {
    int money = int.parse(amount);
    return money > 10000000 ? 'amount should be less than 1 Cr' : '';
  }

  String numberToWords(String amount) {
    double money = double.parse(amount);
    final converter = AmountToWords();
    return converter.convertAmountToWords(money, ignoreDecimal: true);
  }

  String getNewTotal(String oldTotal, String amount) {
    int oldValue = int.parse(oldTotal);
    int money = int.parse(amount);
    int newValue = oldValue + money;

    return newValue.toString();
  }

  String calcTotalExpense(List<dynamic> documentSnapshot) {
    int total = 0;
    for (var doc in documentSnapshot) {
      int amount = int.parse(doc['amount']);
      total = total + amount;
    }
    return total.toString();
  }
}
