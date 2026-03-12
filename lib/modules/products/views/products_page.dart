import 'package:flutter/material.dart';
import 'widgets/products_sections.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProductsOverviewSection(),
        ProductsValueSection(),
        ProductsMetricsSection(),
        ProductsActionSection(),
      ],
    );
  }
}
