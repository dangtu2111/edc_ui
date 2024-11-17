import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class BlogDetail extends StatelessWidget {
  const BlogDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlogDetailScreen(),
    );
  }
}

class BlogDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
          },
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                'Back',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {
              Share.share(
                'Share',
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  'https://s3-alpha-sig.figma.com/img/bc28/25b5/4f315af7d0c56104efb422c20c2e1766?Expires=1732492800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=E4p3cAhHtXuBUTK6LpuxcAU72gTzrW9-FtBRTHFZUtYz-IqtwPCezjPHArBo5V4o9SiqY3Kcq8DQ8ps-0u5DbUuQQ806cPVKXGkKiGrLGH3uxN4swB7FQOn7DyY0gHPpA6lUajLlF6vmobrSBDjORiAv7hdPNIt5IGmTP4E7Td9iUH7JGFjnl~-cObHLFSyarYvzvy~faIUSnLUiEUsu0k6BRB5992R-M8QvxGIaMetTPRahJCH2x7wePT8L2ddfQX~VX-PEppFTktkwRucGg5bE62HgCZAk4CMh~j7WgNjUa5~dJHuLGDefkd26lflKSdsrsLGdFW56ODvYbM6Zgg__',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'A teacher’s guide to different types of assessments',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '15 Aug, 2024',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16.0),
              Divider(),
              SizedBox(height: 16.0),
              Text(
                'Content introduction',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Content introduction',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 24.0),
              // Comments Section
              Divider(),
              Text(
                'Comments',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://s3-alpha-sig.figma.com/img/6dcb/c8c3/480d6e7e2be0a73f35a4e7d68e046f85?Expires=1732492800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=npz-7TV9eZLc~2oiDSk74wVCoc3rIs5dO0TJgijMW2PNmmNFBMRl~Yob2ROP2dHtxz32ZKcChxE2CU3WsR0niUcqTZvLwPL2A2QJ17gYEJCuEYJWki~Q5OMsVirMm8xTs5MD0R7N8KuiOtWh6bupy2AhVb~q8wnoj4pA4Z-dFZAwpkTQemdVFHE01f-SZVZRqi3gb69BuLlHB2dp9LpFzbG5AVZOejFHAb263elqHpIzJunpe-B-gjmxB3C5Wh1FHhwByVB7fpvd1VUg52ytHivXbiBmgB-hZDyC7kxv5yv0DdqcS7efXhs3Tv9UmedvvlW9Di65FDhc-48jFQ-8AQ__'),
                    radius: 20,
                  ),
                  SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dale Nguyen',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 360,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Type here your comments',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.emoji_emotions, color: Colors.grey),
                                  onPressed: () {
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.send, color: Colors.grey),
                                  onPressed: () {
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              CommentItem(
                avatarUrl: 'https://s3-alpha-sig.figma.com/img/6dcb/c8c3/480d6e7e2be0a73f35a4e7d68e046f85?Expires=1732492800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=npz-7TV9eZLc~2oiDSk74wVCoc3rIs5dO0TJgijMW2PNmmNFBMRl~Yob2ROP2dHtxz32ZKcChxE2CU3WsR0niUcqTZvLwPL2A2QJ17gYEJCuEYJWki~Q5OMsVirMm8xTs5MD0R7N8KuiOtWh6bupy2AhVb~q8wnoj4pA4Z-dFZAwpkTQemdVFHE01f-SZVZRqi3gb69BuLlHB2dp9LpFzbG5AVZOejFHAb263elqHpIzJunpe-B-gjmxB3C5Wh1FHhwByVB7fpvd1VUg52ytHivXbiBmgB-hZDyC7kxv5yv0DdqcS7efXhs3Tv9UmedvvlW9Di65FDhc-48jFQ-8AQ__',
                username: 'Thomas Beckben',
                date: '09 Aug, 2024',
                comment: 'Lorem ipsum is placeholder text...',
                likes: 9,
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Text(
                  '6 reply',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
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
                  SizedBox(width: 4.0),
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