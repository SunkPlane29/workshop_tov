# The reason behind making such poor choices of convertion factor naming
# is for the purpose of using implicit multiplication that automatically
# will convert to the tov unit system.
# Example:
# 
# p0 = 100MeVfm3
#
# instead of
#
# p0 = 100MeVfm3_to_pu

c = G = MSOLAR = 1

si_c        = 2.99792458e8     # m s^(-1)
si_G        = 6.67430          # m^3 kg^(-1) s^(-2)
si_MSOLAR   = 1.98855e30  # kg
si_ħ        = 6.582119569e-16 # eV s 

# convertion factors for c = G = MSOLAR = 1 system to SI units
# mu, lu, tu are shorthands for mass unit, length unit and time unit
# respectively
mu = si_MSOLAR 
lu = si_G*si_MSOLAR*si_c^(-2)
tu = si_G*si_MSOLAR*si_c^(-3)
kg = mu^(-1)
m  = lu^(-1)
s  = lu^(-1)

#pressure unit and pascal
pu = mu*lu^(-1)*tu^(-2)
pa = pu^(-1)

# useful relation for natural units (c = ħ = k_b = 1)
ħc = (si_c*10^(15))*(si_ħ*10^(-6))

fm4_to_mevfm3 = ħc
mevfm3_to_fm4 = ħc^(-1)
fm4_to_mev4 = ħc^4
mev4_to_fm4 = ħc^(-4)
mev4_to_mevfm3 = ħc^(-3)
mevfm3_to_mev4 = ħc^3

ev_to_j = 1.602176634e-19
j_to_ev = (1.602176634e-19)^(-1)

mev4_to_jm3 = ((si_ħ*10^(-6))*si_c)^(-3) * (EV_TO_JOULE*10^6)
jm3_to_mev4 = mev4_to_j^(-1)

MeVfm3 = mevfm3_to_mev4*mev4_to_jm3*pa
pu_to_mevfm3 = MeVfm3^(-1)