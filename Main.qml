import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4 as Qqc
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.2
import QtMultimedia 5.5
import SddmComponents 2.0

Rectangle {
	color: "black"
	width: Window.width
	height: Window.height

	Connections {
		target: sddm

		onLoginSucceeded: {
		}

		onLoginFailed: {
			denied.play()
		}
	}

    AnimatedImage {
	width: parent.width
	height: parent.height
	fillMode: Image.Tile
	source: "bg_dark.gif"
	}
	
    AnimatedImage {
	width: parent.width
	height: parent.height
	fillMode: Image.Tile
	source: "bg_darker.gif"
	}

	ColumnLayout {
		AnimatedImage{
			Layout.alignment: Qt.AlignCenter
			Layout.topMargin: 2
			Layout.preferredWidth: 400
			Layout.preferredHeight: 400		
			source: "WiredLogin.gif"
		}
		AnimatedImage{
			Layout.alignment: Qt.AlignCenter
			Layout.bottomMargin: 20
			source: "text.gif"
			onFrameChanged: if(currentFrame==frameCount-8) playing = false
		}
		width: parent.width
		height: parent.height

		Qqc.Label {
			Layout.alignment: Qt.AlignCenter
			text: "Ｕｓｅｒ ＩD : "
			color: "#c1b492"
			font.pixelSize: 16
		}
		Qqc.TextField {
			id: username
			Layout.alignment: Qt.AlignCenter
			text: userModel.lastUser
			horizontalAlignment: Text.AlignHCenter
			style: TextFieldStyle {
				textColor: "#c1b492"
				background: Rectangle {
					color: "transparent"
					implicitWidth: 200
					border.color: "#c1b492"
					radius: 30
				}
			}
			KeyNavigation.backtab: shutdownBtn; KeyNavigation.tab: password
			Keys.onPressed: {
				if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
					sddm.login(username.text, password.text, session.index)
					event.accepted = true
				}
			}
		}
		Qqc.Label {
			Layout.alignment: Qt.AlignCenter
			text: "Ｐａｓｓｗｏｒｄ ："
			color: "#c1b492"
			font.pixelSize: 16
		}
		Qqc.TextField {
			id: password
			echoMode: TextInput.Password
			Layout.alignment: Qt.AlignCenter
			horizontalAlignment: Text.AlignHCenter
			style: TextFieldStyle {
				textColor: "#c1b492"
				background: Rectangle {
					color: "transparent"
					implicitWidth: 200
					border.color: "#c1b492"
					radius: 30
				}
			}
			KeyNavigation.backtab: username; KeyNavigation.tab: session
			Keys.onPressed: {
				if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
					sddm.login(username.text, password.text, session.index)
					event.accepted = true
				}
			}
		}
		ColumnLayout {
			Layout.alignment: Qt.AlignCenter
			Layout.topMargin: 14
			Layout.bottomMargin: 50
			width: 100
			Rectangle {
				anchors.fill: parent
				color: "transparent"
				border.color: "#c1b492"
				radius: 64
			}
			Qqc.Label {
				Layout.alignment: Qt.AlignCenter
				text: "Ｌｏｇｉｎ"
				color: "#c1b492"
				font.pixelSize: 10
			}
			MouseArea {
				anchors.fill: parent
				onClicked: sddm.login(username.text, password.text, session.index)
			}
		}
	}
	AnimatedImage {
		id: shutdownBtn
		height: 80
		width: 80
		y: 10
		x: Window.width - width - 10
		source: "VisLain.gif"
		fillMode: Image.PreserveAspectFit
		MouseArea {
			anchors.fill: parent
			hoverEnabled: true
			onClicked: sddm.powerOff()
			onEntered: {
				var component = Qt.createComponent("ShutdownToolTip.qml");
				if (component.status == Component.Ready) {
					var tooltip = component.createObject(shutdownBtn);
					tooltip.x = -45
					tooltip.y = 60
				tooltip.destroy(600);
				}
			}
		}
	}
	AnimatedImage {
		id: rebootBtn
		anchors.right: shutdownBtn.left
		anchors.rightMargin: 5
		y: shutdownBtn.y + 10
		height: 70
		width: 60
		source: "lain_myese.gif"
		fillMode: Image.PreserveAspectFit
		MouseArea {
			anchors.fill: parent
			hoverEnabled: true
			onClicked: sddm.reboot()
			onEntered: {
				var component = Qt.createComponent("RebootToolTip.qml");
				if (component.status == Component.Ready) {
					var tooltip = component.createObject(rebootBtn);
					tooltip.x = -45
					tooltip.y = 50
				tooltip.destroy(600);
				}
			}
		}
	}
	ComboBox {
		id: session
		height: 30
		width: 200
		x: 15
		y: 20
		model: sessionModel
		index: sessionModel.lastIndex
		borderColor: "#c1b492"
		color: "transparent"
		hoverColor: "#d2738a"
		textColor: "#c1b492"
		arrowIcon: "angle-down.png"
		KeyNavigation.backtab: password; KeyNavigation.tab: rebootBtn;
	}
	Audio {
		id: bgMusic
		source: "bg_music.wav"
		autoPlay: true
		loops: Audio.Infinite
	}
	Audio {
		id: welcome
		source: "welcome.wav"
		autoPlay: true
	}
	Audio {
		id: denied
		source: "denied.wav"
	}

	Component.onCompleted: {
		if (username.text == "") {
			username.focus = true
		} else {
			password.focus = true
		}
	}
}

