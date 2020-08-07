deploy:
	git -C themes/forty fetch origin
	git -C themes/forty rebase origin/master
	rm -rf public
	hugo
	scp -r public/* ansible@eldraine:sites/vtes.afri.cz/
	ssh eldraine -l ansible chgrp -R nginx sites/vtes.afri.cz/
