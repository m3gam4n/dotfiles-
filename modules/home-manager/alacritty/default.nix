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
        colors  = {
          primary = {
            background = "0x020221";
            foreground = "0xb4b4b9";
          };
          normal = {
          black=   "0x000004";
          red=     "0xff3600";
          green=   "0x859933";
          yellow=  "0xffc552";
          blue=    "0x635196";
          magenta= "0xff761a";
          cyan=    "0x34bfa4";  
          };
        };
	};
   };
};
}
