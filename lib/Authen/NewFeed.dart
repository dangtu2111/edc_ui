import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(

          child: SingleChildScrollView(
            child: Column(
              children: [
                // Top Navigation Bar
                _buildTopNavBar(),

                // Stories Section
                _listButton(),

                Container(
                  margin: EdgeInsets.only(top: 16),
                  color: const Color(0xFFF1F1F1),
                  child: Column(

                    children: [
                      SizedBox(height: 10,),
                      Row(
                      children:  [
                        SizedBox(width: 20,),
                        Container(
                          padding:  EdgeInsets.zero,
                          width: 3.0, // Độ rộng của đường kẻ
                          height: 20, // Chiều cao của đường kẻ
                          color: Color(0xFF369c09),
                          // Màu sắc của đường kẻ
                        ),
                      SizedBox(width: 5,),
                      Image.asset("assets/images/logo05.png"),
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
                        image: 'assets/images/image01.png',
                        title: 'Mentoring and Coaching 1:1',
                        duration: '1 hour',
                        progress: 0.7,
                      ),
                      Divider(
                        color: Colors.grey, // Màu sắc của đường kẻ
                        thickness: 1.0,
                        indent: 16,
                        endIndent: 16,// Độ dày của đường kẻ
                        // Khoảng cách từ cạnh phải
                      ),
                      _buildCourseItem(
                        image: 'assets/images/image01.png',
                        title: 'Admissions and Scholar',
                        duration: '1 hour',
                        progress: 0.85,
                      ),
                      Divider(
                        color: Colors.grey, // Màu sắc của đường kẻ
                        thickness: 1.0,
                        indent: 16,
                        endIndent: 16,// Độ dày của đường kẻ
                        // Khoảng cách từ cạnh phải
                      ),
                      _buildCourseItem(
                        image: 'assets/images/image01.png',
                        title: 'Multilingual Teacher',
                        duration: '1 hour',
                        progress: 0.6,
                      ),
                    ],
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(top:16),
                  color:const Color(0xFFF1F1F1) ,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with logo
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung trong Row
                        children: [
                          Container(
                            width:28,
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              shape: BoxShape.circle,

                            ),
                            child: Image.asset("assets/images/icon/icon19.png"),
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
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  color: const Color(0xFFF1F1F1),
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: Image.asset("assets/images/logo05.png"),
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
                ),
                SizedBox(height: 10),
                // Content Feed
                _buildContentFeed(),


              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,

        children: [

          _buildBottomNavBar(),
            Positioned(
              bottom:10,
            // Đẩy nút lên khỏi cạnh dưới
            child: Container(
              width: 100,
              height: 45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF124984), Color(0xFF369C09)], // Màu sắc gradient
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(187), // Làm tròn nút
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2), // Hiệu ứng bóng
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/icon/icon15.png",width: 25,),
                  SizedBox(width: 5),
                  Text(
                    "EDC meet",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
    return Container(
      color: const Color(0xFFF1F1F1),
      child: Column(
        children:[


          Column(
          children: List.generate(
            5,
                (index) => _buildFeedItem(),
          ),
        ),]
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
        color: const Color(0xFFF1F1F1),
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
                      Image.asset("assets/images/icon/video.png",width: 24,),
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
                  Container(
                    width: 150,
                    child: ClipRRect(

                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Color(0xFF124984),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.green[400]!,
                        ),
                        minHeight: 6,
                      ),
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
      color: const Color(0xFFF1F1F1),
      child: Column(
        children:[

          Container(
          padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 16),
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(8),

          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Post Header


              // Post Content
              const SizedBox(height: 12),
              Container(

                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset("assets/images/image.png"),
              ),
              SizedBox(height: 8,),
              Container(
                color: const Color(0xFFF1F1F1),
                child: Text("A teacher’s guide to different types of assessments",style:TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20
                )),
              ),
              // Post Actions
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/icon/icon18.png"),
                      const SizedBox(width: 4),
                      const Text('1.2k'),
                      const SizedBox(width: 16),
                      Image.asset("assets/images/icon/icon17.png"),

                      const SizedBox(width: 4),
                      const Text('50'),
                      const SizedBox(width: 16),

                      Image.asset("assets/images/icon/icon16.png"),
                      const SizedBox(width: 4),
                      const Text('234'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
          const Divider(
            color: Color.fromRGBO(166, 166, 166, 0.41),
            thickness: 1,
            height: 48,
          ),
        ]
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/icon/icon11.png"), // Icon từ asset
          label: 'Home', // Label của item
        ),

        BottomNavigationBarItem(
          icon: Image.asset("assets/images/icon/icon12.png"),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Container(),
          label: 'Meet',
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/icon/icon13.png"),
          label: 'Activity',
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/icon/icon14.png"),
          label: 'Profile',
        ),

      ],
      showSelectedLabels: false, // Tắt nhãn được chọn (tùy chọn)
      showUnselectedLabels: false,
    );

  }
}