import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: root
    visible: true
    width: 1120
    height: 740
    minimumWidth: 860
    minimumHeight: 600
    title: "NEMİ LAUNCHER"
    color: "#0b1020"

    header: ToolBar {
        height: 68
        background: Rectangle {
            color: "#111a2e"
            Rectangle { anchors.bottom: parent.bottom; width: parent.width; height: 1; color: "#263653" }
        }
        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 22
            anchors.rightMargin: 22
            spacing: 16
            Label { text: "NEMİ"; color: "#8bb8ff"; font.pixelSize: 25; font.bold: true }
            Label { text: "LAUNCHER"; color: "#f4f7ff"; font.pixelSize: 17; font.bold: true; Layout.fillWidth: true }
            ToolButton { text: "Oyunlar"; onClicked: pageStack.pop(pageStack.get(0)) }
            ToolButton { text: "Hesaplar"; onClicked: pageStack.push("qrc:/qml/AccountsPage.qml") }
        }
    }

    StackView {
        id: pageStack
        anchors.fill: parent
        initialItem: "qrc:/qml/InstancesPage.qml"
        pushEnter: Transition {
            NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 220 }
            NumberAnimation { property: "y"; from: 18; to: 0; duration: 220 }
        }
        popExit: Transition { NumberAnimation { property: "opacity"; from: 1; to: 0; duration: 160 } }
    }
}