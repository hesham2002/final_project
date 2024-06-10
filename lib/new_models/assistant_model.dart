import 'dart:convert';

Assistant assistantFromJson(String str) => Assistant.fromJson(json.decode(str));

String assistantToJson(Assistant data) => json.encode(data.toJson());

class Assistant {
  String jobId;
  String name;
  dynamic assistantImg;

  Assistant({
    required this.jobId,
    required this.name,
    this.assistantImg,
  });

  factory Assistant.fromJson(Map<String, dynamic> json) => Assistant(
    jobId: json["jobId"],
    name: json["name"],
    assistantImg: json["assistantImg"],
  );

  Map<String, dynamic> toJson() => {
    "jobId": jobId,
    "name": name,
    "assistantImg": assistantImg,
  };
}
