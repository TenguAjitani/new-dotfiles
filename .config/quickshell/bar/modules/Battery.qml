import QtQuick
import QtQuick.Effects
import Quickshell.Services.UPower

Item {
  id: root

  required property var bar

  readonly property var chargeState: UPower.displayDevice.state
  readonly property bool isCharging: chargeState == UPowerDeviceState.Charging
  readonly property bool isPluggedIn: isCharging || chargeState == UPowerDeviceState.PendingCharge
  readonly property real percentage: UPower.displayDevice.percentage
  readonly property bool isLow: percentage <= 0.20

  width: 18
  height: 35

  Rectangle {
    id: progressBar
    anchors.fill: parent
    anchors.bottomMargin: 1
    color: "#100111"
    radius: 5


    Rectangle {
      id: chargeBar
      anchors {
        bottom: parent.bottom
        // top: parent.top
        right: parent.right
        left: parent.left
      }  
      height: root.percentage * parent.height
      color: root.isCharging ? "#ffffff" : root.isLow ? "#3d3d3d": "#909090"
      radius: 5
    }

	Text {
	  anchors{
	    horizontalCenter: parent.horizontalCenter
	    verticalCenter: parent.verticalCenter
          }
	  text: root.isCharging ? "🗲" : ""
	  style: Text.Outline
	  styleColor: "#100111"
	  color: "#04D345"
	  font.pixelSize: 10
	  font.family: "Maple Mono Nerd Font CN"
	  font.weight: Font.Bold
	}
	
    Rectangle {
      id: borderBattery
      anchors.fill: parent
      color: "transparent"
      border {
        color: "#505050"
        width: 2
      }
      radius: 5
    }

    Rectangle {
      id: batteryBump
      height: 2
      width: parent.width - 8
      color: "#505050"
      anchors {
        horizontalCenter: parent.horizontalCenter
        bottom: parent.top
        // bottomMargin: 3
      }
      radius: 2
    }

      Text {
	anchors {
	  horizontalCenter: parent.horizontalCenter
	  bottom: parent.top
        }
	anchors.bottomMargin: 5
	text: `${Math.round(percentage * 100)}%`
	color: "#D0D0D0"
	font.pixelSize: 12
	font.family: "Maple Mono Nerd Font CN"
        font.weight: Font.Bold
      }
  }
}
