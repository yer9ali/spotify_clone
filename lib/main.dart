import 'package:flutter/material.dart';
import 'package:spotify_clone/play_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify Clone',
      theme: ThemeData.dark(),
      home: SpotifyHomeScreen(),
    );
  }
}

class SpotifyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: const Text(
          "Good morning, YB",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: Icon(Icons.menu),
        actions: const <Widget>[
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 20),
          CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/free-photo/young-man-looking-up_155003-10420.jpg'),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Made for You"),
            _buildHorizontalAlbumSection("https://bogatyr.club/uploads/posts/2023-03/thumbs/1679267719_bogatyr-club-p-fon-dlya-muzikalnogo-alboma-foni-vkontakte-4.jpg"),
            _buildSectionTitle("Recently Played"),
            _buildHorizontalAlbumSection("https://bogatyr.club/uploads/posts/2023-03/thumbs/1679267680_bogatyr-club-p-fon-dlya-muzikalnogo-alboma-foni-vkontakte-2.jpg"),
            _buildSectionTitle("Recommended Playlists"),
            _buildHorizontalAlbumSection("https://amiel.club/uploads/posts/2022-03/1647648068_5-amiel-club-p-kartinki-dlya-alboma-muziki-5.jpg"),
            _buildSectionTitle("Popular Playlists"),
            _buildVerticalPlaylistSection(),
            _buildSectionTitle("Top Charts"),
            _buildHorizontalAlbumSection("https://cameralabs.org/media/lab18/03/02/arhiv-muzykalnyh-oblozhek_5.jpg"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Your Library',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildHorizontalAlbumSection(image_url) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 16, right: index == 4 ? 16 : 0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SpotifyPlayerScreen()),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[800],
                    child: Image.network(
                      image_url,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Album ${index + 1}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  Widget _buildVerticalPlaylistSection() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: Container(
            height: 60,
            width: 60,
            color: Colors.grey[800],
            child: Image.network(
              "https://s0.rbk.ru/v6_top_pics/media/img/4/34/755685293132344.jpg",
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            "Playlist ${index + 1}",
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            "Description here",
            style: TextStyle(color: Colors.grey),
          ),
          trailing: Icon(Icons.more_vert, color: Colors.white),
        );
      },
    );
  }
}
