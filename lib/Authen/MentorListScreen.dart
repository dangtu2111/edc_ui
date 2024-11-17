import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mentor App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MentorListScreen(),
    );
  }
}

class MentorListScreen extends StatelessWidget {
  const MentorListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildCategoryTags(),
          Expanded(
            child: _buildMentorList(),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _buildBottomNavBar(),
          Positioned(
            bottom: 10, // Đẩy nút lên khỏi cạnh dưới
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

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          Image.asset(
            'assets/images/logo04.png',
            height: 30,
            errorBuilder: (context, error, stackTrace) => const Text(
              'EDUCHAIN',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined, color: Colors.black),
              onPressed: () {},
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search by Mentor',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildCategoryTags() {
    final categories = ['Blockchain', 'Code', 'Math', 'Eng'];
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    categories[index],
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMentorList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSectionHeader('Well-Rated Mentor', 'See more'),
        _buildHorizontalMentorList([
          {
            'name': 'Sunny Stance',
            'skills': ['Blockchain', 'Code', 'Math', 'Video'],
            'rating': 4.5,
            'reviews': 123,
            'price': '125.00/1h',
            'imageUrl': 'assets/mentor1.jpg',
          },
          {
            'name': 'Emma Thompson',
            'skills': ['Blockchain', 'Code', 'Math'],
            'rating': 4.7,
            'reviews': 145,
            'price': '130.00/1h',
            'imageUrl': 'assets/mentor4.jpg',
          },
        ]),
        const SizedBox(height: 24),

        _buildSectionHeader('Mentor Good Price', 'See more'),
        _buildHorizontalMentorList([
          {
            'name': 'Sophia Bennett',
            'skills': ['Blockchain', 'Code', 'Math', 'Video'],
            'rating': 4.3,
            'reviews': 98,
            'price': '120.00/1h',
            'imageUrl': 'assets/mentor2.jpg',
          },
          {
            'name': 'Michael Chen',
            'skills': ['Code', 'Math', 'Video'],
            'rating': 4.4,
            'reviews': 112,
            'price': '115.00/1h',
            'imageUrl': 'assets/mentor5.jpg',
          },
        ]),
        const SizedBox(height: 24),

        _buildSectionHeader('Mentor Blockchain', 'See more'),
        _buildHorizontalMentorList([
          {
            'name': 'Alexander Murphy',
            'skills': ['Blockchain', 'Code', 'Math', 'Video'],
            'rating': 4.8,
            'reviews': 156,
            'price': '140.00/1h',
            'imageUrl': 'assets/mentor3.jpg',
          },
          {
            'name': 'Amelia Wilson',
            'skills': ['Blockchain', 'Code'],
            'rating': 4.6,
            'reviews': 134,
            'price': '135.00/1h',
            'imageUrl': 'assets/mentor6.jpg',
          },
        ]),
      ],
    );
  }

  Widget _buildHorizontalMentorList(List<Map<String, dynamic>> mentors) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mentors.length,
        itemBuilder: (context, index) {
          final mentor = mentors[index];
          return Container(
            width: 300,
            margin: const EdgeInsets.only(right: 16),
            child: _buildMentorCard(
              name: mentor['name'],
              skills: List<String>.from(mentor['skills']),
              rating: mentor['rating'],
              reviews: mentor['reviews'],
              price: mentor['price'],
              imageUrl: mentor['imageUrl'],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  action,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.blue,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMentorCard({
    required String name,
    required List<String> skills,
    required double rating,
    required int reviews,
    required String price,
    required String imageUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  child: const Icon(Icons.person),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: skills.map((skill) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          skill,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$rating',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '($reviews reviews)',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items:  [
          BottomNavigationBarItem(
            icon: Container(),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        showSelectedLabels: false, // Tắt nhãn được chọn (tùy chọn)
        showUnselectedLabels: false,
      ),

    );
  }
}