v 20081231 1
C 40000 40000 0 0 0 title-B.sym
C 43700 47900 1 0 0 lm324-1.sym
{
T 44525 48050 5 8 0 0 0 0 1
device=LM324
T 44400 48600 5 10 1 1 0 0 1
refdes=U103
T 43700 47900 5 10 0 0 0 0 1
slot=2
T 43700 47900 5 10 0 0 0 0 1
footprint=DIP14
T 43700 47900 5 10 0 0 0 0 1
value=LM324
}
C 43300 48500 1 90 0 resistor-1.sym
{
T 42900 48800 5 10 0 0 90 0 1
device=RESISTOR
T 43000 48700 5 10 1 1 90 0 1
refdes=R201
T 42800 49000 5 10 1 1 0 0 1
value=47k
T 43300 48500 5 10 0 0 0 0 1
footprint=R025
}
C 43800 46300 1 90 0 resistor-1.sym
{
T 43400 46600 5 10 0 0 90 0 1
device=RESISTOR
T 43500 46500 5 10 1 1 90 0 1
refdes=R202
T 43200 46900 5 10 1 1 0 0 1
value=2k2
T 43800 46300 5 10 0 1 0 0 1
footprint=R025
}
C 44600 47300 1 180 0 resistor-1.sym
{
T 44300 46900 5 10 0 0 180 0 1
device=RESISTOR
T 44400 47000 5 10 1 1 180 0 1
refdes=R204
T 44000 47400 5 10 1 1 0 0 1
value=4k7
T 44600 47300 5 10 0 1 0 0 1
footprint=R025
}
C 45600 48400 1 180 0 resistor-1.sym
{
T 45300 48000 5 10 0 0 180 0 1
device=RESISTOR
T 45400 48100 5 10 1 1 180 0 1
refdes=R203
T 45100 48500 5 10 1 1 0 0 1
value=33k
T 45600 48400 5 10 0 1 0 0 1
footprint=R025
}
C 44100 47600 1 0 0 gnd-1.sym
{
T 44100 47600 5 10 0 0 0 0 1
net=GND:1
}
C 43100 47600 1 0 0 gnd-1.sym
C 45800 47400 1 90 0 capacitor-1.sym
{
T 45300 47600 5 10 1 1 90 0 1
refdes=C201
T 44900 47600 5 10 0 0 90 0 1
symversion=0.1
T 45700 47600 5 10 1 1 0 0 1
value=1uF
T 45800 47400 5 10 0 1 0 0 1
footprint=SIP2
}
N 44600 47200 44700 47200 4
N 44700 47200 44700 48300 4
N 43700 47200 43700 48100 4
N 43700 48500 43200 48500 4
C 45500 47100 1 0 0 gnd-1.sym
N 43200 48500 43200 48300 4
C 45600 48200 1 0 0 output-1.sym
{
T 45700 48500 5 10 0 0 0 0 1
device=OUTPUT
T 45900 48000 5 10 1 1 0 0 1
net=GSROut:1
}
C 48500 44100 1 90 0 resistor-1.sym
{
T 48100 44400 5 10 0 0 90 0 1
device=RESISTOR
T 48200 44300 5 10 1 1 90 0 1
refdes=R206
T 48500 44400 5 10 1 1 0 0 1
value=680
T 48500 44100 5 10 0 1 0 0 1
footprint=R025
}
C 48300 43800 1 0 0 gnd-1.sym
C 48300 45900 1 270 0 led-2.sym
{
T 48700 45500 5 10 1 1 270 0 1
refdes=D201
T 48900 45800 5 10 0 0 270 0 1
device=LED
T 48100 45400 5 10 1 1 0 0 1
value=IR
T 48300 45900 5 10 0 1 0 0 1
footprint=HEADER2_1
}
C 50100 45900 1 180 0 photodiode-1.sym
{
T 49600 44800 5 10 0 0 180 0 1
device=photodiode
T 49200 45100 5 10 1 1 0 0 1
refdes=PD201
T 49200 45400 5 10 1 1 0 0 1
value=IR
T 50100 45900 5 10 0 1 0 0 1
footprint=HEADER2_1
}
C 49500 44700 1 0 0 gnd-1.sym
C 49400 46800 1 0 0 5V-plus-1.sym
C 49700 45900 1 90 0 resistor-1.sym
{
T 49300 46200 5 10 0 0 90 0 1
device=RESISTOR
T 49400 46100 5 10 1 1 90 0 1
refdes=R205
T 49700 46200 5 10 1 1 0 0 1
value=20k
T 49700 45900 5 10 0 1 0 0 1
footprint=R025
}
C 51500 45300 1 0 0 lm324-1.sym
{
T 52325 45450 5 8 0 0 0 0 1
device=LM324
T 52200 46000 5 10 1 1 0 0 1
refdes=U103
T 51500 45300 5 10 0 1 0 0 1
slot=3
T 51500 45300 5 10 0 1 0 0 1
footprint=DIP14
T 51500 45300 5 10 0 0 0 0 1
value=LM324
}
C 52400 44100 1 0 1 capacitor-2.sym
{
T 52200 44800 5 10 0 0 0 6 1
device=POLARIZED_CAPACITOR
T 52400 44700 5 10 1 1 0 6 1
refdes=C204
T 52200 45000 5 10 0 0 0 6 1
symversion=0.1
T 52200 44500 5 10 1 1 0 6 1
value=0.22uF
T 52400 44100 5 10 0 1 0 0 1
footprint=SIP2
}
C 51500 43600 1 0 0 resistor-1.sym
{
T 51800 44000 5 10 0 0 0 0 1
device=RESISTOR
T 51700 43900 5 10 1 1 0 0 1
refdes=R208
T 52000 43400 5 10 1 1 0 0 1
value=68k
T 51500 43600 5 10 0 1 0 0 1
footprint=R025
}
C 51600 42800 1 90 0 resistor-1.sym
{
T 51200 43100 5 10 0 0 90 0 1
device=RESISTOR
T 51800 43200 5 10 1 1 90 0 1
refdes=R210
T 51600 42900 5 10 1 1 0 0 1
value=5k6
T 51600 42800 5 10 0 1 0 0 1
footprint=R025
}
C 51300 45000 1 90 0 resistor-1.sym
{
T 50900 45300 5 10 0 0 90 0 1
device=RESISTOR
T 51000 45400 5 10 1 1 90 0 1
refdes=R207
T 50800 45100 5 10 1 1 0 0 1
value=33k
T 51300 45000 5 10 0 1 0 0 1
footprint=R025
}
N 51200 45900 51500 45900 4
N 51500 45500 51500 43700 4
N 52500 45700 52500 43700 4
N 51200 45000 51200 42800 4
N 51200 42800 51500 42800 4
C 51900 45000 1 0 0 gnd-1.sym
C 54700 45400 1 0 0 output-1.sym
{
T 54800 45700 5 10 0 0 0 0 1
device=OUTPUT
T 55000 45200 5 10 1 1 0 0 1
net=PulseOut:1
}
N 52500 44300 52400 44300 4
N 52500 43700 52400 43700 4
C 50300 45700 1 0 0 capacitor-2.sym
{
T 50600 46200 5 10 1 1 0 0 1
value=2.2uF
T 50500 46400 5 10 0 0 0 0 1
device=POLARIZED_CAPACITOR
T 50500 46400 5 10 1 1 0 0 1
refdes=C202
T 50500 46600 5 10 0 0 0 0 1
symversion=0.1
T 50300 45700 5 10 0 1 0 0 1
footprint=SIP2
}
C 50400 42700 1 0 0 input-1.sym
{
T 50400 43000 5 10 0 0 0 0 1
device=INPUT
T 50400 42500 5 10 1 1 0 0 1
value=2V
T 50400 42700 5 10 0 0 0 0 1
net=V2:1
}
N 49600 45900 50300 45900 4
C 53700 45100 1 0 0 lm324-1.sym
{
T 54525 45250 5 8 0 0 0 0 1
device=LM324
T 54400 45800 5 10 1 1 0 0 1
refdes=U103
T 53700 45100 5 10 0 1 0 0 1
slot=4
T 53700 45100 5 10 0 1 0 0 1
footprint=DIP14
T 53700 45100 5 10 0 0 0 0 1
value=LM324
}
C 54600 43900 1 0 1 capacitor-2.sym
{
T 54400 44600 5 10 0 0 0 6 1
device=POLARIZED_CAPACITOR
T 54500 44500 5 10 1 1 0 6 1
refdes=C205
T 54400 44800 5 10 0 0 0 6 1
symversion=0.1
T 54400 44300 5 10 1 1 0 6 1
value=0.22uF
T 54600 43900 5 10 0 1 0 0 1
footprint=SIP2
}
C 53700 43400 1 0 0 resistor-1.sym
{
T 54000 43800 5 10 0 0 0 0 1
device=RESISTOR
T 53900 43700 5 10 1 1 0 0 1
refdes=R211
T 54200 43200 5 10 1 1 0 0 1
value=68k
T 53700 43400 5 10 0 1 0 0 1
footprint=R025
}
C 53500 44800 1 90 0 resistor-1.sym
{
T 53100 45100 5 10 0 0 90 0 1
device=RESISTOR
T 53200 45200 5 10 1 1 90 0 1
refdes=R209
T 53000 44900 5 10 1 1 0 0 1
value=33k
T 53500 44800 5 10 0 1 0 0 1
footprint=R025
}
N 53400 45700 53700 45700 4
N 53700 45300 53700 43500 4
N 54700 45500 54700 43500 4
C 54100 44800 1 0 0 gnd-1.sym
N 54700 44100 54600 44100 4
N 54700 43500 54600 43500 4
C 52500 45500 1 0 0 capacitor-2.sym
{
T 52800 46000 5 10 1 1 0 0 1
value=2.2uF
T 52700 46200 5 10 0 0 0 0 1
device=POLARIZED_CAPACITOR
T 52700 46200 5 10 1 1 0 0 1
refdes=C203
T 52700 46400 5 10 0 0 0 0 1
symversion=0.1
T 52500 45500 5 10 0 1 0 0 1
footprint=SIP2
}
C 53800 42600 1 90 0 resistor-1.sym
{
T 54000 43000 5 10 1 1 90 0 1
refdes=R212
T 53400 42900 5 10 0 0 90 0 1
device=RESISTOR
T 53800 42700 5 10 1 1 0 0 1
value=5k6
T 53800 42600 5 10 0 1 0 0 1
footprint=R025
}
N 53400 44800 53400 42600 4
N 51500 42800 51500 42600 4
N 51500 42600 53700 42600 4
T 41100 47900 9 10 1 0 0 0 1
Finger Contacts
C 44000 48700 1 0 0 9V-plus-1.sym
C 51800 46100 1 0 0 9V-plus-1.sym
C 54000 45900 1 0 0 9V-plus-1.sym
C 43100 50200 1 270 0 input-1.sym
{
T 43400 50200 5 10 0 0 270 0 1
device=INPUT
T 42900 50200 5 10 1 1 270 0 1
value=2V
T 43100 50200 5 10 0 0 0 0 1
net=V2:1
}
C 43600 46000 1 0 0 gnd-1.sym
C 48200 45900 1 0 0 9V-plus-1.sym
T 50300 40800 9 10 1 0 0 0 2
Polygraph
GSR and Pulse
T 51900 40100 9 10 1 0 0 0 1
2
T 50500 40100 9 10 1 0 0 0 1
1
T 54100 40100 9 10 1 0 0 0 1
Arthur Peters
T 53900 40100 9 10 1 0 0 0 2
$date: 2010/05/04 06:19:45 $

T 49900 40400 9 10 1 0 0 0 1
$file: GSR_Pulse.sch $
C 43200 48700 1 180 0 connector2-2.sym
{
T 42500 47400 5 10 1 1 180 6 1
refdes=CONN201
T 42900 47450 5 10 0 0 180 0 1
device=CONNECTOR_2
T 42900 47250 5 10 0 0 180 0 1
footprint=HEADER2_1
}
