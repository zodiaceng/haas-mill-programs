O08000 (Haas Tool Breakage Sub)
(2023/11/17 KS)

(User Inputs)
#1=.005 (Pull Out Sensitivity - Must Be Greater Than Length Wear Values)
#2=.005 (Breakage Sensitivity - Must Be Greater Than Length Wear Values)
#3=.030 (X Shift From Tool Setter Centerline)
#4=.030 (Y Shift From Tool Setter Centerline)
#5=98. (Extended Work Offset for Tool Setter Location - Must Use Decimal Point)
(End User Inputs)

G10 L20 P#5 G90 X#10585 Y#10586 Z#10582 (Set Work Offset for Tool Setter)
T#3026 M6 (Send Spindle Home - Stop Spindle - Turn Off Coolant)
G0 G90 G154 P98 X#3 Y#4 (Position Over Tool Setter XY)
G65 P9855 (Turn On Tool Setter)
G43 H#3026 Z.2 (Activate Tool Offset In Spindle - Position For Rough Tool Pullout Detection)

M96 P10 Q17 (Alarm if Probe Signal Found - Pull Out)
GOTO100 (Go To N100 Alarm)
N10
G1 Z#1 F150. (Position For Fine Tool Pullout Detection)
M96 P20 Q17 (Alarm if Probe Signal Found - Pull Out)
GOTO100 (Go To N100 Alarm)
N20
G1 Z-#2 F150. (Position For Tool Breakage Detection)
M96 P200 Q17 (Alarm if Probe Signal Not Found - Breakage)
T#3026 M6 (Send Spindle Home)
G65 P9856 (Turn Off Tool Setter)
G43 H#3026 (Activate Tool Offset In Spindle)
G90 (Absolute Positioning)
M99 (Return to Main Program)

N100
#3000=100 (Tool Has Pulled Out)

N200
#3000=200 (Tool Has Broken)

(Revision History)
(2023/11/16 KS Rev N/C - Initial Release)
(2023/11/17 KS Rev A)
(Changed G90 G53 Z0. to T#3026 M6 to stop the spindle, turn off coolant and orient simultaneously)
(Added G90 before M99 to force Absolute Positioning regardless of condition within Renishaw/Haas subs)

M30
