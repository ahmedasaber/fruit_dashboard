import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruit_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/add_product_input_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productRepo)
    : super(AddProductInitial());
  final ImageRepo imageRepo;
  final ProductRepo productRepo;

  void addProduct(AddProductInputEntity productEntity) async {
    emit(AddProductLoading());
    final result = await imageRepo.uploadImage(productEntity.image);
    result.fold(
      (failure) {
        print('failed image');
        emit(AddProductFailure(message: failure.message));
      },
      (url) async {
        productEntity.imageUrl = url;
        final result = await productRepo.addProduct(productEntity);
        result.fold(
          (failure) {
            print('failed product');
            emit(AddProductFailure(message: failure.message));
          },
          (r) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
