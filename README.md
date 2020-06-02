# YD-segmented-simulation
we provide an extensive set of simulations where 𝒟 is either Uniform, Gamma or truncated Normal, 
which shows the global accuracy of the Young/Daly formula, even when the distribution 𝒟 had a large standard
deviation (and when one cannot use a first-order approximation).
Hence we establish that the relevance of the formula goes well beyond its original framework.

# code
*gen_faults.m generate faults which obey the Expentional distribution
*simulation_static.m is a simulate function using static strategy
*simulation_dynamic.m is a simulate function using dynamic strategy
*test_Uniform.m do the simulations for iterations who obey Uniform distribution
*test_gamma.m do the simulations for iterations who obey Gamma distribution
*test_Nniform.m do the simulations for iterations who obey Normal distribution
*save_data.m and save_data_new.m save data as csv format
*R_final_plot.R plot figures using ggplot2 in R studio
