# Magnetic-Susceptibility-Simulation
This work is for understanding the temperature and the frequency dependence of magnetic susceptibility.

The formula is based on the well-cited paper given by Rosensweig, 2002. Who beautifully indicated that the heating power of magnetic fluid is intrinsically related to the imaginary susceptibility, and externally related to the field strength and frequency. However, this is not the main purpose of this code. This code aims at demonstrating the shift in blocking temperature when the frequency is alterting. 

The blocking temperature is defined as the temperature which leads to that: the relaxation time = the measurement time. That is, while the measurement time is known (it depends on what device you use), the relaxation time of the magnetic material varies with its temperature. In theory, there will only be ONE Temperature that can make the relaxation time = measurement time. This Temperature can be regarded as the blocking temperature (although may difine the blocking temperature is the temperature makes: 100*relaxation time = measurement time see Ref 2). 

The previous definition of TB is quite clear, but a question lingers in mind is that some used the temperature at the maximum of ZFC curve to represent the TB. How can this definition be related to the previous one? That is the main purpose of this code. By visualizing the relationship between the susceptibiliy and the temperature, I may figure it out at some point?

Finger crossed.

Ref:
(1) Rosensweig, R.E.E., 2002. Heating magnetic fluid with alternating magnetic field. Journal of Magnetism and Magnetic Materials, 252(0), pp.370–374. 

(2) Blundell, S. & Thouless, D., 2003. Magnetism in Condensed Matter. American Journal of Physics, 71(1), p.171.
