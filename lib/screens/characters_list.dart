import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/character_list_response.dart';
import 'package:flutter_application_1/remote/queries.dart';
import 'package:flutter_application_1/screens/character_details.dart';
import 'package:flutter_application_1/widgets/banner.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lottie/lottie.dart';

class CharactersList extends StatefulWidget {
  const CharactersList({super.key});

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  int currentPage = 1;
  int totalPages = 5;
  List<Results> characters = [];
  ScrollController controller = ScrollController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.green,
        elevation: 10,
        foregroundColor: Colors.green,
        title: Text(
          "Rick and Morty Characters",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/star-points-stains-effect.jpg"),
                fit: BoxFit.cover)),
        child: Query(
            options: QueryOptions(
              document: gql(MyQueries.getCharacters),
              variables: {'page': currentPage},
            ),
            builder: (result, {fetchMore, refetch}) {
              if (result.isLoading && characters.isEmpty) {
                return Center(
                  child: LottieBuilder.asset(
                    "assets/Animation - 1734480609507.json",
                    height: 150,
                  ),
                );
              }
              if (result.hasException && characters.isEmpty) {
                return Center(
                  child: Text(result.exception.toString()),
                );
              }

              var data = (result.data);

              if (currentPage == 1 && data != null) {
                final info = data['characters']['info'];
                totalPages = info['pages'];
                characters = (CharactersListResponse.fromJson(data)
                        .characters
                        ?.results ??
                    []);
              }

              return NotificationListener(
                child: RefreshIndicator(
                  onRefresh: () async {
                    if (refetch != null) {
                      currentPage = 1;
                      characters = [];
                      isLoading = false;
                      refetch();
                    }
                    return;
                  },
                  child: ListView.builder(
                    controller: controller,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    itemCount: characters.length,
                    itemBuilder: (context, index) {
                      // if (index == characters.length) {
                      //   if (currentPage < totalPages && fetchMore != null) {
                      //     fetchMore(
                      //       FetchMoreOptions(
                      //         variables: {'page': currentPage + 1},
                      //         updateQuery:
                      //             (previousResultData, fetchMoreResultData) {
                      //           final previousCharacters =
                      //               previousResultData!['characters']['results']
                      //                   as List<dynamic>;
                      //           final newCharacters =
                      //               fetchMoreResultData!['characters']['results']
                      //                   as List<dynamic>;

                      //           // Merge old and new character data
                      //           previousCharacters.addAll(newCharacters);

                      //           // Update the total result
                      //           return {
                      //             'characters': {
                      //               'info': fetchMoreResultData['characters']
                      //                   ['info'],
                      //               'results': previousCharacters,
                      //             },
                      //           };
                      //         },
                      //       ),
                      //     );
                      //     currentPage++; // Increment the page number
                      //   }
                      // }
                      Results character = characters[index];
                      return GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CharacterDetails(
                              id: character.id!, name: character.name!),
                        )),
                        child: Hero(
                          tag: character.image!,
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * .45,
                            width: MediaQuery.sizeOf(context).width,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  character.image ?? "",
                                ),
                                fit: BoxFit.fitHeight,
                              ),
                              border: Border.all(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.black.withOpacity(.3),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * .45,
                                  width: MediaQuery.sizeOf(context).width,
                                  color: Colors.black.withOpacity(.3),
                                ),
                                Visibility(
                                    visible: character.status == "Dead",
                                    child: const BannerWidget(label: "Dead")),
                                Positioned(
                                  bottom: 5,
                                  left: 10,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        character.name ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        (character.type ?? "Human") +
                                            (' , ') +
                                            (character.status ?? ""),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                onNotification: (t) {
                  if (t is ScrollEndNotification) {
                    if (controller.position.pixels >=
                            controller.position.maxScrollExtent * .6 &&
                        !isLoading) {
                      if (currentPage < totalPages && fetchMore != null) {
                        isLoading = true;
                        currentPage++;
                        fetchMore(FetchMoreOptions(
                            variables: {'page': currentPage},
                            updateQuery:
                                (previousResultData, fetchMoreResultData) {
                              final newCharacters =
                                  CharactersListResponse.fromJson(
                                      fetchMoreResultData!);

                              characters.addAll(
                                  newCharacters.characters?.results ?? []);
                              isLoading = false;
                              return fetchMoreResultData;
                            }));
                      }
                    }
                  }
                  return true;
                },
              );
            }),
      ),
    );
  }
}
