import 'package:equatable/equatable.dart';

class TaskType extends Equatable {
  String title;
  int icon;
  String color;
  int id;

  TaskType({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
  });

  TaskType copyWith ({
    int? id,
    String? title,
    int? icon,
    String? color,

  }) => TaskType (
    id: id ?? this.id,
    title: title ?? this.title,
    icon: icon ?? this.icon,
    color: color ?? this.color,
  );

  factory TaskType.fromJson(Map<String, dynamic> json) => TaskType(
    id: json['id'],
    title: json['title'],
    icon: json['icon'],
    color: json['color'],
  );

  Map<String, dynamic> toJson() => {
      'title': title,
      'icon': icon,
      'color': color,
  };

  set setIcon(int icon) {
    icon = icon;
  }
  @override
  // TODO: implement props
  List<Object?> get props => [id, title, icon, color];
}