import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:app/config/Colors.dart';

var pinkColor = Colors.pink;

var flume = 'https://i.scdn.co/image/8d84f7b313ca9bafcefcf37d4e59a8265c7d3fff';
var martinGarrix =
    'https://c1.staticflickr.com/2/1841/44200429922_d0cbbf22ba_b.jpg';
var rosieLowe =
    'https://i.scdn.co/image/db8382f6c33134111a26d4bf5a482a1caa5f151c';

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pcolors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), //Resize the searchbar's padding
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 32.0,
            ),
            SearchBar(),
            SizedBox(
              height: 32.0,
            ),
            Text(
              'Collections',
              style: TextStyle(
                  color: Pcolors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 38.0),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: <Widget>[
                CollectionWidget('assets/images/blue.jpg', 'Extremely loud'),
                SizedBox(
                  width: 16.0,
                ),
                CollectionWidget('assets/images/pink.jpg', 'Calm & relaxing'),
              ],
            ),
            SizedBox(
              height: 32.0,
            ),
            Row(
              children: <Widget>[
                CollectionWidget('assets/images/orange.jpg', 'Classical'),
                SizedBox(
                  width: 16.0,
                ),
                CollectionWidget('assets/images/yellow.jpg', 'Old soul'),
              ],
            ),
            SizedBox(
              height: 32.0,
            ),
            Text(
              'Recommend',
              style: TextStyle(
                  color: Pcolors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 38.0),
            ),
            SizedBox(
              height: 16.0,
            ),
            SongWidget('Animals', 'Martin Garrix', 'assets/images/animals.jpg',
                "assets/musics/animals.mp3"),
            SongWidget('Often', 'The Weeknd', 'assets/images/often.jpg',
                "assets/musics/Often.mp3"),
            SongWidget(
                'Smooth Criminal',
                'Mickael Jackson',
                'assets/images/mickael_jackson.jpg',
                "assets/musics/Smooth_criminal.mp3"),
            SongWidget('Squid Game', 'Samuel Kim Music',
                'assets/images/squid_game.jpg', "assets/musics/Squid_game.mp3"),
          ],
        ),
      ),
    );
  }
}

class SongWidget extends StatefulWidget {
  final String title;
  final String image;
  final String artist;
  final String song;

  SongWidget(this.title, this.artist, this.image, this.song);

  @override
  _SongWidgetState createState() => _SongWidgetState();
}

class _SongWidgetState extends State<SongWidget> {
  AudioPlayer _player = new AudioPlayer();

  bool isPlaying = false;

  Icon playButton = Icon(Icons.play_arrow);

  @override
  void initState() {
    super.initState();

    _player = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            //Superimposed the elements
            children: <Widget>[
              Container(
                height: 80.0,
                width: 80.0,
                child: ClipRRect(
                  //Round the edges of a rectangle
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 80.0,
                width: 80.0,
                child: IconButton(
                  iconSize: 32.0,
                  color: Pcolors.black.withOpacity(0.8),
                  icon: playButton,
                  onPressed: () async {
                    if (!isPlaying) {
                      await _player.setAsset(widget.song);
                      _player.play();
                      setState(() {
                        playButton = Icon(Icons.pause);
                        isPlaying = true;
                      });
                    } else {
                      _player.pause();
                      setState(() {
                        playButton = Icon(Icons.play_arrow);
                        isPlaying = false;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            width: 16.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(
                    color: Pcolors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                widget.artist,
                style: TextStyle(
                    color: Pcolors.white.withOpacity(0.5), fontSize: 18.0),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.more_horiz,
            color: Pcolors.white.withOpacity(0.6),
            size: 32.0,
          ),
        ],
      ),
    );
  }
}

class CollectionWidget extends StatelessWidget {
  final image;
  final title;

  CollectionWidget(this.image, this.title);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100.0,
            child: Stack(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      height: 140.0,
                      width: double.infinity, //Take up all the available space
                    )),
                Positioned(
                  right: 1.0,
                  left: 1.0,
                  child: Icon(Icons.bookmark,
                      color: Pcolors.black.withOpacity(0.6), size: 24.0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(title,
                style: TextStyle(color: Pcolors.black, fontSize: 20.0)),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.16), //Searchbar bg's color & opacity
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 8.0,
          ),
          Icon(
            Icons.search,
            color: Pcolors.black,
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search music...",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
        ],
      ),
    );
  }
}
