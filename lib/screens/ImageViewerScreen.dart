import 'package:denta_soft/utils/api_routes.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:denta_soft/models/AttachmentsModel';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

// ignore: must_be_immutable
class ImageViewerScreen extends StatefulWidget {
  List<AttachmentsModel>? sliderImages = [];
  int selectedImage;

  ImageViewerScreen({super.key, this.sliderImages, this.selectedImage = 0});

  @override
  _ImageViewerScreenState createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(
      initialPage: widget.selectedImage,
    );

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(
                  ApiRoutes.patientImagePath +
                      widget.sliderImages![index].attachmentPath,
                ),
                initialScale: PhotoViewComputedScale.contained,
              );
            },
            backgroundDecoration: BoxDecoration(color: Colors.grey[900]),
            onPageChanged: (i) {
              setState(() {
                widget.selectedImage = i;
              });
            },
            itemCount: widget.sliderImages!.length,
            loadingBuilder: (context, event) => Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(
                  value: event == null
                      ? 0
                      : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                ),
              ),
            ),
            // backgroundDecoration: widget.backgroundDecoration,
            pageController: pageController,
            // onPageChanged: onPageChanged,
          ),
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: DotsIndicator(
              dotsCount: widget.sliderImages!.length,
              position: widget.selectedImage.toDouble(),
              decorator: DotsDecorator(
                spacing: const EdgeInsets.all(4.0),
                size: Size(7, 7),
                activeSize: Size(7, 7),
                activeColor: Colors.blue,
                color: Colors.grey,
              ),
            ),
          ),
          Positioned(
            top: 12,
            left: 0,
            child: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  textDirection: TextDirection.ltr,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          // Positioned(
          //   top: 35,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     alignment: Alignment.center,
          //     child: Text(
          //       S.ofpreview(context).,
          //       style: TextStyle(
          //           color: Colors.white,
          //           fontWeight: FontWeight.bold,
          //           fontSize: 20),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
