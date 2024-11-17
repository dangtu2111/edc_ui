import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CommentScreenPage(),
    );
  }
}

class CommentScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reply"),
        backgroundColor: Colors.white,
        centerTitle: true,
        leadingWidth: 80,
        leading: TextButton(
          onPressed: () {
          },
          child: Text("Cancel", style: TextStyle(color: Colors.blue)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.all(8.0),
              child: CommentItem(
                avatarUrl:
                'https://s3-alpha-sig.figma.com/img/6dcb/c8c3/480d6e7e2be0a73f35a4e7d68e046f85?Expires=1732492800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=npz-7TV9eZLc~2oiDSk74wVCoc3rIs5dO0TJgijMW2PNmmNFBMRl~Yob2ROP2dHtxz32ZKcChxE2CU3WsR0niUcqTZvLwPL2A2QJ17gYEJCuEYJWki~Q5OMsVirMm8xTs5MD0R7N8KuiOtWh6bupy2AhVb~q8wnoj4pA4Z-dFZAwpkTQemdVFHE01f-SZVZRqi3gb69BuLlHB2dp9LpFzbG5AVZOejFHAb263elqHpIzJunpe-B-gjmxB3C5Wh1FHhwByVB7fpvd1VUg52ytHivXbiBmgB-hZDyC7kxv5yv0DdqcS7efXhs3Tv9UmedvvlW9Di65FDhc-48jFQ-8AQ__',
                username: 'Thomas Beckben',
                date: '09 Aug, 2024',
                comment:
                'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
                likes: 9,
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 46.0),
              child: CommentItem(
                avatarUrl:
                'https://s3-alpha-sig.figma.com/img/6dcb/c8c3/480d6e7e2be0a73f35a4e7d68e046f85?Expires=1732492800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=npz-7TV9eZLc~2oiDSk74wVCoc3rIs5dO0TJgijMW2PNmmNFBMRl~Yob2ROP2dHtxz32ZKcChxE2CU3WsR0niUcqTZvLwPL2A2QJ17gYEJCuEYJWki~Q5OMsVirMm8xTs5MD0R7N8KuiOtWh6bupy2AhVb~q8wnoj4pA4Z-dFZAwpkTQemdVFHE01f-SZVZRqi3gb69BuLlHB2dp9LpFzbG5AVZOejFHAb263elqHpIzJunpe-B-gjmxB3C5Wh1FHhwByVB7fpvd1VUg52ytHivXbiBmgB-hZDyC7kxv5yv0DdqcS7efXhs3Tv9UmedvvlW9Di65FDhc-48jFQ-8AQ__',
                username: 'Lily Luna',
                date: '14 hours ago',
                comment: 'Nice!',
                likes: 9,
              ),
            ),

            SizedBox(height: 24.0),
            Padding(
              padding: EdgeInsets.only(left: 46),
              child: CommentItem(
                avatarUrl:
                'https://s3-alpha-sig.figma.com/img/6dcb/c8c3/480d6e7e2be0a73f35a4e7d68e046f85?Expires=1732492800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=npz-7TV9eZLc~2oiDSk74wVCoc3rIs5dO0TJgijMW2PNmmNFBMRl~Yob2ROP2dHtxz32ZKcChxE2CU3WsR0niUcqTZvLwPL2A2QJ17gYEJCuEYJWki~Q5OMsVirMm8xTs5MD0R7N8KuiOtWh6bupy2AhVb~q8wnoj4pA4Z-dFZAwpkTQemdVFHE01f-SZVZRqi3gb69BuLlHB2dp9LpFzbG5AVZOejFHAb263elqHpIzJunpe-B-gjmxB3C5Wh1FHhwByVB7fpvd1VUg52ytHivXbiBmgB-hZDyC7kxv5yv0DdqcS7efXhs3Tv9UmedvvlW9Di65FDhc-48jFQ-8AQ__',
                username: 'Ron Norris',
                date: '10 hours ago',
                comment: 'Yeah, I think so',
                likes: 9,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  final String avatarUrl;
  final String username;
  final String date;
  final String comment;
  final int likes;

  const CommentItem({
    required this.avatarUrl,
    required this.username,
    required this.date,
    required this.comment,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl),
          radius: 20,
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(width: 6.0),
                  Icon(Icons.circle, size: 4.0, color: Colors.grey),
                  SizedBox(width: 10),
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                comment,
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Icon(Icons.favorite_outline, size: 16.0, color: Colors.grey),
                  SizedBox(width: 4.0),
                  Text(
                    '$likes',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 16.0),
                  Icon(Icons.reply_outlined, size: 16.0, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
