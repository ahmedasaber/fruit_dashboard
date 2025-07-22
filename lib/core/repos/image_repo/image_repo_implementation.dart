import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failures.dart';
import 'package:fruit_dashboard/core/repos/image_repo/image_repo.dart';

class ImageRepoImpl implements ImageRepo{
  @override
  Future<Either<Failure, String>> uploadImage(File imageFile) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
  
}