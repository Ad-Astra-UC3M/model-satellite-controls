close all

out = sim('autogyro.slx');
plotResults(out.t_out, out.v_out, out.drag_out, out.F_out, out.e_out, out.v_ref)