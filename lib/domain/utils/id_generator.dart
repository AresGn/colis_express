/// Utilitaire pour gé9né9rer des identifiants et des numé9ros de ré9fé9rence
class IdGenerator {
  /// Gé9né8re un ID unique pour une entité9 donneé9e
  static String generateId(String prefix) {
    return '$prefix-${DateTime.now().millisecondsSinceEpoch}';
  }

  /// Gé9né8re un numé9ro de commande au format 'OE[anné9e]-[nombre alé9atoire]'
  static String generateOrderNumber() {
    final year = DateTime.now().year;
    final randomNumber = getRandomNumber(3);
    return 'OE$year-$randomNumber';
  }

  /// Gé9né8re un numé9ro de suivi au format 'CE[anné9e]-[nombre alé9atoire]'
  static String generateTrackingNumber() {
    final year = DateTime.now().year;
    final randomNumber = getRandomNumber(4);
    return 'CE$year-$randomNumber';
  }

  /// Gé9né8re un numé9ro de transaction au format 'TX[anné9e][nombre alé9atoire]'
  static String generateTransactionId() {
    final year = DateTime.now().year;
    final randomNumber = getRandomNumber(6);
    return 'TX$year$randomNumber';
  }

  /// Gé9né8re un nombre alé9atoire de n chiffres
  static String getRandomNumber(int digits) {
    String result = '';
    for (int i = 0; i < digits; i++) {
      result += (DateTime.now().millisecondsSinceEpoch % 10).toString();
    }
    return result;
  }
}
