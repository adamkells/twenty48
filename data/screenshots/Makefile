default: initial_states.png wins.png

initial_states.png: IMG_0593.PNG IMG_0594.PNG IMG_0595.PNG IMG_0596.PNG IMG_0597.PNG IMG_0598.PNG IMG_0599.PNG IMG_0600.PNG IMG_0601.PNG IMG_0602.PNG IMG_0603.PNG IMG_0604.PNG
	montage $^ -crop 580x580+30+215 -geometry +4+2 $@

wins.png: IMG_0437.PNG IMG_0473.PNG IMG_0480.PNG IMG_0481.PNG IMG_0482.PNG IMG_0483.PNG IMG_0484.PNG IMG_0485.PNG IMG_0489.PNG IMG_0492.PNG IMG_0525.PNG IMG_0557.PNG IMG_0565.PNG IMG_0568.PNG IMG_0573.PNG IMG_0577.PNG IMG_0579.PNG IMG_0582.PNG IMG_0583.PNG IMG_0584.PNG IMG_0585.PNG IMG_0586.PNG IMG_0587.PNG IMG_0588.PNG IMG_0589.PNG IMG_0590.PNG IMG_0591.PNG IMG_0592.PNG
	montage $^ -geometry 640x1136+0+0 -tile 14x2 $@ && optipng $@
