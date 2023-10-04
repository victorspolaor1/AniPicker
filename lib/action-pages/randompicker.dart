import 'package:flutter/material.dart';


class RandomPicker extends StatefulWidget {
  const RandomPicker({Key? key}) : super(key: key);

  @override
  State<RandomPicker> createState() => _RandomPickerState();
}

class _RandomPickerState extends State<RandomPicker> {
  String dropdownValue1 = 'None';
  String dropdownValue2 = '0';
  String dropdownValue3 = '75+';
  bool showText = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Genre',
              style: TextStyle(fontSize:15),
            ),
            DropdownButton<String>(              
              value: dropdownValue1,              
              items: <String>['Action','Adventure','Romance','Sci-fi','School life','Shounen', 'Seinen', 'Shojo','None']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 15),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue1 = newValue!;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Number of episodes',
              style: TextStyle(fontSize:15),
            ),
            DropdownButton<String>(              
              value: dropdownValue2,              
              items: <String>['12','24','50+','100+','200+','500+', '1000+', 'Airing','0']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 15),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue2 = newValue!;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Age rating',
              style: TextStyle(fontSize:15),
            ),
            DropdownButton<String>(              
              value: dropdownValue3,              
              items: <String>['ALL','16+','17+','18+','75+',]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 15),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue3 = newValue!;
                });
              },
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  showText = !showText;
                });
              },
              child: const Text(
                'Submit',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            showText ? const Text(
              'Demon Slayer (Kimetsu no Yaiba)',
              style: TextStyle(
                fontSize: 25,
                color: Colors.red,
                fontFamily: 'Satisfy-Regular',
                ),
              ) : const Spacer()
          ],
        ),
      ),
    );
    //throw UnimplementedError();
  }
}
  