class Task {
  int? id;
  String title;
  String description;
  String startingTime;
  String endingTime;
  int isCompleted;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.startingTime,
    required this.endingTime,
    this.isCompleted = 0,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      startingTime: json['startingTime'],
      endingTime: json['endingTime'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'startingTime': startingTime,
      'endingTime': endingTime,
      'isCompleted': isCompleted,
    };
  }
}
