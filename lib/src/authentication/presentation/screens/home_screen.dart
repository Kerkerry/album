import 'package:album/src/authentication/presentation/bloc/album_bloc.dart';
import 'package:album/src/authentication/presentation/widgets/cusstom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  fetchAlbums() {
    context.read<AlbumBloc>().add(const GetAlbumsEvent());
  }

  @override
  void initState() { 
    super.initState();
    fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AlbumBloc, AlbumState>(
      listener: (context, state) {
        if(state is AlbumErrorState){
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Your albums"),
            centerTitle: true,
          ),
          body: state is AlbumsLoadedState?
            const CustomLoader(loaderText: "Fetching album")
          : state is AlbumsLoadedState?
            const Center(child:Text("Loaded successful"))
          :state is AlbumErrorState?
          Center(child:Text("Error: ${state.message}")):const SizedBox.shrink()
          ,
          );
      },
    );
  }
}
