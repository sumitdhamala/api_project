
import 'package:api_project/models/products_model.dart';
import 'package:http/http.dart'as http;
class ProductsRepo{
getProducts()async{
  Future <List<ProductsModel>>;
  var response =
            await http.get(Uri.parse("https://fakestoreapi.com/products"));
        if (response.statusCode == 200) {
          return
              productsModelFromJson(response.body);
          
        }
        else{
          throw Expando("Failed to load product");
        }
}
}