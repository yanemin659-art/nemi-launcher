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
                Label { text: "Hesaplar"; color: "#f4f7ff"; font.pixelSize: 27; font.bold: true }
                Label { text: "Microsoft hesabını yönet"; color: "#93a4c2" }
            }
            Item { Layout.fillWidth: true }
            Button { text: "Microsoft hesabı ekle"; highlighted: true; onClicked: ApplicationWindow.window.pageStack.push("qrc:/qml/SignInPage.qml") }
        }
        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 10
            clip: true
            model: AccountsModel
            delegate: Rectangle {
                width: ListView.view.width; height: 82; radius: 12
                color: "#15213a"; border.color: "#263a5d"
                RowLayout {
                    anchors.fill: parent; anchors.margins: 16
                    Rectangle { width: 44; height: 44; radius: 22; color: "#294a78"; Label { anchors.centerIn: parent; text: "●"; color: "#b9d4ff" } }
                    ColumnLayout {
                        Layout.fillWidth: true; spacing: 3
                        Label { text: username; color: "#f4f7ff"; font.bold: true; font.pixelSize: 16 }
                        Label { text: uuid; color: "#8498b9"; font.pixelSize: 10; elide: Text.ElideMiddle }
                    }
                    Button { text: "Varsayılan"; onClicked: AccountsModel.set_default(uuid) }
                    Button { text: "Kaldır"; onClicked: AccountsModel.remove(uuid) }
                }
            }
        }
    }
}