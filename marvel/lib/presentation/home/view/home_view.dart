import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel/core/enum/sorting_types.dart';
import 'package:marvel/core/enum/status_enum.dart';
import 'package:marvel/core/utils/utils.dart';
import 'package:marvel/di/di.dart';
import 'package:marvel/presentation/home/home.dart';
import 'package:marvel/presentation/home/widgets/sort_line.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late GetListCharactersBloc getListCharactersBloc;

  @override
  void initState() {
    super.initState();

    getListCharactersBloc = getIt<GetListCharactersBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        elevation: 0,
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/logo_marvel_with_background.svg',
                ),
                const SizedBox(height: 48),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: const TextField(
                          cursorColor: Colors.black,
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            prefixIconColor: Colors.black38,
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            width: double.infinity,
                            height: 230,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                    ),
                                    child: const Text(
                                      "SORT BY",
                                      style: TextStyle(
                                        fontFamily: Constants.montserrat,
                                        color: Color(0XFF666666),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )),
                                const Divider(
                                  color: Color(0XFF666666),
                                  indent: 5,
                                  endIndent: 5,
                                ),
                                const Spacer(),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SortLine(
                                      text: 'Name: Ascending',
                                      isSelected: false,
                                      function: () {
                                        getListCharactersBloc.add(
                                          const GetListCharacters(
                                            orderBy: SortingTypes.nameAscending,
                                          ),
                                        );

                                        Navigator.pop(context);
                                      },
                                    ),
                                    SortLine(
                                      text: 'Name: Descending',
                                      isSelected: false,
                                      function: () {
                                        getListCharactersBloc.add(
                                          const GetListCharacters(
                                            orderBy:
                                                SortingTypes.nameDescending,
                                          ),
                                        );

                                        Navigator.pop(context);
                                      },
                                    ),
                                    SortLine(
                                      text: 'Modified: Most recent',
                                      isSelected: false,
                                      function: () {
                                        getListCharactersBloc.add(
                                          const GetListCharacters(
                                            orderBy:
                                                SortingTypes.modifiedAscending,
                                          ),
                                        );

                                        Navigator.pop(context);
                                      },
                                    ),
                                    SortLine(
                                      text: 'Modified: Most old',
                                      isSelected: false,
                                      function: () {
                                        getListCharactersBloc.add(
                                          const GetListCharacters(
                                            orderBy:
                                                SortingTypes.modifiedDescending,
                                          ),
                                        );

                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.filter_list_rounded,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: NotificationListener(
        onNotification: (OverscrollIndicatorNotification notification) {
          notification.disallowIndicator();
          return true;
        },
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            BlocBuilder<GetListCharactersBloc, CharactersState>(
              bloc: getListCharactersBloc..add(const GetListCharacters()),
              builder: (context, state) {
                switch (state.status) {
                  case StatusEnum.success:
                    return SliverToBoxAdapter(
                      child: Column(
                        children: List.generate(
                          state.list!.length,
                          (index) {
                            final stateListIndex = state.list![index];
                            return CustomExpansionTile(
                              stateListIndex: stateListIndex,
                              descriptionIsNotEmpty:
                                  stateListIndex.description.isNotEmpty,
                            );
                          },
                        ),
                      ),
                    );
                  default:
                    return SliverFillRemaining(
                      child: ListView(
                        children: List.generate(
                          11,
                          (index) => Shimmer.fromColors(
                            baseColor: const Color(0XFFF6F6F6),
                            highlightColor: Colors.grey[300]!,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 2),
                              color: Colors.black,
                              height: 56,
                            ),
                          ),
                        ),
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
