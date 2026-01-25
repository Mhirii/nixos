{...}: {
  programs.fastfetch={
		enable = true;
		settings={
			logo={
				source="nixos_small";
				padding={
					right=1;
				};
			};
			modules=[
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        {
          type = "display";
          key = "Resolution";
        }
        "de"
        "wm"
        "terminal"
        "cpu"
        "gpu"
        "memory"
				"disk"
				"battery"
        "break"
        "colors"
      ];
		};
	};
}
