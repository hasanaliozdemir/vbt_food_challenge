import 'package:flutter/material.dart';

import '../../../product/widgets/comment_container.dart';

class CommentsPage extends StatelessWidget {
// final List<CommentModel>? commentList;
  CommentsPage({
    Key? key,
    // required this.commentList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              for (int i = 0; i < 5; i++)
                const Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Yorumunuzu ekleyiniz...'),
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }
}
