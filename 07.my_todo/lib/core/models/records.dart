class Records {
  final String id, type, description, priority;

  Records({this.id, this.type, this.description, this.priority});

  Records.fromMap(Map<String, dynamic> snapshot, String id)
      : id = id ?? '',
        type = snapshot['type'] ?? '',
        description = snapshot['description'] ?? '',
        priority = snapshot['priority'];

  toJson() {
    return {
      "Type": type,
      "Description": description,
      "Priority": priority,
    };
  }

  @override
  String toString() => "Record<$description:$type>";
}
