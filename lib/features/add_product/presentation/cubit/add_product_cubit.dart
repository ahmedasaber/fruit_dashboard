import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());
}
