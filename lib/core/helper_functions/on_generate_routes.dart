import 'package:flutter/material.dart';
import 'package:fruit_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruit_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings){
  switch(settings.name){
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context)=> const DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context)=> const AddProductView());
    default:
      return MaterialPageRoute(builder: (context)=> const Scaffold());
  }
}