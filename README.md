[![Udacity - Robotics NanoDegree Program](https://s3-us-west-1.amazonaws.com/udacity-robotics/Extra+Images/RoboND_flag.png)](https://www.udacity.com/robotics)

# RoboND-KUKAChallenge
My solution for the KUKA [robotic arm challenge](https://www.udacity.com/robot-learning-lab) in collaboration with KUKA and the Learning Lab at KIT, which took first place with a time of 36.24599838256836 seconds

## Goal and Basic Idea

Students learn to implement path planning algorithms by navigating a maze. Usually, path planning problems through mazes are reduced to two dimensions. However, this project will extend the search space by a third dimension, the orientation of the gripper around the vertical z-axis.

An experiment will be executed as follows: first, the robot moves to a specified start position somewhere within the maze. There the gripper will pick up an object, that is shaped like a cuboid. Then students will be able to take over and navigate the robot through the maze. They will have to command 2D positions and in order to get around corners, they will have to rotate the cuboid in the corners. They will not be able to get around corners otherwise. Once the goal is reached, the cuboid will be placed on the table at the goal position.

## Implementation

Students can use an interface (```planning_iface```) that uses two services:    
- ```Move```: command the robot by sending a 2D pose, the robot will move on a linear path to this pose  
- ```CheckPath```: verify if a linear path between two 2D poses is valid   


Students get a Python template in the ```scripts``` folder that they can use to implement their solution. It is expected that they implement a search algorithm like RRT or A-Star. While doing so, they will generate vertexes (poses) and egdes (linear paths between poses) and they can verify if two vertexes and a single edge between the two vertexes are valid by calling ```CheckPath```.

The time, that the student's implementation needs from start to finish, will be recorded, so that a ranking can be created.

## Current State

A rough version of the ```Move``` and ```CheckPath``` commands exists. A testing setup with a maze in the scene that can be used for initial prototyping.

The official KIT repository can be found here:

https://github.com/KITrobotics/rll_path_planning_project

A workspace with the project can be set up with:
```
mkdir ~/catkin_ws
cd ~/catkin_ws
catkin_init_workspace
wstool init src https://gitlab.ipr.kit.edu/rll/rll_planning_project/raw/master/planning_project.rosinstall
catkin build
source devel/setup.bash
```

The simulation can be started with:   
`roslaunch rll_planning_project moveit_planning_execution.launch`

And the planning interface with:   
`roslaunch rll_planning_project planning_iface.launch`

The Python node with the path planning algorithm is launched with:   
`roslaunch rll_planning_project path_planner.launch`

A single planning and path execution run can be initiated with:   
`roslaunch rll_project_runner run_project.launch`

The example path planning code with a few hard-coded calls to the ```Move``` and ```CheckPath``` services can be found in ```./scripts/path_planner.py```. All code created for the contest is placed in this file.

The initial position and the dimensions of the grasp object can be changed in the launch file for the planning interface (```./launch/planning_iface.launch```). The parameters can also be altered on the command-line by passing them as arguments to the launch command.

## My Entry

My code is set up to go explore down a given path, test for the presence of intersections at a given interval, and lay down a new node wherever one is found. 

Orientation is specified exclusively with angles in multiples of 90 degrees (in my testing, I found that the object plus gripper couldn't fit in a corridor sideways, and that there was most likely no place where diagonal movement would be possible). Based on the goal orientation, the path planner uses one angle (either 0 or 180) for horizontal travel, and another (90 or 270) for vertical. 

Path planning is based on A*, except the heuristic takes into account the unexplored directions relative to the goal - a node with an open direction orthogonal to the goal will get a big bonus to the heuristic score, one with an open direction towards the goal will get a smaller bonus, and one with all open directions leading away from the goal will get a penalty.

Videos of path planner in action:

[Practice Run #1](https://www.youtube.com/watch?v=sJKaQMxRF9k)

[Practice Run #2](https://www.youtube.com/watch?v=7zpHlE4PI3w)

[Test With Simulator on Local System](https://www.youtube.com/watch?v=hizgnEDYlCM)

[Official Contest Run](https://www.youtube.com/watch?v=akvRFcQu1Xc)
