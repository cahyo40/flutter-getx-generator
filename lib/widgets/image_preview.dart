import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '../themes/colors.dart';
import '../themes/theme.dart';

class ImagePreview extends StatelessWidget {
  final String? imageUrl;
  final String? assetPath;
  final String? filePath;
  final String heroTag;

  final String? description;

  const ImagePreview({
    super.key,
    this.imageUrl,
    this.assetPath,
    this.filePath,
    required this.heroTag,
    required this.description,
  }) : assert(
          (imageUrl != null) ^ (assetPath != null) ^ (filePath != null),
          'Exactly one of imageUrl, assetPath, or filePath must be provided',
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: heroTag,
                    child: PhotoView(
                      imageProvider: _getImageProvider(),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 2.5,
                      backgroundDecoration:
                          const BoxDecoration(color: Colors.black),
                    ),
                  ),
                ),
                Visibility(
                  visible: description!.isNotEmpty,
                  child: SingleChildScrollView(
                    child: Container(
                      height: Get.height * 0.1,
                      width: double.infinity,
                      padding: AppThemes.paddingAll,
                      color: AppColors.background,
                      child: Text(
                        description!,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 24,
              left: 24,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Get.back(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ImageProvider _getImageProvider() {
    if (imageUrl != null) {
      return NetworkImage(imageUrl!);
    } else if (assetPath != null) {
      return AssetImage(assetPath!);
    } else {
      return FileImage(File(filePath!));
    }
  }
}

// Usage examples:
// Network Image:
// ImagePreview(imageUrl: 'https://example.com/image.jpg', heroTag: 'unique_tag')

// Asset Image:
// ImagePreview(assetPath: 'assets/images/photo.jpg', heroTag: 'unique_tag')

// File Image:
// ImagePreview(filePath: '/path/to/image.jpg', heroTag: 'unique_tag')