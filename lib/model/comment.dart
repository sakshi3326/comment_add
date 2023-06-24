import 'package:cloud_firestore/cloud_firestore.dart';

class Comment{
  String comment;

  Comment({
    required this.comment,
});

  Map<String,dynamic> toJson() => {
    'comment': comment,

  };

  static Comment fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String,dynamic>;
    return Comment(comment: snapshot['comment']
    );
  }


}