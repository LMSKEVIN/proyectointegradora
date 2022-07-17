class Recados{
  final String title;
  final String description;
  final DateTime date;
  
  const Recados({required this.title, required this.description, required this.date});
  
  Map<String, dynamic> toMap() {
    return ({'title': title, 'description': description, 'date': date});
  }

  Recados.formMap(Map<String, dynamic> map):
  title = map['title'],
  description = map['description'],
  date = map['date'];
}