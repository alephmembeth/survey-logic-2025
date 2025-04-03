/* header */
version 15.1

set more off, permanently
set scheme s2mono

use "data_logic", clear


/* participation */
tab klausur1
tab klausur2

keep if klausur1 == 1 | klausur2 == 1
drop if uebungansehen == 35


/* sample */
sum alter, detail

label define geschlecht_lb 1 "weiblich" ///
                           2 "nichtbinär" ///
                           3 "männlich"
   label values geschlecht geschlecht_lb

tab geschlecht


/* modules */
label define modul_lb 1 "phi130" ///
                      2 "pb036"
   label values modul modul_lb

tab modul


/* mark 1 */
label define note1_lb 1 "1,0" ///
                      2 "1,3" ///
                      3 "1,7" ///
                      4 "2,0" ///
                      5 "2,3" ///
                      6 "2,7" ///
                      7 "3,0" ///
                      8 "3,3" ///
                      9 "3,7" ///
                     10 "4,0" ///
                     11 "5,0"
   label values note1 note1_lb

tab note1

histogram note1, discrete ///
                 frequency ///
                 xlabel(1 "1,0" 2 "1,3" 3 "1,7" 4 "2,0" 5 "2,3" 6 "2,7" 7 "3,0" 8 "3,3" 9 "3,7" 10 "4,0" 11 "5,0") ///
                 xtitle("Note") ///
                 ylabel(, angle(0)) ///
                 ytitle("Absolute Häufigkeit") ///
                 graphregion(color(white)) ///
                 saving(figure_note_1, replace)
   graph export figure_note_1.pdf, replace


/* mark 2 */
label define note2_lb 1 "1,0" ///
                      2 "1,3" ///
                      3 "1,7" ///
                      4 "2,0" ///
                      5 "2,3" ///
                      6 "2,7" ///
                      7 "3,0" ///
                      8 "3,3" ///
                      9 "3,7" ///
                     10 "4,0" ///
                     11 "5,0"
   label values note2 note2_lb

tab note2

histogram note2, discrete ///
                 frequency ///
                 xlabel(1 "1,0" 2 "1,3" 3 "1,7" 4 "2,0" 5 "2,3" 6 "2,7" 7 "3,0" 8 "3,3" 9 "3,7" 10 "4,0" 11 "5,0") ///
                 xtitle("Note") ///
                 ylabel(, angle(0)) ///
                 ytitle("Absolute Häufigkeit") ///
                 graphregion(color(white)) ///
                 saving(figure_note_2, replace)
   graph export figure_note_2.pdf, replace


/* lecture and tutorial */
tab vorlesungpraesenz
tab vorlesungvideo
tab tutorium

histogram vorlesungpraesenz, discrete ///
                             frequency ///
                             xlabel(0(1)14) ///
                             xtitle("Besuchte Vorlesungstermine") ///
                             ylabel(, angle(0)) ///
                             ytitle("Absolute Häufigkeit") ///
                             graphregion(color(white)) ///
                             saving(figure_vorlesungpraesenz, replace)
   graph export figure_vorlesungpraesenz.pdf, replace

histogram vorlesungvideo, discrete ///
                          frequency ///
                          xlabel(0(1)14) ///
                          xtitle("Angesehene Vorlesungstermine") ///
                          ylabel(, angle(0)) ///
                          ytitle("Absolute Häufigkeit") ///
                          graphregion(color(white)) ///
                          saving(figure_vorlesungvideo, replace)
   graph export figure_vorlesungvideo.pdf, replace

histogram tutorium, discrete ///
                    frequency ///
                    xlabel(0(1)14) ///
                    xtitle("Besuchte Tutoriumstermine") ///
                    ylabel(, angle(0)) ///
                    ytitle("Absolute Häufigkeit") ///
                    graphregion(color(white)) ///
                    saving(figure_tutorium, replace)
   graph export figure_tutorium.pdf, replace

label define zusatztutorium_lb 0 "Nein" ///
                               1 "Ja"
   label values zusatztutorium zusatztutorium_lb

tab zusatztutorium

label define vorkenntnisse_lb 0 "Nein" ///
                              1 "Ja"
   label values vorkenntnisse vorkenntnisse_lb

tab vorkenntnisse


/* self evaluation */
tab einschaetzung

histogram einschaetzung, discrete ///
                 frequency ///
                 xlabel(1(1)7) ///
                 xtitle("Selbsteinschätzung Klausurvorbereitung") ///
                 ylabel(, angle(0)) ///
                 ytitle("Absolute Häufigkeit") ///
                 graphregion(color(white)) ///
                 saving(figure_einschaetzung, replace)
   graph export figure_einschaetzung.pdf, replace


/* learning time */
tab vorbereitungszeit1
sum vorbereitungszeit1, detail

tab vorbereitungszeit2
sum vorbereitungszeit2, detail

label variable vorbereitungszeit1 "Erste Klausur"
label variable vorbereitungszeit2 "Zweite Klausur"

graph box vorbereitungszeit1 vorbereitungszeit2, ylabel(0(10)120, angle(0)) ///
                                                 ytitle("Stunden") ///
                                                 graphregion(color(white)) ///
                                                 saving(figure_zeit, replace)
   graph export figure_zeit.pdf, replace


