import 'package:flutter/material.dart';
import 'package:recipes_app/screens/create.dart';
import 'package:recipes_app/screens/details.dart';
import 'package:recipes_app/screens/edit.dart';
import 'package:recipes_app/screens/home.dart';
import 'package:recipes_app/screens/profile.dart';
import 'package:recipes_app/utils/class.dart';
import 'package:recipes_app/utils/data.dart';
import 'package:recipes_app/utils/drawer.dart';
import 'package:recipes_app/utils/userData.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    List<Recipe> bookmarks =
        Data.recipes.where((element) => element.isBookmarked).toList();

    var body = Container(
      color: Theme.of(context).primaryColor,
      child: GridView.builder(
          shrinkWrap: false,
          itemCount: bookmarks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: ((MediaQuery.of(context).size.width / 2) / 225),
          ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                recipe: bookmarks[index],
                              )));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      children: [
                        Expanded(
                          // width: MediaQuery.of(context).size.width / 2,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Hero(
                              tag: Data.recipes[index].id,
                              child: FadeInImage(
                                image:
                                    NetworkImage(Data.recipes[index].imageUrl),
                                fit: BoxFit.cover,
                                placeholder: const AssetImage(
                                    'assets/images/loading.gif'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            Data.recipes[index].title,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Data.recipes[index].createdBy !=
                                  UserData.CurrentUser
                              ? Container()
                              : SizedBox(
                                  height: 30,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IconButton(
                                          icon: const Icon(Icons.edit),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditPage(
                                                          index: Data
                                                              .recipes[index]
                                                              .id,
                                                          title: Data
                                                              .recipes[index]
                                                              .title,
                                                          imgUrl: Data
                                                              .recipes[index]
                                                              .imageUrl,
                                                          stepsList: Data
                                                              .recipes[index]
                                                              .steps,
                                                          ingList: Data
                                                              .recipes[index]
                                                              .ingredients,
                                                          nutList: Data
                                                              .recipes[index]
                                                              .nutrients),
                                                ));
                                          }),
                                      const Spacer(),
                                      IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            setState(() {
                                              Data.deleteRecipe(
                                                  Data.recipes[index].id);
                                            });
                                          }),
                                      // const Spacer(),
                                    ],
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: const Text('Bookmarked Recipes'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ProfilePage()));
              },
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fvectors%2Fblank-profile-picture-mystery-man-973460%2F&psig=AOvVaw3_BM8jZbHB5LBeWUIxBFOB&ust=1707707666390000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOjevcGpooQDFQAAAAAdAAAAABAE"),
              ),
            ),
          )
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   onPressed: () {},
          // )
        ],
      ),
      drawer: const CustomDrawer(),
      body: body,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => const CreatePage(),
      //         ));
      //   },
      //   tooltip: 'Creat New Recipie',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
