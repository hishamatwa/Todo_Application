class TaskModel {
  String? id;
  String taskName;
  String taskDescription;
  bool isdone;
  DateTime date;

  TaskModel(
      {this.id,
      required this.isdone,
      required this.taskName,
      required this.taskDescription,
      required this.date});

  factory TaskModel.fromFireStore(Map<String, dynamic> json) => TaskModel(
      id: json["id"],
      taskName: json["Name"],
      isdone: json["isdone"],
      taskDescription: json["Description"],
      date: DateTime.fromMillisecondsSinceEpoch(json["date"]));

  Map<String, dynamic> toFireStore() =>
      {"id":id, "Name": taskName, "Description": taskDescription, "date": date.millisecondsSinceEpoch,"isdone":isdone};
}
