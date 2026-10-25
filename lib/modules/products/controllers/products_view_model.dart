import '/modules/products/data/products_content.dart';
import '/modules/home/models/corporate_content_models.dart';

class ProductsViewModel {
  List<SiteCardData> get productCards => ProductsContent.productCards;

  List<(String, String, String?)> get adoptionOptions =>
      ProductsContent.adoptionOptions;

  List<SiteSpecData> get aisopsflowSpecs => ProductsContent.aisopsflowSpecs;

  List<SiteSpecData> get ragSpecs => ProductsContent.ragSpecs;

  List<SiteRepoData> get aisopsflowRepos => ProductsContent.aisopsflowRepos;

  List<SiteRepoData> get ragRepos => ProductsContent.ragRepos;
}
