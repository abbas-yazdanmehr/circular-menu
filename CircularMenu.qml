import QtQuick 2.15
import QtQuick.Shapes
import QtQuick.Controls
import QtQuick.Layouts

Item {
    // properties
    property double outerRadius: 400
    property double innerRadius: 300
    property ListModel listModel: ListModel{}

    anchors.fill: parent

    CircularCut {
        cutText: 'red'
        cutOuterRadius: outerRadius
        cutInnerRadius: innerRadius
        cutStartAngle: 90
        cutLen: 90
    }

    CircularCut {
        cutText: 'purple'
        cutOuterRadius: outerRadius
        cutInnerRadius: innerRadius
        cutStartAngle: 0
        cutLen: 45
        cutColor: 'purple'
    }

    CircularCut {
        cutText: 'blue'
        cutOuterRadius: outerRadius
        cutInnerRadius: innerRadius
        cutStartAngle: 180
        cutLen: 90
        cutColor: 'blue'
    }

    RowLayout {
        id: textFieldsRow

        height: 50
        anchors.bottom: buttonsRow.top
        anchors.left: parent.left
        anchors.right: parent.right

        TextField {
            id: nameField
            text: 'add item'
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    RowLayout {
        id: buttonsRow
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 50

        Button {
            id: addButton
            text: 'add item'
            Layout.fillWidth: true
            Layout.fillHeight: true

            onClicked: {
                listModel.append({name: nameField.text, iconSource: 'hand.png'})
            }
        }

        Button {
            id: remove
            text: 'remove item'
            Layout.fillWidth: true
            Layout.fillHeight: true

            onClicked: {
                console.log(listModel.count)

                if (listModel.count > 0)
                    listModel.remove(0)
            }
        }
    }



    Rectangle {
        id: fakeOuterCircle

        visible: false

        width: outerRadius * 2
        height: outerRadius * 2
        radius: outerRadius
        opacity: 0.4

        color: 'pink'
        anchors.centerIn: parent

        Rectangle {
            id: fakeInnerCircle

            width: innerRadius * 2
            height: innerRadius * 2
            radius: innerRadius
            opacity: 0.4

            color: 'gold'
            anchors.centerIn: parent
        }
    }
}
