import '/modules/products/data/products_content.dart';
import '/modules/home/models/corporate_content_models.dart';

class ProductsViewModel {
  List<CorporateInfoCardData> get productCards => ProductsContent.productCards;

  List<CorporateInfoCardData> get valueCards => ProductsContent.valueCards;

  List<CorporateMetricData> get metrics => ProductsContent.metrics;
}
