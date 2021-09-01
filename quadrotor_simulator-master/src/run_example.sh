roslaunch so3_quadrotor_simulator simulator.launch & sleep 3;
roslaunch trajectory_generator traj_gen.launch & sleep 1;
rqt_graph & sleep 1;
wait;

