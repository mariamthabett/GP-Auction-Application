import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:philo_task/presentation/widgets/custom_appbar.dart';

/// `PostsView` is a stateful widget that displays a list of posts.
///
/// It uses a `BlocBuilder` to build the list of posts based on the state of the `PostsCubit`.
/// It also has a `ScrollController` that loads more posts when the user scrolls to the end of the list.
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // _loadPosts();
    // _setupScrollListener();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Container(),
      ),
    );
  }

  /// Sets up a scroll listener that loads more posts when the user scrolls to the end of the list.
  // void _setupScrollListener() {
  //   scrollController.addListener(() {
  //     if (scrollController.position.pixels ==
  //         scrollController.position.maxScrollExtent) {
  //       RouterGenerator.postsCubit.state.maybeWhen(
  //         error: (message) => _loadMorePosts(),
  //         orElse: () => _loadMorePosts(),
  //       );
  //     }
  //   });
  // }

  /// Loads the initial posts.

  /// Loads more posts.

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
