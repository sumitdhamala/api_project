import 'package:api_project/services/api_services.dart';
import 'package:flutter/material.dart';

class ApiViewModel extends ChangeNotifier {
  final ApiServices _repo = ApiServices();

  bool isLoading = false;
  List<dynamic> posts = [];

  Future<void> fetchPosts() async {
    try {
      isLoading = true;
      notifyListeners();
      posts = await _repo.getPosts();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> createPost(String title, String body) async {
    try {
      isLoading = true;
      notifyListeners();
      final newPost =
          await _repo.createPost({'title': title, 'body': body, 'userId': 1});
      posts.add(newPost);
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  
  Future<void>updatePost(int id ,String title ,String body)async{
    try{
      isLoading=true;
      notifyListeners();
      final updatePost =await _repo.updatePost(id, {
        "title":title,
        "body":body
      });
      final index =posts.indexWhere((post)=>post['id']==id);
      if(index !=-1) posts[index]=updatePost;

    }catch(e)
    {
      print(e);
    }
    finally{
      isLoading =false;
      notifyListeners();
    }
  }

  Future<void>deletePost(int id)async{
    try{

      isLoading=true;
      notifyListeners();
      await _repo.delectePost(id);
      posts.removeWhere((post)=>post['id']==id);
    }catch(e)
    {
      print(e);
    }finally{
      isLoading =false;
      notifyListeners();
    }
  }
  
}
