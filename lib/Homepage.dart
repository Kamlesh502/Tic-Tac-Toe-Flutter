import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isCross = true;
  String message;
  List<String> gamestate;

  //Linking images with the App
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  //Initialize the box with Empty state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      this.gamestate = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  //Reset Game
  resetGame() {
    setState(() {
      this.gamestate = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  //get image method

  AssetImage getimage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('circle'):
        return circle;
        break;
      case ('cross'):
        return cross;
        break;
    }
  }

  //Play game  method
  playgame(int index) {
    if (this.gamestate[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gamestate[index] = "cross";
        } else {
          this.gamestate[index] = "circle";
        }
        this.isCross = !this.isCross;
        this.win();
      });
    }
  }

  //Check Win

  win() {
    if ((gamestate[0] != 'empty') &&
        (gamestate[0] == gamestate[1]) &&
        (gamestate[1] == gamestate[2])) {
      setState(() {
        this.message = '${this.gamestate[0]} Wins!';
      });
    } else if ((gamestate[3] != 'empty') &&
        (gamestate[3] == gamestate[4]) &&
        (gamestate[4] == gamestate[5])) {
      setState(() {
        this.message = '${this.gamestate[3]} Wins!';
      });
    } else if ((gamestate[6] != 'empty') &&
        (gamestate[6] == gamestate[7]) &&
        (gamestate[7] == gamestate[8])) {
      setState(() {
        this.message = '${this.gamestate[6]} Wins!';
      });
    } else if ((gamestate[0] != 'empty') &&
        (gamestate[0] == gamestate[3]) &&
        (gamestate[3] == gamestate[6])) {
      setState(() {
        this.message = '${this.gamestate[0]} Wins!';
      });
    } else if ((gamestate[1] != 'empty') &&
        (gamestate[1] == gamestate[4]) &&
        (gamestate[4] == gamestate[7])) {
      setState(() {
        this.message = '${this.gamestate[1]} Wins!';
      });
    } else if ((gamestate[2] != 'empty') &&
        (gamestate[2] == gamestate[5]) &&
        (gamestate[5] == gamestate[8])) {
      setState(() {
        this.message = '${this.gamestate[2]} Wins!';
      });
    } else if ((gamestate[0] != 'empty') &&
        (gamestate[0] == gamestate[4]) &&
        (gamestate[4] == gamestate[8])) {
      setState(() {
        this.message = '${this.gamestate[0]} Wins!';
      });
    } else if ((gamestate[2] != 'empty') &&
        (gamestate[2] == gamestate[4]) &&
        (gamestate[4] == gamestate[6])) {
      setState(() {
        this.message = '${this.gamestate[2]} Wins!';
      });
    } else if (!gamestate.contains("empty")) {
      setState(() {
        this.message = "No one wins!!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: GridView.builder(
            padding: EdgeInsets.all(20.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0),
            itemCount: this.gamestate.length,
            itemBuilder: (context, i) => SizedBox(
              width: 100.0,
              height: 100.0,
              child: MaterialButton(
                onPressed: () {
                  this.playgame(i);
                },
                child: Image(
                  image: this.getimage(this.gamestate[i]),
                ),
              ),
            ),
          )),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              this.message,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MaterialButton(
            color: Colors.purple,
            onPressed: () {
              this.resetGame();
            },
            minWidth: 300.0,
            height: 50.0,
            child: Text(
              "Reset Game",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Kamlesh Bishnoi",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }
}
