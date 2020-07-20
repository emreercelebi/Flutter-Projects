
class JobExperience {
  final String title;
  final String company;
  final String startDate;
  final String endDate;
  final String location;
  final String description;

  JobExperience({this.title, this.company, this.startDate, this.endDate, this.location, this.description});

  String get dateRow => startDate + ' - ' + endDate;
}