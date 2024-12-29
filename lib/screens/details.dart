import 'package:flutter/material.dart';
import 'package:recipes_app/utils/class.dart';
import 'package:recipes_app/utils/data.dart';
import 'package:recipes_app/utils/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart'; // Import the youtube_player_flutter package

class DetailsPage extends StatefulWidget {
  final Recipe recipe;
  const DetailsPage({super.key, required this.recipe});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final FlutterTts flutterTts = FlutterTts();

  String text = "Hi";

  // Initialize YoutubePlayerController with a YouTube URL (replace with your recipe video URL)
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize YouTube player with the video URL (replace this with your actual video URL)
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.recipe.videoUrl) ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  speak(text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    // Dispose of the controller when done
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              title: Text(widget.recipe.title),
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        Data.toggleBookmarkStatus(widget.recipe);
                      });
                    },
                    icon: Icon(
                      widget.recipe.isBookmarked
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                    ))
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag:
                      'recipe-${widget.recipe.id}', // Use a unique identifier, like 'recipe-1'
                  child: FadeInImage(
                    image: NetworkImage(widget.recipe.imageUrl),
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/images/loading.gif'),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                const Text('Nutrition',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                NutritionWidget(
                  nutrients: widget.recipe.nutrients,
                ),
                const Divider(
                    color: Colors.white, endIndent: 40.0, indent: 40.0),
                const Text('Ingredients',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                IngredientsWidget(
                  ingredients: widget.recipe.ingredients,
                ),
                const Divider(
                    color: Colors.white, endIndent: 40.0, indent: 40.0),

                // Add YouTube video player here
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),

                const Divider(
                    color: Colors.white, endIndent: 40.0, indent: 40.0),

                Row(
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    IconButton(
                        onPressed: () async {
                          text = widget.recipe.steps.join();
                          await speak(text);
                        },
                        icon: const Icon(
                          Icons.volume_up_outlined,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text('Steps',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ],
                ),
                RecipeSteps(
                  steps: widget.recipe.steps,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// The RecipeSteps, IngredientsWidget, and NutritionWidget classes remain the same


class RecipeSteps extends StatelessWidget {
  final List<String> steps;
  const RecipeSteps({super.key, this.steps = const []});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: steps.length,
      padding: const EdgeInsets.all(0.0),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Text('${index + 1}',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            title: Text(steps[index],
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)));
      },
    );
  }
}

class IngredientsWidget extends StatelessWidget {
  final List<String>? ingredients;
  const IngredientsWidget({super.key, this.ingredients});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        itemCount: ingredients!.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              label: Text(ingredients![index],
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}

class NutritionWidget extends StatelessWidget {
  final List<Nutrients>? nutrients;
  const NutritionWidget({super.key, this.nutrients});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      width: double.infinity,
      child: Center(
        child: ListView.builder(
          itemCount: nutrients!.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return CircleIndicator(
              percent: nutrients![index].percent,
              nutrient: nutrients![index],
            );
          },
        ),
      ),
    );
  }
}
