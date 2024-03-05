#!/bin/bash
source ~/catkin_ws/devel/setup.bash

sleep 20s
gnome-terminal --title="amp" -x bash -c "roslaunch mavros apm.launch"

sleep 10s
source ~/catkin_ws/devel/setup.bash
gnome-terminal --title="script" -x bash -c "cd catkin_ws;
rosrun fungi onboard.py; exec"

