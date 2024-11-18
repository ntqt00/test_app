import 'package:flutter/material.dart';
import 'package:mobile_qlcv/core/configs/assets/app_images.dart';

class AppHeaderBar extends StatelessWidget implements PreferredSizeWidget {
  const AppHeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Row(
        children: [
          Image(
            image: AssetImage(AppImages.logoImage),
            height: 30,
          ),
          SizedBox(width: 16),
          Text(
            "QUẢN LÝ CÔNG VIỆC", // Optional title or leave blank if not needed
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 2,
      iconTheme: const IconThemeData(color: Colors.grey),
      actions: const [
        Icon(Icons.notifications),
        SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}
