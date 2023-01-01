import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ps5_dicky_iskandar_z/app/blocs/detail/detail_bloc.dart';
import 'package:ps5_dicky_iskandar_z/app/blocs/detail/detail_event.dart';
import 'package:ps5_dicky_iskandar_z/app/blocs/detail/detail_state.dart';
import 'package:ps5_dicky_iskandar_z/app/models/game_detail_response.dart';
import 'package:ps5_dicky_iskandar_z/app/models/game_screen_shot_response.dart';
import 'package:ps5_dicky_iskandar_z/app/pages/image_preview_page.dart';
import 'package:ps5_dicky_iskandar_z/utils/collection_util.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();

  static void route(BuildContext context, int? gameId) {
    Navigator.pushNamed(context, '/detail', arguments: gameId);
  }

}

class _DetailPageState extends State<DetailPage> {

  late final DetailBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<DetailBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final gameId = ModalRoute.of(context)!.settings.arguments as int?;
    if (gameId != null) _bloc.add(GetDetailEvent(gameId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Detail'),
      ),
      body: BlocBuilder<DetailBloc, DetailState>(
        bloc: _bloc,
        builder: (ctx, state) {
          if (state is LoadedDetailState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  _nameAndBackgroundSection(context, state.gameDetail.backgroundImage, state.gameDetail.name),
                  _releaseDateAndRatingSection(state.gameDetail.released, state.gameDetail.genres, state.gameDetail.rating),
                  _descriptionAndMoreSection(state.gameDetail),
                  _handleScreenShotsWidget(state),
                  const SizedBox(height: 16,),
                ],
              ),
            );
          } else  {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _nameAndBackgroundSection(BuildContext ctx, String? image, String? name) {
    final width = MediaQuery.of(ctx).size.width;
    final height = width * 60/100;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: double.infinity,
          height: height,
          child: CachedNetworkImage(
            imageUrl: image ?? '',
            placeholder: (ctx, _) => Container(color: Colors.black,),
            errorWidget: (c,e,d) => Image.asset('assets/images/games.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black45
          ),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(name ?? '-',
              style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.white, fontSize: 18.0),),
          ),
        ),
      ],
    );
  }

  Widget _releaseDateAndRatingSection(String? date, List<Genre>? genres, double? rating) {
    final joinedGenres = genres?.map((e) => e.name).join(', ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10,),
        date != null ? Text(date) : const SizedBox(height: 0,),
        date != null ? const SizedBox(height: 5,) : const SizedBox(height: 0,),
        joinedGenres != null ? Text(joinedGenres) : const SizedBox(height: 0,),
        joinedGenres != null ? const SizedBox(height: 5,) : const SizedBox(height: 0,),
        RatingBar.builder(
          initialRating: rating ?? 0,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemSize: 25.0,
          onRatingUpdate: (rating) {},
        ),
      ],
    );
  }

  Widget _labelAndValueItem(String label, String? value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10.0,),
        Text('$label :', style: const TextStyle(fontWeight: FontWeight.bold),),
        const SizedBox(height: 5.0,),
        Text(value ?? '-'),
      ],
    );
  }

  Widget _descriptionAndMoreSection(GameDetailResponse gameDetail) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _labelAndValueItem('Description', gameDetail.descriptionRaw),
          _labelAndValueItem('Developers', gameDetail.developers?.map((e) => e.name).join(', ')),
          _labelAndValueItem('Publishers', gameDetail.publishers?.map((e) => e.name).join(', ')),
        ],
      ),
    );
  }

  Widget _handleScreenShotsWidget(LoadedDetailState state) {
    if (state is LoadedScreenShotState) {
      return _screenShotSection(state.data.results.removeNulls());
    } else if (state is LoadingScreenShotState) {
      return const SizedBox(
        width: double.infinity,
        height: 80,
        child: Center(
          child: SizedBox(width: 25, height: 25, child: CircularProgressIndicator()),
        ),
      );
    } else {
      return const SizedBox(height: 0,);
    }
  }

  Widget _screenShotSection(List<ScreenShot> screenShorts) {
    final notNullScreenShotsImages = screenShorts.map((e) => e.image).toList().removeNulls();
    if (notNullScreenShotsImages.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Screen Shots: ', style: TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          SizedBox(
              height: 80,
              child: ListView.separated(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 5,),
                physics: const ScrollPhysics(),
                itemCount: screenShorts.length,
                itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    onTap: () => ImagePreviewPage.route(context, notNullScreenShotsImages, index),
                    child: CachedNetworkImage(
                      imageUrl: notNullScreenShotsImages[index],
                      fit: BoxFit.fitHeight,
                      errorWidget: (ctx, s, d) => Image.asset('assets/images/games.png'),
                      width: 100,
                      height: 80,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox(
        height: 0,
      );
    }
  }
}
