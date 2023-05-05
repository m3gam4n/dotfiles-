{pkgs, ...}: {
programs.alacritty = {
	enable = true;
	settings = {
		window.padding = {
		x = 5; 
		y = 5;
		};
		scrolling = {
		history = 10000;
		multiplier = 3;		
		};	
		font.normal = {
			family = "Terminus";
			size = 15;	
	};
   };
};
}
