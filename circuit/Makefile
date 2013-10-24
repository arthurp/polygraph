all: Full_Drawings.pdf

Full_Drawings.pdf : Regulation_Breath.pdf GSR_Pulse.pdf
	pdftk $^ cat output $@

%.pdf : %.sch
	gschem -p -o$@.ps -s/usr/share/gEDA/scheme/print.scm $<
	sleep 2
	ps2pdf $@.ps $@
	rm $@.ps

clean:
	-rm Full_Drawings.pdf Regulation_Breath.pdf GSR_Pulse.pdf
