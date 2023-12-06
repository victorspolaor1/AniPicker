import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RandomPicker extends StatefulWidget {
  const RandomPicker({Key? key}) : super(key: key);

  @override
  State<RandomPicker> createState() => _RandomPickerState();
}

class _RandomPickerState extends State<RandomPicker> {
  bool showButton = false;
  bool showText = false;
  String? title;
  int? episodes;
  String? rating;
  String? imageUrl;

  Future<void> doRandom() async {
    final dio = Dio();

    final response = await dio.get('https://api.jikan.moe/v4/random/anime');

    // Check if the response status is okay (200)
    if (response.statusCode == 200) {
      final responseData = response.data;
      final data = responseData['data'];

      // Get Title
      title = data['title'] as String?;
      // Get Episodes
      episodes = data['episodes'] as int?;
      // Get Rating
      rating = data['rating'] as String?;
      // Get Image URL
      imageUrl = data['images']['jpg']['image_url'] as String?;
      
      setState(() {
        showText = true;
      });
    } else {
      print('${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(22)),
              child: TextButton(
                onPressed: () {
                  showButton = !showButton;
                  doRandom();
                },
                child: const Text(
                  'Find a new anime for me',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (showText)
              Column(
                children: [
                  if (imageUrl != null)
                    Image.network(
                      imageUrl!,
                      width: 300,
                      height: 250,
                      fit: BoxFit.scaleDown,
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ListTile(
                          title: Text(
                            'Title',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(title ?? 'N/A'),
                        ),
                        ListTile(
                          title: Text(
                            'Episodes',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(episodes?.toString() ?? 'N/A'),
                        ),
                        ListTile(
                          title: Text(
                            'Rating',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(rating ?? 'N/A'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 35,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showText = false;
                          showButton = false;
                        });
                      },
                      child: const Text(
                        'Roll again',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            if (!showText)
              const Spacer(),
          ],
        ),
      ),
    );
  }
}