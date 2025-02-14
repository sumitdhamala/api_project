import 'package:api_project/models/products_model.dart';
import 'package:api_project/repo/products_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvents, ProductsState> {
  final ProductsRepo productRepo;
  ProductsBloc(this.productRepo) : super(ProductsLoadingStates()) {
    on<ProductsLoadedEvents>((event, emit) async {
      try {
        emit(ProductsLoadingStates());
        var data = await productRepo.getProducts();
        emit(ProductsLoadedStates(data));
      } catch (e) {
        emit(ProductsErrorState(e.toString()));
      }
    });
  }
}
