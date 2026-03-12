import '/modules/solutions/data/solutions_content.dart';
import '/modules/home/models/corporate_content_models.dart';

class SolutionsViewModel {
  List<CorporateInfoCardData> get solutionCards =>
      SolutionsContent.solutionCards;

  List<CorporateInfoCardData> get approachCards =>
      SolutionsContent.approachCards;

  List<CorporateMetricData> get deliveryMetrics =>
      SolutionsContent.deliveryMetrics;
}
