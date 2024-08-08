import 'dart:convert';

class TeamLeads {
  final String id;
  final String fullName;
  final String email;

  TeamLeads({
    required this.id,
    required this.fullName,
    required this.email,
});
  static List<TeamLeads>TeamLeadlist=[];
  factory TeamLeads.fromJson(Map<String, dynamic> json){
    return TeamLeads(
        id: json['_id'] ?? '',
        fullName: json['fullName'] ?? '',
        email: json['email'] ?? ''
  );
  }

}