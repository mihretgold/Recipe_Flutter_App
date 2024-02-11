import 'package:flutter/material.dart';
import 'package:recipes_app/screens/create.dart';
import 'package:recipes_app/screens/details.dart';
import 'package:recipes_app/screens/edit.dart';
import 'package:recipes_app/screens/profile.dart';
import 'package:recipes_app/utils/class.dart';
import 'package:recipes_app/utils/data.dart';
import 'package:recipes_app/utils/drawer.dart';
import 'package:recipes_app/utils/userData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<Recipe> searchResults = [];

  FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var body = GestureDetector(
      onTap: () {
        setState(() {
          searchResults = [];
        });
        searchFocusNode.unfocus();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomSearchBar(
            searchController: searchController,
            onSearch: (query) {
              setState(() {
                searchResults = Data.searchRecipes(query);
              });
            },
          ),
          Expanded(
            child: searchResults.isEmpty
                ? Container(
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                    child: GridView.builder(
                        shrinkWrap: false,
                        itemCount: Data.recipes.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              ((MediaQuery.of(context).size.width / 2) / 225),
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
                                              recipe: Data.recipes[index],
                                            )));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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
                                              image: NetworkImage(
                                                  Data.recipes[index].imageUrl),
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
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child:
                                            Data.recipes[index].createdBy !=
                                                    UserData.CurrentUser
                                                ? Container()
                                                : SizedBox(
                                                    height: 30,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        IconButton(
                                                            icon: const Icon(
                                                                Icons.edit),
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) => EditPage(
                                                                        index: Data
                                                                            .recipes[
                                                                                index]
                                                                            .id,
                                                                        title: Data
                                                                            .recipes[
                                                                                index]
                                                                            .title,
                                                                        imgUrl: Data
                                                                            .recipes[
                                                                                index]
                                                                            .imageUrl,
                                                                        stepsList: Data
                                                                            .recipes[
                                                                                index]
                                                                            .steps,
                                                                        ingList: Data
                                                                            .recipes[
                                                                                index]
                                                                            .ingredients,
                                                                        nutList: Data
                                                                            .recipes[index]
                                                                            .nutrients),
                                                                  ));
                                                            }),
                                                        const Spacer(),
                                                        IconButton(
                                                            icon: const Icon(
                                                                Icons.delete),
                                                            onPressed: () {
                                                              setState(() {
                                                                Data.deleteRecipe(
                                                                    Data
                                                                        .recipes[
                                                                            index]
                                                                        .id);
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
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          searchResults[index].title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                recipe: searchResults[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: const Text('Recipes'),
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
      backgroundColor: Theme.of(context).primaryColor,
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreatePage(),
              ));
        },
        tooltip: 'Creat New Recipie',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearch;
  const CustomSearchBar(
      {required this.searchController, required this.onSearch, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        cursorColor: Theme.of(context).colorScheme.onPrimary,
        controller: searchController,
        onChanged: (query) => onSearch(query),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: Color(0XFFD9DADB),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
