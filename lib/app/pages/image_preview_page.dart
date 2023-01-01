import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:ps5_dicky_iskandar_z/utils/logger_util.dart';


class ImagePreviewPage extends StatefulWidget {
  const ImagePreviewPage({Key? key}) : super(key: key);

  @override
  State<ImagePreviewPage> createState() => _ImagePreviewPageState();

  static void route(BuildContext context, List<String> items, int selectedIndex) {
    Navigator.pushNamed(context, "/image-preview", arguments: {'items': items, 'index': selectedIndex});
  }
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {

  final _pageController = PageController();

  bool _firstOpen = true;

  late final List<String> _items;
  int selectedIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_firstOpen) {
        _firstOpen = false;
        _pageController.jumpToPage(selectedIndex);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _items = arguments['items'];
    selectedIndex = arguments['index'];
    return Material(
      child: Stack(
        children: [
          PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: CachedNetworkImageProvider(_items[index]),
              initialScale: PhotoViewComputedScale.contained * 1,
              heroAttributes: PhotoViewHeroAttributes(tag: _items[index]),
            );
          },
          pageController: _pageController,
          itemCount: _items.length,
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
          onPageChanged: (i) => Logging.debug('PAGE : $i'),
        ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: IconButton(
              onPressed: (){ Navigator.pop(context); },
              icon: const Icon(Icons.arrow_back_sharp, color: Colors.white,),),
          )
        ],
      ),
    );
  }

  Widget imageWidget(String imageUrl) {
    return PhotoView(
      enableRotation: true,
      imageProvider: NetworkImage(imageUrl),
    );
  }
}
