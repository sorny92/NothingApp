import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    visible: true
    width: 360
    height: 360
    function quit(){
        Qt.quit();
    }

    Rectangle{
        id: button
        anchors.centerIn: parent
        width: txt.width+20
        height: txt.width+20
        border.color: "blue"
        border.width: 2
        radius: 10
        MouseArea {
            anchors.fill: parent
            onClicked: {
                winGame.running=true;
            }
        }
        Text{
            id: txt
            text: "PLAY"
            anchors.centerIn: parent
        }
    }
    Text{
        text: "Press to play nothing"
        anchors.bottom: button.top
        anchors.bottomMargin: 50
        width: parent.width
        color: "blue"
        horizontalAlignment: Text.AlignHCenter
    }
    Text{
        id: txtWin
        text: "YOU WIN"
        anchors.centerIn: parent
        width: parent.width
        color: "blue"
        horizontalAlignment: Text.AlignHCenter
        opacity: 0.0
    }
    SequentialAnimation {
             id: winGame
             running: false
             NumberAnimation { target: button; property: "opacity"; to: 0.0; duration: 200}
             NumberAnimation { target: txtWin; property: "opacity"; to: 0.8; duration: 1000}
             NumberAnimation { target: txtWin; property: "opacity"; to: 1.0; duration: 3000}
             onStopped:{
                 console.log("HOLA");
                 quit();
             }
         }
}
