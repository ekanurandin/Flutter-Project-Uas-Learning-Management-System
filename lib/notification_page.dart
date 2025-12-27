import 'package:flutter/material.dart';

enum NotificationType {
  assignment,
  quiz,
}

class NotificationItem {
  final NotificationType type;
  final String description;
  final String timestamp;

  NotificationItem({
    required this.type,
    required this.description,
    required this.timestamp,
  });
}

// Sample data
final List<NotificationItem> notifications = [
  NotificationItem(
    type: NotificationType.assignment,
    description: 'Anda memiliki tugas baru di mata kuliah Desain UI/UX.',
    timestamp: '2 jam yang lalu',
  ),
  NotificationItem(
    type: NotificationType.quiz,
    description: 'Jadwal ujian akhir semester telah diumumkan.',
    timestamp: '1 hari yang lalu',
  ),
  NotificationItem(
    type: NotificationType.assignment,
    description: 'Nilai tugas Anda untuk Sistem Operasi telah diunggah.',
    timestamp: '3 hari yang lalu',
  ),
  NotificationItem(
    type: NotificationType.quiz,
    description: 'Jangan lupa mengumpulkan tugas sebelum deadline.',
    timestamp: '5 hari yang lalu',
  ),
];

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifikasi',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          thickness: 0.6,
          color: Colors.grey.shade300,
        ),
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ICON
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Icon(
                    item.type == NotificationType.assignment
                        ? Icons.description_outlined
                        : Icons.quiz_outlined,
                    size: 20,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(width: 12),

                // TEXT
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.description,
                        style: const TextStyle(
                          fontSize: 13.5,
                          height: 1.3,
                          color: Colors.black,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.timestamp,
                        style: TextStyle(
                          fontSize: 11.5,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}