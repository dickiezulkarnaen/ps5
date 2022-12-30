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

  @override
  void initState() {
    context.read<MainBloc>().add(FetchingEvent());
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
          bloc: context.read<MainBloc>(),
          builder: (ctx, state) {
            if (state is LoadedMainState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.games.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) => ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: state.games[index]?.backgroundImage ?? '',
                            width: 100,
                            height: 65,
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${state.games[index]?.name}', style: const TextStyle(fontWeight: FontWeight.bold),),
                            const SizedBox(height: 5,),
                            Text('${state.games[index]?.released}', style: const TextStyle(fontSize: 14),),
                            Text('${state.games[index]?.metacritic ?? '-'}', style: const TextStyle(fontSize: 14),),
                          ],
                        )
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}