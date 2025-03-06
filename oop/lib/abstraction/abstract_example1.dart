abstract class Player {
  int id;

  Player(this.id);

  void play() {
    _start();
    //code logic
    _move();
  }

  void _start();
  void _move();
}

class VideoPlayer extends Player {
  VideoPlayer(super.id);

  @override
  void _start() {
    print('VideoPlayer start');
  }

  @override
  void _move() {
    print('VideoPlayer move');
  }
}

void main(List<String> args) {
  //Player player = Player(); // Error: The class 'Player' is abstract and can't be instantiated.
  Player videoPlayer = VideoPlayer(1);

  videoPlayer.play();
}
