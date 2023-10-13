import 'package:flutter/material.dart';

class SpotifyPlayerScreen extends StatefulWidget {
  @override
  _SpotifyPlayerScreenState createState() => _SpotifyPlayerScreenState();
}

class _SpotifyPlayerScreenState extends State<SpotifyPlayerScreen> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_downward, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://cameralabs.org/media/lab18/03/02/arhiv-muzykalnyh-oblozhek_5.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Believer",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "Imagine Dragons",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          SizedBox(height: 20),
          Slider(
            value: _currentSliderValue,
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
            activeColor: Colors.green,
            inactiveColor: Colors.grey,
            min: 0,
            max: 100,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(Icons.shuffle, color: Colors.white),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.skip_previous, color: Colors.white),
                  onPressed: () {}),
              GestureDetector(
                // замена IconButton на GestureDetector
                onTap: () {
                  // здесь логика воспроизведения
                },
                child: Icon(Icons.play_circle_filled,
                    size: 60, color: Colors.white),
              ),
              IconButton(
                  icon: Icon(Icons.skip_next, color: Colors.white),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.repeat, color: Colors.white),
                  onPressed: () {}),
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
