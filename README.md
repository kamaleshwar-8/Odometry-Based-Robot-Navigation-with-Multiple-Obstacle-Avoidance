# Odometry-Based Robot Navigation with Multiple Obstacle Avoidance

## Overview
This MATLAB script implements an odometry-based navigation algorithm for a mobile robot that navigates to a goal position while avoiding multiple obstacles. The robot uses a simple motion model with constant linear velocity and adjusts its heading based on both goal direction and obstacle positions.

## Features
- Single-robot navigation using odometry
- Multiple obstacle avoidance capabilities
- Constant linear velocity with dynamic angular adjustments
- Real-time visualization of robot's path
- Safe navigation with obstacle radius consideration
- Goal-directed movement with obstacle avoidance behavior

## Prerequisites
- MATLAB (any recent version)
- MATLAB Figure Window support

## Parameters
- `robot_pose`: Initial robot pose [x, y, theta]
- `goal`: Target position [x, y]
- `dt`: Time step (0.1 seconds)
- `linear_velocity`: Constant forward speed (0.5 units/s)
- `obstacles`: Matrix of obstacle positions (each row: [x, y])
- `obstacle_radius`: Radius of each obstacle (0.5 units)

## How It Works
1. The robot calculates direction to the goal in each iteration
2. Implements obstacle avoidance by:
   - Detecting obstacles within a safety radius
   - Adjusting heading when obstacles are detected
   - Adding a 45-degree deviation to avoid obstacles
3. Updates robot position using:
   - Constant linear velocity
   - Proportional control for angular velocity
   - Basic odometry motion model
4. Continues until reaching within 0.2 units of the goal

## Visualization
The script provides real-time visualization showing:
- Robot's current position (blue dots)
- Goal position (red x)
- Obstacles (black circles)
- Complete trajectory of the robot
- Grid for better position reference

## Control Strategy
- Uses proportional control for angular velocity
- Implements a reactive obstacle avoidance strategy
- Maintains constant linear velocity
- Adjusts heading based on:
  - Error angle to goal
  - Proximity to obstacles
  - Safety distance considerations

## Usage
1. Configure the simulation parameters:
   ```matlab
   robot_pose = [0, 0, 0];  % Starting pose
   goal = [10, 10];         % Goal position
   obstacles = [5,5;6,5;6,6;7,7;7,6];  % Obstacle positions
   ```
2. Run the script
3. Monitor the visualization window to observe the robot's navigation

## Plot Configuration
- X and Y axis limits: [-1, 12]
- Grid enabled for better visualization
- Real-time position updates
- Clear obstacle and goal markers

## Safety Features
- Obstacle radius consideration (0.5 units)
- Additional safety margin (0.5 units)
- Reactive avoidance behavior
- Normalized angle calculations

## Output
![odo_model](https://github.com/user-attachments/assets/e8f10bd5-bb4b-4d60-9c82-9d688a68028f)


## Notes
- The algorithm uses a simple but effective obstacle avoidance strategy
- The robot maintains constant forward speed while adjusting direction
- Suitable for environments with static obstacles
- Goal reaching threshold is set to 0.2 units
