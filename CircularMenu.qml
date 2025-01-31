import QtQuick 2.15
import QtQuick.Shapes
import QtQuick.Controls.Material
import QtQuick.Layouts

Item {
    // ----------------------------------------- properties
    id: rootItem
    property ListModel listModel: ListModel{}
    property double outerRadius: 400
    property double innerRadius: 300
    property double startAngle: -90 - currentCutLen * listModel.count / 2
    property double currentCutLen: 45
    property double animationDuration: 2000

    readonly property double scaleNameLen: 10

    anchors.fill: parent

    // functions
    function toDegree (radianAngle) {
        return radianAngle * Math.PI / 180;
    }


    // ----------------------------------------- animation
//    PropertyAnimation on outerRadius {
//        id: outerAnimation
//        easing.type: Easing.OutElastic
//        from: 0
//        to: outerRadius
//        duration: parseInt(animationDuration)
//    }

//    PropertyAnimation on innerRadius {
//        id: innerAnimation
//        easing.type: Easing.OutElastic
//        from: 0
//        to: innerRadius
//        duration: parseInt(animationDuration)
//    }

    // ----------------------------------------- fake background
//    Rectangle {
//        id: fakeOuterCircle

////        visible: false

//        width: outerRadius * 2
//        height: outerRadius * 2
//        radius: outerRadius
//        opacity: 0.5
//        color: 'transparent'
//        //        color: 'pink'
//        anchors.centerIn: parent

//        Rectangle {
//            id: fakeInnerCircle

//            width: innerRadius * 2
//            height: innerRadius * 2
//            radius: innerRadius
//            opacity: 0.6

//            color: 'gold'
//            anchors.centerIn: parent
//        }
//    }

    // ----------------------------------------- real background
    Item {
        anchors.fill: parent

        Shape {
            anchors.centerIn: parent
            containsMode: Shape.FillContains

            ShapePath {
                strokeColor: "cyan"
                strokeWidth: 25
                fillColor: 'transparent'
                capStyle: ShapePath.RoundCap

                PathAngleArc {
                    centerX: 0
                    centerY: 0
                    radiusX: outerRadius
                    radiusY: outerRadius
                    startAngle: -180
                    sweepAngle: 180
                }
            }

    }


    }



    // ----------------------------------------- Circular Menu
//    Repeater {
//        anchors.fill: parent
//        model: listModel.count

//        CircularCut {
//            required property var model

//            cutText: listModel.get(model.index).name
//            cutOuterRadius: outerRadius
//            cutInnerRadius: innerRadius
//            cutStartAngle: startAngle + model.index * currentCutLen
//            cutLen: currentCutLen
//            cutIconColor: listModel.get(model.index).color
//            onCutClicked: {
//                console.log(listModel.get(model.index).name)
//            }
//        }
//    }
}
