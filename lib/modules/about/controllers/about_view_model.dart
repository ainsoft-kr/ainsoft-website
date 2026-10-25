import '/modules/about/data/about_content.dart';

class AboutViewModel {
  String get founderName => AboutContent.founderName;

  String get founderRole => AboutContent.founderRole;

  String get founderLocation => AboutContent.founderLocation;

  String get founderEducation => AboutContent.founderEducation;

  List<String> get founderIntroParagraphs =>
      AboutContent.founderIntroParagraphs;

  List<String> get founderCareer => AboutContent.founderCareer;

  String get founderStack => AboutContent.founderStack;

  List<(String, String)> get principles => AboutContent.principles;
}
