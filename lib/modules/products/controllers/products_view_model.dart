import '/modules/products/data/products_content.dart';
import '/modules/home/models/corporate_content_models.dart';

class ProductsViewModel {
  List<CorporateInfoCardData> get productCards => ProductsContent.productCards;

  List<CorporateInfoCardData> get valueCards => ProductsContent.valueCards;

  List<CorporateInfoCardData> get aisopsflowCards =>
      ProductsContent.aisopsflowCards;

  List<CorporateInfoCardData> get ragCards => ProductsContent.ragCards;

  List<CorporateInfoCardData> get productFitCards =>
      ProductsContent.productFitCards;

  List<CorporateInfoCardData> get openSourceCards =>
      ProductsContent.openSourceCards;

  List<CorporateMetricData> get metrics => ProductsContent.metrics;
}
