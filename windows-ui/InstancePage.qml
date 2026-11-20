import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import dev.helixlauncher.qml 1.0

Page {
    property string name: "Minecraft"
    property int index: 0
    background: Rectangle { color: "#0b1020" }
    ColumnLayout {
        anchors.centerIn: parent
        width: Math.min(parent.width - 60, 560)
        spacing: 16
        Label { text: name; color: "#f4f7ff"; font.pixelSize: 30; font.bold: true; Layout.alignment: Qt.AlignHCenter }
        Label { text: "Kurulum ayrıntıları"; color: "#93a4c2"; Layout.alignment: Qt.AlignHCenter }
        Button { text: "▶  Minecraft'ı başlat"; highlighted: true; Layout.alignment: Qt.AlignHCenter; onClicked: InstancesModel.launch(index) }
        Button { text: "Geri dön"; Layout.alignment: Qt.AlignHCenter; onClicked: ApplicationWindow.window.pageStack.pop() }
    }
}