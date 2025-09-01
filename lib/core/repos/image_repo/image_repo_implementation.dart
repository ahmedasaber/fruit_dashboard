import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failures.dart';
import 'package:fruit_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruit_dashboard/core/services/storage_service.dart';
import 'package:fruit_dashboard/core/utils/backend_endpoints.dart';

class ImageRepoImpl implements ImageRepo{
  final StorageService storageService;

  ImageRepoImpl({required this.storageService});
  @override
  Future<Either<Failure, String>> uploadImage(File imageFile) async{
    try {
      String url = await storageService.uploadFile(imageFile, BackendEndpoints.imagesPath);
      return right(url);
    } on Exception {
      return left(ServerFailure('Failed to upload image'));
    }
  }
  
}