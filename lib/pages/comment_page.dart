import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommentPage extends StatelessWidget {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Comment'),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: _buildCommentsList(),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Enter your comment',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                      maxLines: null,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _addComment(context);
                    },
                    icon: Icon(Icons.send, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommentsList() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('comments').orderBy('timestamp', descending: true).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return ListTile(
              title: Text(
                data['comment'],
                style: TextStyle(color: Colors.white), // Set font color to white
              ),
              subtitle: Text(
                _formatTimestamp(data['timestamp']),
                style: TextStyle(color: Colors.grey), // Optional: Set timestamp font color
              ),
            );
          }).toList(),
        );
      },
    );
  }

  String _formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
  }

  void _addComment(BuildContext context) {
    String comment = _commentController.text.trim();
    if (comment.isNotEmpty) {
      FirebaseFirestore.instance.collection('comments').add({
        'comment': comment,
        'timestamp': Timestamp.now(),
      }).then((value) {
        _commentController.clear();
      }).catchError((error) {
        print("Failed to add comment: $error");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add comment. Please try again later.')),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a comment.')),
      );
    }
  }
}
