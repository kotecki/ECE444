******************************************************************************
*  Integrated Circuit Diffusion Diode
*     - saturation current = 80 nA/m**2
*     - unit area of 5x5 micron
*******************************************************************************

.model diodeic d 
+ is = 2e-18
+ tnom = 27
+ eg = 1.12
+ rs = 0.1
+ m = 0.45
+ bv = 20
+ ibv = .1
