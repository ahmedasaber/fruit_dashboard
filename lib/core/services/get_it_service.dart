import 'package:fruit_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruit_dashboard/core/repos/image_repo/image_repo_implementation.dart';
import 'package:fruit_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_dashboard/core/repos/product_repo/product_repo_implemetation.dart';
import 'package:fruit_dashboard/core/services/database_service.dart';
import 'package:fruit_dashboard/core/services/fire_store_service.dart';
import 'package:fruit_dashboard/core/services/storage_service.dart';
import 'package:fruit_dashboard/core/services/supastorage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(SupaStorageService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<ImageRepo>(
    ImageRepoImpl(storageService: getIt<StorageService>()),
  );
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(databaseService: getIt<DatabaseService>()),
  );
}
