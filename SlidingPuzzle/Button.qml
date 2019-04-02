import QtQuick 2.0
/*

  Button.qml
  QML File defines button widget for Sliding Puzzle Game
  By: Jamie Westick
  Created: 9/12/2018

*/
Rectangle {
    id: button
    width: 300; height:60
    border.color: "#071a52"
    border.width: 3
    color: "#649dad"


    property string caption


    signal clicked()
    Text{
        id:textWidget
        anchors.centerIn: parent
        text: caption
        font.pointSize: 15
        color: "white"
        font.family: "helvetica"
    }


    MouseArea{
        anchors.fill: button
        hoverEnabled: true
        onClicked:{
            button.clicked()

        }
        onEntered:{
            textWidget.font.pointSize = textWidget.font.pointSize + 5;
        }
        onExited: {
            textWidget.font.pointSize = textWidget.font.pointSize - 5;
        }
    }
}
