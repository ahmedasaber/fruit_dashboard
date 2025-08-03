import 'package:fruit_dashboard/core/services/storage_service.dart';
import 'package:fruit_dashboard/core/services/supastorage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt(){
  getIt.registerSingleton<StorageService>(SupaStorage());
}