import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'form/textfield.dart';

class AppBarWidget {
  static PreferredSize bottom() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Divider(
        height: 1.0,
        color: Colors.grey, // Warna divider
      ),
    );
  }

  static PreferredSize search({required TextEditingController controller}) {
    return PreferredSize(
      preferredSize:
          const Size.fromHeight(70.0), // Sesuaikan tinggi yang diinginkan
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: AppTextField(
          controller: controller,
          labelText: "Search",
          validator: (value) => null,
          icon: const Icon(Iconsax.search_normal_outline),
        ),
      ),
    );
  }
}
