import 'package:flutter/material.dart';
import 'package:rflix/main.dart';

class MyReview extends StatelessWidget {
  const MyReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text('내가 쓴 리뷰', style: TextStyle(color: Colors.white)),
      ),
      body: reviews.isEmpty
          ? Center(
              child: Text(
                '작성된 리뷰가 없습니다.',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.person, color: Colors.white),
                      title: Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 18),
                          SizedBox(width: 4),
                          Text('${review['rating']}',
                              style: TextStyle(color: Colors.white)),
                          SizedBox(width: 8),
                          Text(review['title'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      subtitle: Text(review['comment'],
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
