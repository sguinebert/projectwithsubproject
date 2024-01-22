import QtQuick 2.15
import QtQuick.Window 2.15  // Import for Window component
import QtQuick.Controls 2.15 // Ensure you import QtQuick.Controls
import QtQuick.Layouts 1.3

Window {
    id:window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Component.onCompleted: {
        console.log('window', window.width, window.height)
        // Initialize the WebChannel and expose `mainWindow`

    }

    Rectangle {
        id:back
        color: "red"
        anchors.fill: parent

        Component.onCompleted: {
            console.log('rect', back.width, back.height)
            // Initialize the WebChannel and expose `mainWindow`

        }
    }

    ColumnLayout {
        anchors.centerIn: parent
        Button {
            text: qsTr("Click Me")
            // Additional button styling and behavior here

            onClicked: {
                console.log("Button clicked!")
            }
        }
    }
}
