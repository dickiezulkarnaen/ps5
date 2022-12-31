import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ps5_dicky_iskandar_z/app/blocs/main/main_bloc.dart';
import 'package:ps5_dicky_iskandar_z/app/blocs/main/main_event.dart';

import '../blocs/main/main_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _scrollController = ScrollController();
  late final MainBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<MainBloc>();
    _bloc.add(FetchEvent());
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playstation 5'),
      ),
      body: Center(
        child: BlocBuilder<MainBloc, MainState>(
          bloc: _bloc,
          builder: (ctx, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ListView.separated(
                      controller: _scrollController,
                      itemCount: _bloc.hasMorePage ? _bloc.games.length + 1 : _bloc.games.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) => index < _bloc.games.length
                          ? ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: _bloc.games[index].backgroundImage ?? '',
                                  fit: BoxFit.fill,
                                  errorWidget: (ctx, s, d) => Image.asset('assets/images/games.png'),
                                  width: 100,
                                  height: 65,
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${_bloc.games[index].name}',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${_bloc.games[index].released}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    '${_bloc.games[index].metacritic ?? '-'}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ))
                          : const Center(
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            )),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll && _bloc.hasMorePage && _bloc.state is! FetchMoreEvent) _bloc.add(FetchMoreEvent());
  }
}
