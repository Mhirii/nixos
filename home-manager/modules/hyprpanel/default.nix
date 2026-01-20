{...}: {
	programs.hyprpanel={
		enable = true;
		settings = {
			bar = {
				customModules.storage.paths= [ "/" ];
				launcher.icon= "󰣇";
				launcher.autoDetectIcon= true;
				workspaces={
					monitorSpecific= false;
					show_icons= true;
					show_numbered= false;
					ignored= "99|98";
					numbered_active_indicator= "underline";
					workspaces= 10;
				};
				windowtitle={
					icon= true;
					label= true;
					custom_title= true;
				};
				autoHide= "never";
			};
			terminal= "$TERMINAL";
			scalingPriority= "gdk";
			menus.volume.raiseMaximumVolume= true;
			theme={
				font={
					name= "MonaspiceNe Nerd Font";
					label= "MonaspiceNe Nerd Font";
					size= "1rem";
				};
				bar={
					floating= true;
					border.location= "none";
					scaling= 100;
					buttons={
						enableBorders= false;
						dashboard.enableBorder= false;
						workspaces.enableBorder= false;
					};
					menus.monochrome= true;
					menus.opacity= 100;
				};
				osd={
					location= "bottom";
					orientation= "horizontal";
					enableShadow= true;
					scaling= 75;
				};
			};
		};
	};
}
