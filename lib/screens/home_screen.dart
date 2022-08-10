// ignore_for_file: prefer_const_constructors
import 'package:cinema_g/data/data.dart';
import 'package:flutter/material.dart';
import '../cubit/app_bar/app_bar_cubit.dart';
import '../widgets/widgets.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        context.bloc<AppBarCubit>().setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[850],
          child: const Icon(Icons.cast),
          onPressed: () => print('Cast'),
        ),
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 50.0),
          child: BlocBuilder<AppBarCubit, double>(
              builder: (context, scrollOffset) {
            return CustomAppBar(
              scrolleOffSet: scrollOffset,
            );
          }),
        ),
        body: CustomScrollView(controller: _scrollController, slivers: [
          SliverToBoxAdapter(
              child: ContentHeader(featuredContent: sintelContent)),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: PageStorageKey('previews'),
                title: 'Previews',
                contentList: previews,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 25.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                key: PageStorageKey('myList'),
                title: 'My List',
                contentList: myList,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 25.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                key: PageStorageKey('gebetaOrginal'),
                title: 'Gebeta Orginal',
                contentList: originals,
                isOrginals: true,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 25.0),
            sliver: SliverPadding(
              padding: EdgeInsets.only(bottom: 20.0),
              sliver: SliverToBoxAdapter(
                  child: ContentList(
                    key: PageStorageKey('trending'),
                    title: 'Trending',
                    contentList: trending,
                  ),
                ),
              ),
            ),
        ]));
  }

}
