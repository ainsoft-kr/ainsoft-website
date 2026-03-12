import '/modules/solutions/data/solutions_content.dart';
import '/modules/home/models/corporate_content_models.dart';

class SolutionsViewModel {
  List<CorporateInfoCardData> get solutionCards =>
      SolutionsContent.solutionCards;

  List<CorporateInfoCardData> get aisopsflowCards =>
      SolutionsContent.aisopsflowCards;

  List<CorporateInfoCardData> get ragCards => SolutionsContent.ragCards;

  List<CorporateInfoCardData> get combinedCards =>
      SolutionsContent.combinedCards;

  List<CorporateInfoCardData> get approachCards =>
      SolutionsContent.approachCards;

  List<CorporateMetricData> get deliveryMetrics =>
      SolutionsContent.deliveryMetrics;
}
