{ ... }:
let
  font-size = "13px";
  background-color = "#180545";
  text-color = "#ccc";
  blinking = {
    color = "#000";
    background-color.warning = "#777";
    background-color.critical = "#FF0000";
    green-color = "#60e48d";
  };
in
{
  programs.waybar.style = ''

window#waybar {
	background: #191c2f;
	color: #ffffff;
}

#window {
	color: #e4e4e4;
	font-weight: bold;
}

#workspaces {
	padding: 0px;
	margin: 0px;
}

#workspaces button {
	padding: 0 2px;
	margin: 3px;
	background: transparent;
	color: #23defd;
	border: 1px solid #23defd;
	font-weight: bold;
    border-radius: 0%;
}
#workspaces button:hover {
	box-shadow: inherit;
	text-shadow: inherit;
}

#workspaces button.active {
	border: 2px solid #23defd;
}

#workspaces button.urgent {
	background: #af005f;
	color: #1b1d1e;
}

#mode {
	background: #af005f;
	color: #1b1d1e;
}
#clock, #battery, #cpu, #memory, #network, #pulseaudio, #custom-spotify, #tray, #mode {
	padding: 0 3px;
	margin: 0 2px;
}

#clock {
}

#battery {
}

#battery icon {
    color: red;
}

#battery.charging {
}

@keyframes blink {
    to {
        background-color: #af005f;
    }
}

#battery.warning:not(.charging) {
	background-color: #ff8700;
	color: #1b1d1e;
}
#battery.critical:not(.charging) {
    color: white;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

#cpu {
}

#memory {
}

#network {
}

#network.disconnected {
    background: #f53c3c;
}

#pulseaudio {
}

#custom-nixstore {
}

#custom-vpn {
}

#pulseaudio.muted {
}

#custom-spotify {
    color: rgb(102, 220, 105);
}

#tray {
}
'';

}
