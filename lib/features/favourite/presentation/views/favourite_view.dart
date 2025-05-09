import 'package:ev_charging/core/cubits/cubit/stations_cubit.dart';
import 'package:ev_charging/core/repos/stations_repo/stations_repo.dart';
import 'package:ev_charging/core/services/get_it_service.dart';
import 'package:ev_charging/features/favourite/presentation/views/widgets/favourite_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: BlocProvider(
        create: (context) => StationsCubit(
          getIt.get<StationsRepo>(),
        ),
        child: const FavouriteViewBody(),
      )),
    );
  }
}
