import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import dev.helixlauncher.qml 1.0

Page {
    background: Rectangle { color: "#0b1020" }
    ColumnLayout {
        anchors.centerIn: parent
        width: Math.min(parent.width - 60, 520)
        spacing: 14
        Label { text: "Yeni Minecraft kurulumu"; color: "#f4f7ff"; font.pixelSize: 26; font.bold: true }
        Label { text: "Bir ad ve Minecraft sürümü seç."; color: "#93a4c2" }
        TextField { id: instanceName; Layout.fillWidth: true; placeholderText: "Kurulum adı (ör. Survival)" }
        TextField { id: instanceVersion; Layout.fillWidth: true; placeholderText: "Minecraft sürümü (ör. 1.21.4)" }
        CheckBox { id: useLoader; text: "Mod yükleyici kullan"; checked: false }
        ComboBox { id: instanceLoader; Layout.fillWidth: true; enabled: useLoader.checked; model: ["Fabric", "Forge", "Quilt"] }
        TextField { id: instanceLoaderVersion; Layout.fillWidth: true; enabled: useLoader.checked; placeholderText: "Mod yükleyici sürümü" }
        RowLayout {
            Layout.fillWidth: true
            Item { Layout.fillWidth: true }
            Button { text: "İptal"; onClicked: ApplicationWindow.window.pageStack.pop() }
            Button {
                text: "Kurulumu oluştur"; highlighted: true
                enabled: instanceName.text.length > 0 && instanceVersion.text.length > 0
                onClicked: {
                    InstancesModel.create_instance(instanceName.text, instanceVersion.text,
                        useLoader.checked ? instanceLoader.currentText : "",
                        useLoader.checked ? instanceLoaderVersion.text : "")
                    ApplicationWindow.window.pageStack.pop()
                }
            }
        }
    }
}