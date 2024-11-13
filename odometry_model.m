% Robot Navigation to a Goal using Odometry-based Motion Model with Multiple Obstacle Avoidance

% Initialize the robot's pose: [x, y, theta]
robot_pose = [0, 0, 0]; % Starting at the origin facing right (0 radians)
goal = [10, 10]; % Goal position
dt = 0.1; % Time step
linear_velocity = 0.5; % Constant linear velocity

% Define multiple obstacles as a matrix where each row is an obstacle [x, y]
obstacles = [5,5;6,5;6,6;7,7;7,6]; 

% Define the radius of each obstacle
obstacle_radius = 0.5; % Radius of the obstacles

% Initialize the plot
figure;
hold on;
grid on;
xlim([-1, 12]); % Set x-axis limits
ylim([-1, 12]); % Set y-axis limits
title('Robot Navigation to Goal with Multiple Obstacle Avoidance');
xlabel('X Position');
ylabel('Y Position');
plot(goal(1), goal(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2); % Plot the goal
plot(obstacles(:, 1), obstacles(:, 2), 'ko', 'MarkerSize', 10, 'LineWidth', 2); % Plot each obstacle% Plot all obstacles

% Navigation loop
while norm(robot_pose(1:2) - goal(1:2)) > 0.2
    % Calculate the direction to the goal
    direction_to_goal = atan2(goal(2) - robot_pose(2), goal(1) - robot_pose(1));
    
    % Calculate the angle error
    error_angle = direction_to_goal - robot_pose(3);
    
    % Normalize the error angle to the range [-pi, pi]
    error_angle = atan2(sin(error_angle), cos(error_angle));
    
    % Initialize a variable to track whether an obstacle is detected
    obstacle_detected = false;

    % Check distances to all obstacles
    for i = 1:size(obstacles, 1)
        distance_to_obstacle = norm(robot_pose(1:2) - obstacles(i, :));
        
        % If the robot is close to an obstacle, adjust its path
        if distance_to_obstacle < obstacle_radius + 0.5 % 0.5 is the safety distance
            obstacle_detected = true; % Set flag
            % Calculate the avoidance direction
            avoidance_direction = atan2(robot_pose(2) - obstacles(i, 2), robot_pose(1) - obstacles(i, 1));
            % Adjust the error angle to steer away from the obstacle
            error_angle = error_angle + pi/4; % Turn 45 degrees away from the obstacle
        end
    end

    % Calculate the angular velocity
    angular_velocity = 2 * error_angle; % Proportional control for angular velocity

    % Update the robot's pose
    robot_pose(3) = robot_pose(3) + angular_velocity * dt; % Update theta
    robot_pose(1) = robot_pose(1) + linear_velocity * cos(robot_pose(3)) * dt; % Update x
    robot_pose(2) = robot_pose(2) + linear_velocity * sin(robot_pose(3)) * dt; % Update y

    % Plot the robot's current position
    plot(robot_pose(1), robot_pose(2), 'bo', 'MarkerSize', 5, 'LineWidth',2);
    pause(dt); % Pause for a moment to visualize the motion
end

disp('Goal reached!');
hold off; % Release the plot hold