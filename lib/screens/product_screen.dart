// import 'package:api_project/bloc/products_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ProductScreen extends StatefulWidget {
//   const ProductScreen({super.key});

//   @override
//   State<ProductScreen> createState() => _ProductScreenState();
// }

// class _ProductScreenState extends State<ProductScreen> {
//   @override
//   void initState() {
//     context.read<ProductsBloc>().add(ProductsLoadedEvents());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Product Screen"),
//       ),
//       body: BlocBuilder<ProductsBloc, ProductsState>(
//         builder: (context, state) {
//           if (state is ProductsLoadingStates) {
//             return const Center(
//               child: CircularProgressIndicator.adaptive(),
//             );
//           } else if (state is ProductsLoadedStates) {
//             return ListView.builder(
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading:
//                         Text(state.productsModel[index].category.toString()),
//                   );
//                 });
//           } else if (state is ProductsErrorState) {
//             return Center(
//               child: Text(state.errorMessage),
//             );
//           }
//           return const SizedBox();
//         },
//       ),
//     );
//   }
// }
