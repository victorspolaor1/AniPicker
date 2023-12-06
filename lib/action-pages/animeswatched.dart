import 'package:anipicker/global.dart';
import 'package:flutter/material.dart';
import 'package:anipicker/providers/anime.dart';

class AnimeElement {
  String animeName;
  int idAnime;

  AnimeElement(this.animeName, this.idAnime);
}

void main() => runApp(const MaterialApp(home: AnimesWatched()));

class AnimesWatched extends StatefulWidget {
  const AnimesWatched({super.key});

  @override
  createState() => MyAppState();
}

class MyAppState extends State<AnimesWatched> {
  AnimeWatchProvider helper = AnimeWatchProvider.helper;
  //Request anime watched  by user


  final List<AnimeElement> _animeItems = [];
  
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();

  void initState() {

    super.initState();
    var animeList =helper.getWatchedAnime(loggedInUser);
    animeList.then((value) {   
      for (var i = 0; i < value.length; i++) {
        _addAnimeItem(value[i]["animeName"], value[i]["idAnime"]);
      }
    });
  }

  void _addAnimeItem(String task, int id) {
    if (task.isNotEmpty) {
      setState(() {
        _animeItems.add(AnimeElement(task, id));
      });
    }
  }

  void _removeAnimeItem(int index) {
    setState(() => _animeItems.removeAt(index));
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
                  Align(
                    alignment: Alignment.topCenter,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close, 
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 60,
                      child: TextField(
                        controller: _controller,
                        autofocus: true,
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
                    height: 35,
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                      top: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red, borderRadius: BorderRadius.circular(22)),
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
                'Delete',
                style: TextStyle(color: Colors.red, fontSize: 16.5),
              ),
              onPressed: () => 
              {
                helper.deleteWatchedAnime(_animeItems[index].idAnime),
                _removeAnimeItem(index)
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimeWatchedItem() {
    return Expanded(
      child: ListView.builder(
        itemCount: _animeItems.length,
        itemBuilder: (context, index) {
          if (index < _animeItems.length) {
            return _buildEditAnimeWatchedItem(_animeItems[index].animeName, index);
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
              'Watched animes',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
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
                        _addAnimeItem(val, 0);
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
                        onPressed: () async {
                        int idAnime =  (await helper.watchAnime(_controller1.text, loggedInUser));
                        debugPrint(idAnime.toString());
                        _addAnimeItem(_controller1.text, idAnime as int);
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
        ]),
      ),
    );
  }
}