import 'package:flutter/material.dart';

// 전역 리뷰 데이터 리스트
List<Map<String, dynamic>> reviews = [];

class WriteReview extends StatefulWidget {
  const WriteReview({super.key});

  @override
  _WriteReviewState createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  double _rating = 5.0; // 기본 별점 값
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 전달된 영화 데이터 받기
    final Map<String, dynamic> movie =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('영화에 대해 말해주세요.', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 영화 정보 표시
            Row(
              children: [
                Image.asset(
                  movie['image'],
                  fit: BoxFit.cover,
                  height: 100,
                  width: 70,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie['title'],
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(width: 8),
                        Text(
                          '${_rating.toStringAsFixed(1)}',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // 별점 선택 슬라이더
            Text(
              '별점을 선택해주세요:',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Slider(
              value: _rating,
              onChanged: (newRating) {
                setState(() {
                  _rating = newRating;
                });
              },
              min: 0.0,
              max: 10.0,
              divisions: 20,
              label: _rating.toStringAsFixed(1),
              activeColor: Colors.red,
              inactiveColor: Colors.grey,
            ),
            SizedBox(height: 16.0),
            // 리뷰 입력 필드
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _reviewController,
                maxLines: 4,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: '리뷰를 작성해주세요...',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // 완료 버튼
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // 리뷰 데이터 추가
                  reviews.add({
                    'title': movie['title'],
                    'rating': _rating,
                    'comment': _reviewController.text,
                  });

                  Navigator.pop(context); // 이전 화면으로 이동
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                ),
                child: Text('완료', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
