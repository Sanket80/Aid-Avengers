import 'package:flutter/material.dart';
import '../../DummyData/dummy_data.dart';
import '../comment_page.dart';

class ArticlesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              color: Colors.black, // Set card background color to black
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            articles[index].title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Set title text color to white
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Add your follow logic here
                          },
                          icon: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white, // Set icon color to white
                              ),
                              SizedBox(width: 4), // Add some space between the icon and the text
                              Text(
                                'Follow',
                                style: TextStyle(
                                  color: Colors.white, // Set text color to white
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 6),
                    Text(
                      'By ${articles[index].author} • ${articles[index].date}',
                      style: TextStyle(
                        color: Colors.grey[400], // Set text color to grey
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      articles[index].content.substring(0, 100) + '...', // Display only first 100 characters as a preview
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          _showFullArticle(context, articles[index].title, articles[index].content);
                        },
                        child: Text(
                          'Read More',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            // Add your like logic here
                          },
                          icon: Icon(
                            Icons.thumb_up,
                            color: Colors.white, // Set icon color to white
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Add your comments logic here
                            Navigator.push(context, MaterialPageRoute(builder:
                            (context) => CommentPage()));
                          },
                          icon: Icon(
                            Icons.comment,
                            color: Colors.white, // Set icon color to white
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Add your bookmark logic here
                          },
                          icon: Icon(
                            Icons.bookmark,
                            color: Colors.white, // Set icon color to white
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showFullArticle(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(content),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
