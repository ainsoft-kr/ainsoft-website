import '/modules/home/models/corporate_content_models.dart';
import '/modules/solutions/data/solutions_content.dart';

class SolutionsViewModel {
  List<SiteScenarioData> get teamScenarios => SolutionsContent.teamScenarios;

  List<(String, String)> get roles => SolutionsContent.roles;
}
