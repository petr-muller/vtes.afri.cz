update-theme:
	git -C themes/forty checkout vtes.afri.cz
	git -C themes/forty fetch origin
	git -C themes/forty rebase origin/master

deploy: update-theme
	git push
	rm -rf public
	hugo
	scp -r public/* ansible@eldraine:sites/vtes.afri.cz/
	ssh eldraine -l ansible chgrp -R nginx sites/vtes.afri.cz/

serve: update-theme
	hugo serve
