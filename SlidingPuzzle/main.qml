import QtQuick 2.6
import QtQuick.Window 2.2

/*

  main.qml
  Main QML File defines User Interface for Sliding Puzzle Game
  By: Jamie Westick
  Created: 9/12/2018

*/



Rectangle{
    width: 800; height: 800
    id: mainrect
    color:"#c8f4de"
    signal startNew()   //start new round
    signal getRand()    //get random round choice
    signal stopTimer()  //stop game timer
    property int temp: 0        //hold round choice
    property int i              //loop iterator
    property int gameTimer: 0   //times each round
    property int score: 0       //each puzzle move +1
    property int round:0        //8 rounds
    //update gameTimer on signal from qt
    function onUpdateTimer(time){
        gameTimer = time
    }

    //random value from qt will represent the configuation of present round
    function onRandSignal(rand){
        temp = rand
    }

    // shuffle the puzzle pieces based on random round selection
    function jumble(){
        if (temp == 1){
            one.state = 1;two.state = 8;three.state=4;four.state=7;five.state=6;
            six.state=5;seven.state=3;eight.state=2
        }
        if (temp == 2){
            one.state = 7;two.state = 1;three.state=5;four.state=4;five.state=8;
            six.state=3;seven.state=6;eight.state=2
        }
        if (temp == 3){
            one.state = 1;two.state = 8;three.state=4;four.state=7;five.state=6;
            six.state=5;seven.state=3;eight.state=2
        }
        if (temp == 4){
            one.state = 8;two.state = 4;three.state=2;four.state=1;five.state=5;
            six.state=6;seven.state=7;eight.state=3
        }
        if (temp == 5){
            one.state = 6;two.state = 3;three.state=5;four.state=8;five.state=1;
            six.state=2;seven.state=4;eight.state=7
        }
        if (temp == 6){
            one.state = 5;two.state = 7;three.state=3;four.state=8;five.state=2;
            six.state=1;seven.state=4;eight.state=6
        }
        if (temp == 7){
            one.state = 6;two.state = 7;three.state=8;four.state=4;five.state=3;
            six.state=5;seven.state=1;eight.state=2
        }
        if (temp == 8){
            one.state = 3;two.state = 2;three.state=4;four.state=7;five.state=8;
            six.state=5;seven.state=6;eight.state=1
        }

    }

//rectangle will hold visual elements
    Rectangle{
        id:rect
        border.color: "#071a52"
        border.width:3
        color:"#c8f4de"
        width: 600; height: 600
        anchors.centerIn:parent
        property int emptyX: 400    //empty space start in bottom right corner
        property int emptyY: 400

        Column{
            anchors.centerIn: rect
            spacing: 20
//shows game instuction filler
            Row{
                Filler{}

            }


            Row{
//gid holds tile puzzle pieces
                Grid{
                    id:grid
                    spacing: 0
                    rows: 3; columns:3
                    Tile{
                        id:one
                        caption:"1"}
                    Tile{
                        id:two
                        caption:"2"}
                    Tile{
                        id:three
                        caption:"3"}
                    Tile{
                        id:four
                        caption:"4"}
                    Tile{
                        id: five
                        caption:"5"}
                    Tile{
                        id:six
                        caption:"6"}
                    Tile{
                        id:seven
                        caption:"7"}
                    Tile{
                        id:eight
                        caption:"8"}
                } //grid
            }//grid row

// holds button to start round and display game timer and round number
            Row{
                Column{
                    Button{

                        caption:"START ROUND"
                        onClicked:{
                            if (round == 8){
                                mainrect.stopTimer()
                                popup2.visible=true
                                timerText.visible=false
                            }
                            else{
                                gameTimer = 0
                                score = 0
                                round++
                                rect.emptyX = 400
                                rect.emptyY = 400
                                mainrect.startNew()

                                mainrect.getRand()
                                jumble()

                            }//else
                        } //onlcliked


                    }//button

                }//start button column

                Column{
                    Text{
                        id: timerText
                        x:160
                        y:300
                        text: "TIME: "+ gameTimer+
                              "\nROUND: " + round
                        font.pointSize: 20
                        color: "#071a52"
                        font.family: "helvetica"
                        visible: true
                    }

                }//timer col

            }//row under puzzle
        }//Main col


//popup when round is won
        Rectangle {
            id: popup
            anchors.centerIn: rect
            width: 400
            height: 400
            visible:false
            color:"#66c6ba"
            border.color:"#384259"
            border.width: 3
            Text{
                id:winText
                anchors.centerIn: popup
                text: "YOU WON! SCORE:  "+ score
                font.pointSize: 20
                color: "#dff5f2"
                font.family: "helvetica"
            }
            Button{
                x:60
                y:300
                caption:"SWEET!"
                onClicked:{
                    popup.visible = false

                }
            }
        }
 //popup when all 8 rounds are through
        Rectangle {
            id: popup2
            height: 800
            width:800
            visible:false
            color:"#c8f4de"
            anchors.fill: rect
            Text{
                anchors.centerIn: popup2
                text: "THAT'S ALL FOLKS :) "
                font.pointSize: 20
                color: "#071a52"
                font.family: "helvetica"
            }

        }

    }
}



