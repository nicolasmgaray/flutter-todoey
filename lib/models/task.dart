class Task {
  Task({this.name, this.isDone = false});

  final String name;
  bool isDone;


 toJSONEncodable() {
    Map<String, dynamic> m = new Map();

    m['name'] = name;
    m['isDone'] = isDone;

    return m;
  }

  toggleDone() {
    this.isDone = !this.isDone;
  }
}
