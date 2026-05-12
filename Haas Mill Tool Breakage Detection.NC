%
O08000 (Haas Tool Breakage Sub)
(2025/09/03 KS Rev B)

(User Inputs)
#1= 0.015 (Pull Out Sensitivity - Must Be Greater Than Length Wear Values)
#2= 0.015 (Breakage Sensitivity - Must Be Greater Than Length Wear Values)
#3=.030 (X Shift From Tool Setter Centerline)
#4=.030 (Y Shift From Tool Setter Centerline)
#5=98. (Extended Work Offset for Tool Setter Location - Must Use Decimal Point)
(End User Inputs)

M05 (Spindle Off)
M09 (Coolant Off)

G10 L20 P#5 G90 X#10585 Y#10586 Z#10582 (Set Work Offset for Tool Setter)
G0 G53 Z0. (Send Spindle Home)
G0 G90 G154 P#5 X#3 Y#4 (Position Over Tool Setter XY)
M59 P2 (OTS Enable)
M59 P3 (Receiver ON)
G43 H#3026 Z.2 (Activate Tool Offset In Spindle - Position For Rough Tool Pullout Detection)
M96 P10 Q17 (Alarm if Probe Signal Found - Pull Out)
GOTO100 (Go To N100 Alarm)
N10 G1 Z#1 F150. (Position For Fine Tool Pullout Detection)
M96 P20 Q17 (Alarm if Probe Signal Found - Pull Out)
GOTO100 (Go To N100 Alarm)
N20 G1 Z-#2 F150. (Position For Tool Breakage Detection)
M96 P200 Q17 (Alarm if Probe Signal Not Found - Breakage)
G0 G53 Z0. (Send Spindle Home)
M69 P3 (Receiver OFF)
M69 P2 (OTS Disable)
G43 H#3026 (Activate Tool Offset In Spindle)
G90 (Absolute Positioning)
M99 (Return to Main Program)

N100
#3000=100 (Tool Has Pulled Out)
N200
#3000=200 (Tool Has Broken)

(Revision History)
(2023/11/17 KS Rev N/C - Initial Release)
(2023/11/20 KS Rev A - Replaced hard coded WCS to use #5 variable)
(2025/09/03 KS Rev B - Replace Renishaw ON/OFF Subs with M-Codes)

M30
%
