import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import dev.helixlauncher.qml 1.0

Page {
    background: Rectangle { color: "#0b1020" }
    ColumnLayout {
        anchors.centerIn: parent
        width: Math.min(parent.width - 60, 560)
        spacing: 16
        Label { text: "Microsoft ile giriş"; color: "#f4f7ff"; font.pixelSize: 26; font.bold: true }
        Label { text: "Microsoft hesabı ile giriş işlemini başlat."; color: "#93a4c2"; wrapMode: Text.WordWrap; Layout.fillWidth: true }
        Button { text: "Microsoft giriş sayfasını aç"; highlighted: true; onClicked: Qt.openUrlExternally("https://microsoft.com/link") }
        TextArea { Layout.fillWidth: true; Layout.preferredHeight: 100; readOnly: true; wrapMode: TextArea.Wrap; text: "Giriş kodunu Microsoft sayfasında kullan ve yönergeleri takip et." }
        Button { text: "Geri dön"; onClicked: ApplicationWindow.window.pageStack.pop() }
    }
}