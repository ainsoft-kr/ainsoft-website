import '/modules/home/models/corporate_content_models.dart';
import '/modules/services/data/services_content.dart';

class ServicesViewModel {
  List<SiteCardData> get buildAreas => ServicesContent.buildAreas;

  List<(String, String)> get extendedAreas => ServicesContent.extendedAreas;

  List<SiteSpecData> get modelSpecs => ServicesContent.modelSpecs;

  List<SiteSpecData> get stackSpecs => ServicesContent.stackSpecs;

  List<SiteRepoData> get modelRepos => ServicesContent.modelRepos;

  List<SiteRepoData> get stackRepos => ServicesContent.stackRepos;
}
