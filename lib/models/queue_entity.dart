class QueueEntity {
  final String id;
  final String lastName; // 성
  final String sirName; // 이름
  final String phoneNumber;
  final int partySize;

  const QueueEntity({
    required this.id,
    required this.lastName,
    required this.sirName,
    required this.phoneNumber,
    required this.partySize,
  });

  String get maskedFullName {
    // 예: Smith John → S*** J***
    final maskedLast = _maskName(lastName);
    final maskedSir = _maskName(sirName);
    return '$maskedLast $maskedSir';
  }

  String get maskedPhone {
    if (phoneNumber.length < 7) return phoneNumber;
    final prefix = phoneNumber.substring(0, 4);
    final suffix = phoneNumber.substring(phoneNumber.length - 4);
    return '$prefix-***-$suffix';
  }

  String _maskName(String name) {
    if (name.isEmpty) return '';
    if (name.length <= 1) return '*';
    if (name.length == 2) return '${name[0]}*';
    return '${name[0]}${'*' * (name.length - 1)}';
  }
}
