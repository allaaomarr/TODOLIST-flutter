class Tasks {
  int?  id;
  String?  title;
  String?  time;
  String?  date;
  String? status;
  Tasks({this.id ,required this.title, required this.time, required this.date, this.status});
  // to get data
  factory Tasks.fromMap(Map<String,dynamic> json) => Tasks(id : json["id"],title: json["title"], time: json["time"], date: json["date"]);
  Map<String,dynamic> toMap()=>
      {
        "id" : id,
        "title" : title,
        "time" :  time,
        "date" : date,
        "status" : status,
      };
}