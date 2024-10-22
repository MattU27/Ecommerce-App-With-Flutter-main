import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'products_display_state.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase useCase;
  
  ProductsDisplayCubit({required this.useCase}) : super(ProductsInitialState());
  
  void displayProducts({dynamic params}) async {
    emit(ProductsLoading());

    try {
      var returnedData = await useCase.call(params: params);

      if (isClosed) return; // Check if the cubit is closed

      returnedData.fold(
        (error) {
          if (!isClosed) emit(LoadProductsFailure());
        },
        (data) {
          if (!isClosed) emit(ProductsLoaded(products: data));
        }
      );
    } catch (e) {
      if (!isClosed) emit(LoadProductsFailure());
    }
  }

  void displayInitial() {
    emit(ProductsInitialState());
  }
}
