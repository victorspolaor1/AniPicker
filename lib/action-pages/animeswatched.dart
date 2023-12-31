import 'package:flutter/material.dart';
import 'package:anipicker/model/watchedanimes_model.dart';

class AnimeElement {
  String animeName;
  final DateTime timeOfCreation;

  AnimeElement(this.animeName, this.timeOfCreation);
}

void main() => runApp(const MaterialApp(home: AnimesWatched()));

class AnimesWatched extends StatefulWidget {
  const AnimesWatched({super.key});

  @override
  createState() => MyAppState();
}

class MyAppState extends State<AnimesWatched> {
  final List<AnimeElement> _toDoItems = [];
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();

  final List<WatchedAnimes> listWatchedAnimes = [
    WatchedAnimes(id: "AN001", animeWatched: "Kimetsu", date: "02/10/2023"),
    WatchedAnimes(id: 'AN002', animeWatched: "Naruto", date: "03/11/2022")
  ];

  void _addAnimeItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _toDoItems.add(AnimeElement(task, DateTime.now()));
      });
    }
  }

  void _editAnimeItem(String newText, int index) {
    setState(() {
      _toDoItems[index].animeName = newText;
    });
  }

  void _removeAnimeItem(int index) {
    setState(() => _toDoItems.removeAt(index));
  }

  _editDialog(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              padding: const EdgeInsets.all(20),
              height: 180,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 60,
                      child: TextField(
                        controller: _controller,
                        autofocus: true,
                        /*onSubmitted: (val) {
                      _addToDoItem(val);
                      _controller.clear();
                    },*/
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        ),
                      )),
                  Container(
                    height: 65,
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                      top: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red, borderRadius: BorderRadius.circular(22)),
                    child: TextButton(
                      child: const Text(
                        'Edit',
                        style: TextStyle(color: Colors.white, fontSize: 16.5
                        ),
                      ),
                      onPressed: () {
                        _editAnimeItem(_controller.text, index);
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildEditAnimeWatchedItem(String toDoText, int index) {
    return SizedBox(
      child: Container(
        height: 58,
        margin: const EdgeInsets.only(
          left: 22.0,
          right: 22.0,
          bottom: 12,
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Colors.red),
          borderRadius: const BorderRadius.all(Radius.circular(18)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  toDoText,
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {},
              ),
            ),
            TextButton(
              child: const Text(
                'Edit',
                style: TextStyle(color: Colors.red, fontSize: 16.5),
              ),
              onPressed: () => _editDialog(context, index),
            ),
            TextButton(
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red, fontSize: 16.5),
              ),
              onPressed: () => _removeAnimeItem(index),
            ),
          ],
        ),
      ),
    );
  }

  int compareElement(AnimeElement a, AnimeElement b) =>
      a.timeOfCreation.isAfter(b.timeOfCreation) ? -1 : 1;

  Widget _buildAnimeWatchedItem() {
    _toDoItems.sort(compareElement);
    return Expanded(
      child: ListView.builder(
        itemCount: _toDoItems.length,
        itemBuilder: (context, index) {
          if (index < _toDoItems.length) {
            return _buildEditAnimeWatchedItem(_toDoItems[index].animeName, index);
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.red,
            title: const Text(
              'My Anime List',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            height: 60,
            margin: const EdgeInsets.all(22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 10,
                  child: SizedBox(
                    height: double.infinity,
                    child: TextField(
                      controller: _controller1,
                      autofocus: true,
                      onSubmitted: (val) {
                        _addAnimeItem(val);
                        _controller1.clear();
                      },
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Add your watched animes here...',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                      ),
                    ),
                   ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: double.infinity,
                    margin: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Colors.red, borderRadius: BorderRadius.circular(22)),
                      child: TextButton(
                        child: const Text(
                          'ADD',
                          style: 
                          TextStyle(color: Colors.white, fontSize: 16.5),
                        ),
                        onPressed: () {
                                  _addAnimeItem(_controller1.text);
                                  _controller1.clear();
                        FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                  ),
                ),
              ],
            ),
          ),
          _buildAnimeWatchedItem(),
          Column(
            children: List.generate(listWatchedAnimes.length, (index){
              WatchedAnimes animes = listWatchedAnimes[index];
              return Text(animes.animeWatched);
            }),
          ),
        ]),
      ),
    );
  }
}