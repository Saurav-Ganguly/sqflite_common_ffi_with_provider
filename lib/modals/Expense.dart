class Expense {
  final int id;
  final String title;
  final int amount;
  final DateTime date;
  final String category;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  //map to object to map
  Map<String, dynamic> toMap() => {
        'title': title,
        'amount': amount,
        'date': date.toString(),
        'category': category,
      };

  //map to object
  factory Expense.fromString(Map<String, dynamic> value) => Expense(
        id: value['id'],
        title: value['title'],
        amount: value['amount'],
        category: value['category'],
        date: DateTime.parse(value['date']),
      );
}
