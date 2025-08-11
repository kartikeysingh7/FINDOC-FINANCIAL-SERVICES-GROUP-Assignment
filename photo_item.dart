import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/models/photo.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoItem extends StatelessWidget {
  final Photo photo;
  final double width;

  const PhotoItem({
    super.key,
    required this.photo,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              photo.downloadUrl,
              width: width,
              height: width / photo.aspectRatio,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  width: width,
                  height: width / photo.aspectRatio,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: width,
                  height: width / photo.aspectRatio,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            photo.author,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${photo.width} × ${photo.height}',
            style: GoogleFonts.montserrat(
              color: Colors.grey[700],
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}