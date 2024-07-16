import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AchievementsScreen extends StatelessWidget {
  final List<Achievement> achievements = [
    Achievement(
      title: 'Rookie',
      tasks: [
        'Sell your first item (0/1)',
        'Earn your first dollar (0/1)',
      ],
    ),
    Achievement(
      title: 'Advanced Seller',
      tasks: [
        'Sell 50 items (0/50)',
        'Earn \$1000 (0/1000)',
      ],
    ),
    Achievement(
      title: 'Expert',
      tasks: [
        'Sell 100 items (0/100)',
        'Receive positive feedback from 90% of customers',
        'Invite 10 new sellers to the platform (0/10)',
      ],
    ),
    Achievement(
      title: 'Master Reseller',
      tasks: [
        'Sell 500 items (0/500)',
        'Earn the title of "Top Seller of the Month"',
      ],
    ),
    Achievement(
      title: 'Market Guru',
      tasks: [
        'Sell 1000 items (0/1000)',
        'Receive an award for the highest average customer rating',
        'Help 50 newcomers in the community',
      ],
    ),
  ];

  AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.all(13.0.sp),
          child: SvgPicture.asset(
            'assets/icons/ranking.svg',
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(right: 49.sp),
          child: Text(
            'ACHIEVEMENTS',
            style: TextStyle(
              color: const Color(0xFFE0966D),
              fontWeight: FontWeight.bold,
              fontSize: 19.sp,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0.sp),
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          return AchievementCard(achievement: achievements[index]);
        },
      ),
    );
  }
}

class Achievement {
  final String title;
  final List<String> tasks;

  Achievement({required this.title, required this.tasks});
}

class AchievementCard extends StatelessWidget {
  final Achievement achievement;

  const AchievementCard({super.key, required this.achievement});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            spreadRadius: 1.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.star_border, color: Colors.yellow[700]),
              SizedBox(width: 8.0.w),
              Text(
                achievement.title,
                style: TextStyle(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          ...achievement.tasks.map((task) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(
                  '• $task',
                  style: TextStyle(fontSize: 16.0.sp),
                ),
              )),
        ],
      ),
    );
  }
}
