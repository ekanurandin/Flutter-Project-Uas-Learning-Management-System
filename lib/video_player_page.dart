import 'package:flutter/material.dart';

class VideoPlayerPage extends StatelessWidget {
  const VideoPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final videos = [
      {
        'title': 'Interaction Design',
        'thumbnail': 'assets/images/video 2.jpg',
      },
      {
        'title': 'Pengantar Desain Antarmuka Pengguna',
        'thumbnail': 'assets/images/video 3.jpg',
      },
      {
        'title': '4 Teori Dasar Desain Antarmuka Pengguna',
        'thumbnail': 'assets/images/video 4.jpg',
      },
      {
        'title': 'Tutorial Dasar Figma – UI/UX Design Software',
        'thumbnail': 'assets/images/video 5.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB74A4A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Video - User Interface Design For Beginner',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ================= VIDEO UTAMA =================
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const FullScreenVideoPage(
                      videoPath: 'assets/images/video 1.jpg',
                    ),
                  ),
                );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'assets/images/video 1.jpg',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Icon(
                    Icons.play_circle_fill,
                    size: 64,
                    color: Colors.white,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// ================= JUDUL LIST =================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Video Lain nya',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// ================= LIST VIDEO =================
            ListView.builder(
              itemCount: videos.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final video = videos[index];
                return _videoListItem(
                  context,
                  video['thumbnail']!,
                  video['title']!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _videoListItem(
    BuildContext context, String thumbnail, String title) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FullScreenVideoPage(videoPath: thumbnail),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          /// THUMBNAIL
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              thumbnail,
              width: 110,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          /// TITLE
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class FullScreenVideoPage extends StatelessWidget {
  final String videoPath;

  const FullScreenVideoPage({super.key, required this.videoPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Image.asset(videoPath, fit: BoxFit.contain),
      ),
    );
  }
}