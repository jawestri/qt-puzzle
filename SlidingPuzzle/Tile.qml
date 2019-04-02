import QtQuick 2.1


/*

  Tile.qml
  QML File defines Tile puzzle piece for Sliding Puzzle Game
  By: Jamie Westick
  Created: 9/12/2018

*/

Rectangle {
    id: tile
    width: 200; height:200
    border.color: "#071a52"
    border.width: 2
    color: "#a4e5d9"


    property string caption
    signal clicked()
    property int temp

    Text{
        id:textWidget
        anchors.centerIn: parent
        text: caption
        font.pointSize: 45
        color: "#071a52"
        font.family: "helvetica"
        font.bold: true
    }

 // states define position on grid
    states:[
        State{
            name: "1"
            PropertyChanges{
                target:tile
                x:0
                y:0}
        },
        State{
            name: "2"
            PropertyChanges{
                target:tile
                x:200
                y:0}
        },
        State{
            name: "3"
            PropertyChanges{
                target:tile
                x:400
                y:0}
        },
        State{
            name: "4"
            PropertyChanges{
                target:tile
                x:0
                y:200}
        },
        State{
            name: "5"
            PropertyChanges{
                target:tile
                x:200
                y:200}
        },
        State{
            name: "6"
            PropertyChanges{
                target:tile
                x:400
                y:200}
        },
        State{
            name: "7"
            PropertyChanges{
                target:tile
                x:0
                y:400}
        },
        State{
            name: "8"
            PropertyChanges{
                target:tile
                x:200
                y:400}
        }

    ]

//on click check if tile is next to empty space and move it, otherwise do nothing
// its an invalid move
    MouseArea{
        anchors.fill: tile
        hoverEnabled: true
        onClicked:{

            //  tile.clicked()
            if (tile.x+200 == rect.emptyX && tile.y == rect.emptyY){
                tile.x = tile.x+200
                rect.emptyX = rect.emptyX-200
                mainrect.score++
                console.log("X is "+tile.x)
                console.log("empty is "+rect.emptyX)

            }
            else if (tile.x-200 == rect.emptyX && tile.y==rect.emptyY){
                tile.x = tile.x-200
                rect.emptyX = rect.emptyX+200
                mainrect.score++

            }
            else if (tile.y+200 == rect.emptyY && tile.x ==rect.emptyX){
                tile.y = tile.y+200
                rect.emptyY = rect.emptyY-200
                mainrect.score++
            }
            else if (tile.y-200 == rect.emptyY&&tile.x==rect.emptyX){
                tile.y = tile.y-200
                rect.emptyY=rect.emptyY+200;
                mainrect.score++

            }
            else{
                console.log("invalid move")
            }

            //check if all tiles are in correct position to win
            if(one.x === 0 && two.x === 200 && three.x === 400 &&
                    four.x === 0 && five.x === 200 && six.x === 400
                    && seven.x === 0 && eight.x === 200 && one.y === 0 && two.y === 0
                    && three.y === 0 && four.y === 200 && five.y === 200 && six.y === 200
                    && seven.y === 400 && eight.y === 400){

                popup.visible=true
                console.log("won!!")
                mainrect.stopTimer()
            }


        }
        onEntered:{
            textWidget.font.pointSize = textWidget.font.pointSize + 10;
        }
        onExited: {
            textWidget.font.pointSize = textWidget.font.pointSize - 10;
        }
    }
}
