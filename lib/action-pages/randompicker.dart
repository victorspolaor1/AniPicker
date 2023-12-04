import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:anipicker/model/randomanimes_model.dart';
import 'package:http/http.dart' as http;

Future<List<RandomAnime>> fetchAnime(http.Client client) async {
  final response = await client
    .get(Uri.parse('https://api.jikan.moe/v4/seasons/now'));

    return compute(parseAnime, response.body);
}

List<RandomAnime> parseAnime(String responseBody) {
  final parsed = (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();
  
  return parsed.map<RandomAnime>((json) => RandomAnime.fromJson(json)).toList();
}

class RandomPicker extends StatefulWidget {
  const RandomPicker({Key? key}) : super(key: key);

  @override
  State<RandomPicker> createState() => _RandomPickerState();
}

class _RandomPickerState extends State<RandomPicker> {
  bool showText = false;
  bool showButton = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(22)),
              child: TextButton(
                onPressed: () {
                  showButton = !showButton;
                  FutureBuilder<List<RandomAnime>>(
                    future: fetchAnime(http.Client()),
                    builder: (context, snapshot) {
                      if(snapshot.hasError) {
                        return const Center(
                          child: Text('Error occurred!'),
                        );
                      } else if(snapshot.hasData) {
                        return AnimesList(animes: snapshot.data!);
                      } else {
                        return const Center(child: CircularProgressIndicator(),
                        );
                      }
                    },
                );                 
              },
              child: const Text(
                'Find a new anime for me',
                style: TextStyle(color: Colors.white, fontSize: 20,),
              ),
              ),
            ),
              //ShowText
            const SizedBox(
              height: 20,
            ),
            showButton ? Column (
              children: [
                TextButton(
                onPressed: () {
                  setState(() {
                    showText = false;
                    showButton = false;
                  });
                },
                child: const Text(
                  'Roll again',
                  ),
                ),
              ],
            ) : const Spacer (),
          ],
        ),
      ),
    );
    //throw UnimplementedError();
  }
}

class AnimesList extends StatelessWidget {
  const AnimesList({super.key, required this.animes});

  final List<RandomAnime> animes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: animes.length,
      itemBuilder: (context, index) {
        return Image.network(animes[index].image);
      },
    );
  }
}