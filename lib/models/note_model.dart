class NoteModel {
  String id;
  String title;
  String content;
  int backgroundColor;
  String createdAt;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.backgroundColor,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'noteColor': backgroundColor,
    };
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createdAt: json['createdAt'],
      backgroundColor: json['noteColor'],
    );
  }
}
