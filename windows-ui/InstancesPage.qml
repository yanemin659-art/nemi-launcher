import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import dev.helixlauncher.qml 1.0

Page {
    background: Rectangle { color: "#0b1020" }
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 28
        spacing: 18
        RowLayout {
            Layout.fillWidth: true
            ColumnLayout {
                Label { text: "Oyun kütüphanesi"; color: "#f4f7ff"; font.pixelSize: 27; font.bold: true }
                Label { text: "Minecraft kurulumlarını yönet ve başlat"; color: "#93a4c2"; font.pixelSize: 13 }
            }
            Item { Layout.fillWidth: true }
            Button { text: "＋ Yeni kurulum"; highlighted: true; onClicked: ApplicationWindow.window.pageStack.push("qrc:/qml/NewInstancePage.qml") }
            Button { text: "Hesaplar"; onClicked: ApplicationWindow.window.pageStack.push("qrc:/qml/AccountsPage.qml") }
        }
        ListView {
            id: list
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: 12
            model: InstancesModel
            delegate: Rectangle {
                width: ListView.view.width
                height: 104
                radius: 14
                color: "#15213a"
                border.color: "#263a5d"
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 18
                    spacing: 16
                    Rectangle {
                        width: 54; height: 54; radius: 12; color: "#243e68"
                        Label { anchors.centerIn: parent; text: "▣"; color: "#9cc4ff"; font.pixelSize: 27 }
                    }
                    ColumnLayout {
                        Layout.fillWidth: true
                        Label { text: name; color: "#f5f7ff"; font.pixelSize: 18; font.bold: true }
                        Label { text: (version || "Minecraft") + (loader ? "  •  " + loader : "  •  Vanilla"); color: "#9aaccb"; font.pixelSize: 12 }
                    }
                    Button { text: "Başlat"; highlighted: true; onClicked: InstancesModel.launch(index) }
                    ToolButton { text: "›"; font.pixelSize: 24; onClicked: ApplicationWindow.window.pageStack.push("qrc:/qml/InstancePage.qml", {"name": name, "index": index}) }
                }
            }
            ScrollBar.vertical: ScrollBar {}
        }
        Label {
            visible: list.count === 0
            Layout.alignment: Qt.AlignHCenter
            text: "Henüz kurulum yok. Yeni kurulum oluşturarak başlayabilirsin."
            color: "#8294b3"
        }
    }
}