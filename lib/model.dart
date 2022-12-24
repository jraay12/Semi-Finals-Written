class Note{
  final int? id;
  final String name;
  final String title;
  final String description;


  Note({required this.id, required this.name, required this.title, required this.description});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id: json['id'],
    name: json['name'],
    title: json['title'],
    description: json['description']
  );

  Map<String, dynamic> toJson() =>{
    'id' :id,
    'name' :name,
    'title' :title,
    'description' :description,

  };
}