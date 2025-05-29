/// Utilitaire pour gu00e9nu00e9rer des identifiants et des numu00e9ros de ru00e9fu00e9rence
class IdGenerator {
  /// Gu00e9nu00e8re un ID unique pour une entitu00e9 donneu00e9e
  static String generateId(String prefix) {
    return '$prefix-${DateTime.now().millisecondsSinceEpoch}';
  }

  /// Gu00e9nu00e8re un numu00e9ro de commande au format 'OE[annu00e9e]-[nombre alu00e9atoire]'
  static String generateOrderNumber() {
    final year = DateTime.now().year;
    final randomNumber = getRandomNumber(3);
    return 'OE$year-$randomNumber';
  }

  /// Gu00e9nu00e8re un numu00e9ro de suivi au format 'CE[annu00e9e]-[nombre alu00e9atoire]'
  static String generateTrackingNumber() {
    final year = DateTime.now().year;
    final randomNumber = getRandomNumber(4);
    return 'CE$year-$randomNumber';
  }

  /// Gu00e9nu00e8re un numu00e9ro de transaction au format 'TX[annu00e9e][nombre alu00e9atoire]'
  static String generateTransactionId() {
    final year = DateTime.now().year;
    final randomNumber = getRandomNumber(6);
    return 'TX$year$randomNumber';
  }

  /// Gu00e9nu00e8re un nombre alu00e9atoire de n chiffres
  static String getRandomNumber(int digits) {
    String result = '';
    for (int i = 0; i < digits; i++) {
      result += (DateTime.now().millisecondsSinceEpoch % 10).toString();
    }
    return result;
  }
}
