import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Navigation Bar
              _buildTopNavBar(),

              // Stories Section
              _listButton(),

              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(

                  children: [
                    SizedBox(height: 10,),
                    Row(
                    children: const [
                    Icon(Icons.school, size: 24),
                    SizedBox(width: 8),
                    Text(
                      'Program under study',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ],
                    ),

                    // List of courses
                    _buildCourseItem(
                      image: 'assets/mentoring.jpg',
                      title: 'Mentoring and Coaching 1:1',
                      duration: '1 hour',
                      progress: 0.7,
                    ),
                    _buildCourseItem(
                      image: 'assets/admissions.jpg',
                      title: 'Admissions and Scholar',
                      duration: '1 hour',
                      progress: 0.85,
                    ),
                    _buildCourseItem(
                      image: 'assets/multilingual.jpg',
                      title: 'Multilingual Teacher',
                      duration: '1 hour',
                      progress: 0.6,
                    ),
                  ],
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with logo
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung trong Row
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.psychology, // You can replace with your actual logo
                          color: Colors.blue,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'EDC brings it to you',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),


                // Wrap widget for flexible button layout
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    spacing: 12, // horizontal spacing between buttons
                    runSpacing: 12, // vertical spacing between lines
                    children: [
                      _buildNavigationButton('Online course'),
                      _buildNavigationButton('Scholarship'),
                      _buildNavigationButton('Learning diary'),
                      _buildNavigationButton('Numerology'),
                      _buildNavigationButton('Horoscopes'),
                      _buildNavigationButton('Apply for job'),
                      _buildNavigationButton('Blockchain library'),
                      _buildNavigationButton('Study abroad'),
                      _buildNavigationButton('Mining'),
                      _buildNavigationButton('Personal orientation'),
                      _buildNavigationButton('Teacher recruitment'),
                    ],
                  ),
                ),
              ],
            ),
              // Content Feed
              _buildContentFeed(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
  Widget _buildNavigationButton(String label) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
  Widget _buildTopNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/logo04.png"),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _listButton() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Wrap(  // Dùng Wrap để tự động xuống dòng khi cần
        spacing: 8.0,  // Khoảng cách giữa các nút
        runSpacing: 8.0,  // Khoảng cách giữa các hàng (nếu xuống dòng)
        children: [
          Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Image.asset("assets/images/icon/icon05.png"),
                    SizedBox(width:5),
                    Text("New",
                    style: TextStyle(
                      color: Colors.white
                    ),)
                  ],
                ), 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(18, 73, 132, 1),
                      padding: EdgeInsets.only(top:5,bottom:5,left:15,right:15),
                  ),
              ),]
          ),
          Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset("assets/images/icon/icon06.png"),
                      SizedBox(width:5),
                      Text("Join",
                        style: TextStyle(
                            color: Colors.white
                        ),)
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(54, 156, 9, 1),
                    padding: EdgeInsets.only(top:5,bottom:5,left:15,right:15),
                  ),
                ),]
          ),
          Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset("assets/images/icon/icon07.png"),
                      SizedBox(width:5),
                      Text("Schedule",
                        style: TextStyle(
                            color: Colors.white
                        ),)
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(20, 18, 132, 1),
                    padding: EdgeInsets.only(top:5,bottom:5,left:15,right:15),
                  ),
                ),]
          ),
          Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset("assets/images/icon/icon08.png"),
                      SizedBox(width:5),
                      Text("Notes",
                        style: TextStyle(
                            color: Colors.white
                        ),)
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(96, 18, 132, 1),
                    padding: EdgeInsets.only(top:5,bottom:5,left:15,right:15),
                  ),
                ),
              ]
          ),

          Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset("assets/images/icon/icon09.png"),
                      SizedBox(width:5),
                      Text("History",
                        style: TextStyle(
                            color: Colors.white
                        ),)
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(18, 132, 105, 1),
                    padding: EdgeInsets.only(top:5,bottom:5,left:15,right:15),
                  ),
                ),
              ]
          ),
          Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset("assets/images/icon/icon10.png"),
                      SizedBox(width:5),
                      Text("Consulting",
                        style: TextStyle(
                            color: Colors.white
                        ),)
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(18, 132, 105, 1),
                    padding: EdgeInsets.only(top:5,bottom:5,left:15,right:15),
                  ),
                ),
              ]
          ),
        ],
      ),
    );
  }


  Widget _buildContentFeed() {
    return Column(
      children: List.generate(
        5,
            (index) => _buildFeedItem(),
      ),
    );
  }
  Widget _buildCourseItem({
    required String image,
    required String title,
    required String duration,
    required double progress,
  }) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            // Course Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
                // Fallback if image not found
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 120,
                    height: 80,
                    color: Colors.grey[300],
                  );
                },
              ),
            ),
            const SizedBox(width: 16),

            // Course Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Video Duration
                  Row(
                    children: [
                      const Icon(Icons.play_circle_filled,
                          size: 16,
                          color: Colors.black54
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Video',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '• $duration',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Learning Progress Text
                  Text(
                    'Learning progress',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Progress Bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.green[400]!,
                      ),
                      minHeight: 6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }

  Widget _buildFeedItem() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Header
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'User Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '2 hours ago',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Post Content
          const SizedBox(height: 12),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          // Post Actions
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_border),
                  const SizedBox(width: 4),
                  const Text('1.2k'),
                  const SizedBox(width: 16),
                  const Icon(Icons.comment_outlined),
                  const SizedBox(width: 4),
                  const Text('234'),
                ],
              ),
              const Icon(Icons.bookmark_border),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined),
          label: 'Post',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Activity',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}