/* learning methods */
gen material = .
   replace material = 0 if vorbereitung0 == "Y"
   replace material = 1 if vorbereitung1 == "Y"
   replace material = 2 if vorbereitung2 == "Y"
   replace material = 3 if vorbereitung3 == "Y"
   replace material = 4 if vorbereitung4 == "Y"
   replace material = 5 if vorbereitung5 == "Y"
   replace material = 6 if vorbereitung6 == "Y"
   replace material = 7 if vorbereitung7 == "Y"
   replace material = 8 if vorbereitung8 == "Y"

label define material_lb 0 "Keine Vorbereitung" ///
                         1 "Aufzeichnungen ansehen" ///
                         2 "Folien ansehen" ///
                         3 "Eigene Zusammenfassung erstellen" ///
                         4 "Übungsklausuren ansehen" ///
                         5 "Übungsklausuren bearbeiten" ///
                         6 "Übungsaufgaben ansehen" ///
                         7 "Übungsaufgaben bearbeiten" ///
                         8 "Zusätzliches Lernmaterial ansehen (Lehrvideos, Lehrbücher o.ä.)"
   label values material material_lb

tab material
tab vorbereitungother

tab materialname
sum materialnutzen

tab uebungansehen

histogram uebungansehen, discrete ///
                         frequency ///
                         xlabel(0(1)14) ///
                         xlabel(0(1)14) ///
                         xtitle("Übungszettel ansehen") ///
                         ylabel(0(5)30, angle(0)) ///
                         ytitle("Absolute Häufigkeit") ///
                         graphregion(color(white)) ///
                         saving(figure_uebungansehen, replace)
   graph export figure_uebungansehen.pdf, replace

tab uebungbearbeiten

histogram uebungbearbeiten, discrete ///
                            frequency ///
                            xlabel(0(1)14) ///
                            xlabel(0(1)14) ///
                            xtitle("Übungszettel bearbeiten") ///
                            ylabel(0(5)30, angle(0)) ///
                            ytitle("Absolute Häufigkeit") ///
                            graphregion(color(white)) ///
                            saving(figure_uebungbearbeiten, replace)
   graph export figure_uebungbearbeiten.pdf, replace

label define gruppen_lb 1 "Ganz oder überwiegend alleine" ///
                        2 "Manchmal zusammen mit anderen" ///
                        3 "Überwiegend zusammen mit anderen"
   label values gruppen gruppen_lb

tab gruppen


/* exam situation */
tab zeit1

histogram zeit1, discrete ///
                 frequency ///
                 xlabel(1(1)7) ///
                 xtitle("Zeit") ///
                 ylabel(, angle(0)) ///
                 ytitle("Absolute Häufigkeit") ///
                 graphregion(color(white)) ///
                 saving(figure_zeit_1, replace)
   graph export figure_zeit_1.pdf, replace

tab zeit2

histogram zeit2, discrete ///
                 frequency ///
                 xlabel(1(1)7) ///
                 xtitle("Zeit") ///
                 ylabel(, angle(0)) ///
                 ytitle("Absolute Häufigkeit") ///
                 graphregion(color(white)) ///
                 saving(figure_zeit_2, replace)
   graph export figure_zeit_2.pdf, replace

tab konzentration1

histogram konzentration1, discrete ///
                          frequency ///
                          xlabel(1(1)7) ///
                          xtitle("Konzentration") ///
                          ylabel(, angle(0)) ///
                          ytitle("Absolute Häufigkeit") ///
                          graphregion(color(white)) ///
                          saving(figure_konzentration_1, replace)
   graph export figure_konzentration_1.pdf, replace

tab konzentration2

histogram konzentration2, discrete ///
                          frequency ///
                          xlabel(1(1)7) ///
                          xtitle("Konzentration") ///
                          ylabel(, angle(0)) ///
                          ytitle("Absolute Häufigkeit") ///
                          graphregion(color(white)) ///
                          saving(figure_konzentration_2, replace)
   graph export figure_konzentration_2.pdf, replace

tab schwierigkeit1

histogram schwierigkeit1, discrete ///
                          frequency ///
                          xlabel(1(1)7) ///
                          xtitle("Schwierigkeit") ///
                          ylabel(, angle(0)) ///
                          ytitle("Absolute Häufigkeit") ///
                          graphregion(color(white)) ///
                          saving(figure_schwierigkeit_1, replace)
   graph export figure_schwierigkeit_1.pdf, replace

tab schwierigkeit2

histogram schwierigkeit2, discrete ///
                          frequency ///
                          xlabel(1(1)7) ///
                          xtitle("Schwierigkeit") ///
                          ylabel(, angle(0)) ///
                          ytitle("Absolute Häufigkeit") ///
                          graphregion(color(white)) ///
                          saving(figure_schwierigkeit_2, replace)
   graph export figure_schwierigkeit_2.pdf, replace


/* regressions */
ologit note1 alter geschlecht vorkenntnisse modul vorlesungpraesenz vorlesungvideo tutorium zusatztutorium vorbereitungszeit1 uebungansehen uebungbearbeiten gruppen, vce(robust)

preserve
   reshape long note, i(id) j(klausur)
   ologit note alter geschlecht vorkenntnisse modul vorlesungpraesenz vorlesungvideo tutorium zusatztutorium vorbereitungszeit1 uebungansehen uebungbearbeiten gruppen, vce(robust)
restore


exit
