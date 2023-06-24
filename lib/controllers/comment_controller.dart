import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/comment.dart';

class CommentController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Rx<List<Comment>> _comments = Rx<List<Comment>>([]);
  List<Comment> get comments => _comments.value;

  String _postID = "";

  updatePostId(){
    getComment();
  }

  getComment() async {

  }

  postComment(String commentText) async {
    try {
      if (commentText.isNotEmpty) {
        Comment comment = Comment(comment: commentText.trim()
        );
        await firestore.collection('').doc(_postID).collection('comments').doc(
            '').set(comment.toJson(),
        );
      }
    } catch (e) {
      Get.snackbar('Error while commenting', e.toString(),);

    }
  }
}