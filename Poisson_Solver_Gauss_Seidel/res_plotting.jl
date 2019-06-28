
using DelimitedFiles

using CSV
using PyPlot
#rc("font", family="Times New Roman", size=18.0)
rc("font", family="Arial", size=16.0)

nx = 128
ny = 128

gs_residual = readdlm("gs_residual.txt")#, datarow = 3, type=Float64)
gs_iter_hist =  gs_residual[:,1]
gs_res_hist = convert(Matrix, gs_residual[:,2:3])

cg_residual = readdlm("cg_residual.txt")#, datarow = 3, type=Float64)
cg_iter_hist =  cg_residual[:,1]
cg_res_hist = convert(Matrix, cg_residual[:,2:3])

mg_residual = readdlm("mg_residual.txt")#, datarow = 3, type=Float64)
mg_iter_hist =  mg_residual[:,1]
mg_res_hist = convert(Matrix, mg_residual[:,2:3])

fig = figure("An example", figsize=(14,6));
ax1 = fig[:add_subplot](1,2,1);
ax2 = fig[:add_subplot](1,2,2);

# ax1.semilogy(gs_iter_hist, gs_res_hist[:,2],color="blue",
#             lw=4,label="Gauss-Seidel method")
ax1.semilogy(cg_iter_hist, cg_res_hist[:,2],color="orange",
            lw=4,label="Conjugate-Gradient method")
# ax1.semilogy(mg_iter_hist, mg_res_hist[:,2],color="green",
#             lw=4,label="Multigrid framework")

#ax.set_xlim(0,1000)
ax1.legend()
# ax1.set_title("Residual history")

# ax2.semilogy(cg_iter_hist, cg_res_hist[:,2],color="orange",
#             lw=2,label="Conjugate-Gradient method")
ax2.semilogy(mg_iter_hist, mg_res_hist[:,2],color="green",
            lw=4,label="Multigrid framework")

#ax.set_xlim(0,1000)
ax2.legend()
# plt.title("Residual history")

fig.tight_layout()
fig.savefig("residual2.pdf")