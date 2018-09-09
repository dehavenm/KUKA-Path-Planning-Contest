#! /usr/bin/env python

import rospy
import actionlib
from rll_planning_project.srv import *
from rll_planning_project.msg import *
from geometry_msgs.msg import Pose2D
from heapq import heappush, heappop # for priority queue
import math
import time

class Node:
    def __init__(self, x_pos, y_pos, theta_pos, orientation, parent, explored_directions):
        
        #arguments, x_pos, y_pos, theta_pos: 2D pose of node
        self.x = x_pos
        self.y = y_pos
        self.theta = theta_pos
        
        #orientation of node - 0 = horizontal, 1 = vertical
        self.orientation = orientation
        
        self.parent = parent
        
        #directions that have been explored [up, right, down, left] - 0=unknown, 1=free, -1=blocked
        self.explored = explored_directions[:]
        
        #distance from start node
        if parent == None:
            self.start_dist = 0
        else:
            self.start_dist = parent.start_dist + self.distance(parent)+0.17
            
        #score based on distance from start plus heuristic function to goal
        self.score = self.start_dist
        
        #direction to explore if node is chosen for exploration
        self.best_direction = None

        
    #calculates distance between self and another node
    def distance(self, other):
        return math.sqrt((other.x-self.x)**2 + (other.y-self.y)**2)
    
    #determine if two instances of Node class are identical
    def __eq__(self, other): 
        if other == None:
            return False
        else:
            return self.__dict__ == other.__dict__
            
    #allow for sorting of nodes based on cost function
    def __lt__(self, other):
        return self.score < other.score
        
    #update cost score based on distances and explored directions
    def update(self, goal, bonus, debug = False):
        angle = math.atan2( (goal.y-self.y), (goal.x-self.x)  )
        
        if debug:
            rospy.loginfo("angle: %f", angle)
            
        
        #calculate distance to goal for base heuristic score
        h = abs(goal.x - self.x) + abs(goal.y - self.y)
        
        #define exploration direction codes by angle
        angle_dict = {0:1.570796327, 1:0, 2:-1.570796327, 3:3.141592654}

        #take difference between possible exploration directions and angle to goal
        for key in angle_dict:
            angle_dict[key] = abs(angle-angle_dict[key])
            if angle_dict[key] > 3.141592654:
                angle_dict[key] = abs(angle_dict[key] - 6.283185307)
          
        #sort direction codes by difference between goal angle and direction angle
        order = sorted(angle_dict, key=angle_dict.get)
        
        if debug:
            rospy.loginfo("order: " + repr(order))
        
        self.best_direction = None
        
        bonus_applied = False        
        
        for n in range(4):
            if self.explored[order[n]] == 0 and not bonus_applied:
                #determine best direction for exploration
                if self.best_direction == None:
                    self.best_direction = order[n]
                    
                bonus_applied = True
                
                if debug:
                    rospy.loginfo("bonus: %f", n)
                
                #apply bonus to heuristic score
                if order[n]==0 or order[n]==2:
                    if abs(goal.y-self.y) < 0.028 or (self.distance(goal) < 0.11 and self.orientation == goal.orientation):
                        h = h*bonus[4]
                    else:
                        h = h*bonus[n]
                        
                if order[n]==1 or order[n]==3:
                    if abs(goal.x-self.x) < 0.028 or (self.distance(goal) < 0.11 and self.orientation == goal.orientation):
                        h = h*bonus[4]
                    else:
                        h = h*bonus[n]
        
        self.score = self.start_dist + h
        #if node has no remaining directions to explore, move to bottom of list
        if self.best_direction == None:
            self.score += 1000
        


                    
def explore_linear(node_list, parent, direction, goal, resolution, bonus, h_angle, v_angle, size, check_srv):
    if direction == 0:
        x_move = 0.0
        y_move = 1.0
        
        explored_dir = 2
        
        parallel_orientation = 1
        perpendicular_orientation = 0
        
        perpendicular_check_goal = goal.x
        perpendicular_check_parent = parent.x
        parallel_check_goal = goal.y
        parallel_check_parent = parent.y 
        
        parallel_theta = v_angle
        perpendicular_theta = h_angle
        
        mid_explored_plus = [0, 0, 1, -1]
        mid_explored_minus = [0, -1, 1, 0]
        mid_explored_both = [0, 0, 1, 0]
        mid_explored_stop = [0, -1, 1, -1]
        end_explored = [-1, 0, 1, 0]
    elif direction == 1:
        x_move = 1.0
        y_move = 0.0
        
        explored_dir = 3
        
        parallel_orientation = 0
        perpendicular_orientation = 1
        
        perpendicular_check_goal = goal.y
        perpendicular_check_parent = parent.y
        parallel_check_goal = goal.x
        parallel_check_parent = parent.x
        
        parallel_theta = h_angle
        perpendicular_theta = v_angle
        
        mid_explored_plus = [0, 0, -1, 1]
        mid_explored_minus = [-1, 0, 0, 1]
        mid_explored_both = [0, 0, 0, 1]
        mid_explored_stop = [-1, 0, -1, 1]
        end_explored = [0, -1, 0, 1]

    elif direction == 2:
        x_move = 0.0
        y_move = -1.0
        
        explored_dir = 0
        
        parallel_orientation = 1
        perpendicular_orientation = 0
        
        perpendicular_check_goal = goal.x
        perpendicular_check_parent = parent.x
        parallel_check_goal = goal.y
        parallel_check_parent = parent.y
        
        parallel_theta = v_angle
        perpendicular_theta = h_angle
        
        mid_explored_plus = [1, 0, 0, -1]
        mid_explored_minus = [1, -1, 0, 0]
        mid_explored_both = [1, 0, 0, 0]
        mid_explored_stop = [1, -1, 0, -1]
        end_explored = [-1, 0, -1, 0]
    elif direction == 3:
        x_move = -1.0
        y_move = 0.0
        
        explored_dir = 1 
        
        parallel_orientation = 0
        perpendicular_orientation = 1
        
        perpendicular_check_goal = goal.y
        perpendicular_check_parent = parent.y
        parallel_check_goal = goal.x
        parallel_check_parent = parent.x 
        
        parallel_theta = h_angle
        perpendicular_theta = v_angle
        
        mid_explored_plus = [0, 1, -1, 0]
        mid_explored_minus = [-1, 1, 0, 0]
        mid_explored_both = [0, 1, 0, 0]
        mid_explored_stop = [-1, 1, -1, 0]
        end_explored = [0, -1, 0, -1]
    

   
    
    #Pose2D objects for test points 
    check_fwd_a = Pose2D()
    check_fwd_b = Pose2D()
    
    check_plus_a = Pose2D()
    check_plus_b = Pose2D()
    check_minus_a = Pose2D()
    check_minus_b = Pose2D()
    
    #if goal lies along direction of exploration, check if path to goal is clear
    if abs(perpendicular_check_goal-perpendicular_check_parent) < size*0.06 and goal.orientation == parent.orientation:
        check_fwd_a.x, check_fwd_a.y, check_fwd_a.theta= parent.x, parent.y, parent.theta
        check_fwd_b.x, check_fwd_b.y, check_fwd_b.theta= goal.x, goal.y, goal.theta
        resp = check_srv(check_fwd_a, check_fwd_b)
        #rospy.loginfo("Goal check:" + repr(resp.valid))
        if resp.valid:
            goal.parent = parent
            return goal
            
    
    #if exploration direction is towards the goal, check point orthogonal to goal
    check_ortho = False
    if direction == 1 or direction == 0:
        if goal.orientation != parent.orientation and parallel_check_goal > parallel_check_parent:
            check_ortho = True
    elif direction == 3 or direction == 2:
        if goal.orientation != parent.orientation and parallel_check_goal < parallel_check_parent:
            check_ortho = True
            

    offset = size*0.025

    if direction == 0 or direction == 2:
        check_plus_a.x = parent.x + offset
        check_plus_b.x = check_plus_a.x + 0.006
        check_minus_a.x = parent.x - offset
        check_minus_b.x = check_minus_a.x - 0.006    
        
        check_plus_a.y = parent.y
        check_plus_b.y = parent.y
        check_minus_a.y = parent.y
        check_minus_b.y = parent.y
    elif direction == 1 or direction == 3:
        check_plus_a.x = parent.x
        check_plus_b.x = parent.x
        check_minus_a.x = parent.x
        check_minus_b.x = parent.x

        check_plus_a.y = parent.y + offset
        check_plus_b.y = check_plus_a.y + 0.006
        check_minus_a.y = parent.y - offset
        check_minus_b.y = check_minus_a.y - 0.006
        
    check_plus_a.theta = perpendicular_theta
    check_plus_b.theta = perpendicular_theta
    check_minus_a.theta = perpendicular_theta
    check_minus_b.theta = perpendicular_theta


   

    
    last_node = parent
    

    check_fwd_a.theta = parent.theta
    check_fwd_b.theta = parent.theta
    
    check_fwd_b.x = parent.x + x_move * resolution
    check_fwd_b.y = parent.y + y_move * resolution
    
    check_fwd_a.x = check_fwd_b.x - x_move * 0.006
    check_fwd_a.y = check_fwd_b.y - y_move * 0.006
    
    check_plus_a.x += x_move * resolution
    check_plus_b.x += x_move * resolution
    check_minus_a.x += x_move * resolution
    check_minus_b.x += x_move * resolution   
    
    check_plus_a.y += y_move * resolution
    check_plus_b.y += y_move * resolution
    check_minus_a.y += y_move * resolution
    check_minus_b.y += y_move * resolution
    

    
    last_check = False
    ortho_intersect = False    
    
    while(True):

        
      
        #check forward area in direction of exploration
        resp = check_srv(check_fwd_a, check_fwd_b)
        if resp.valid:
            check_fwd_a.x += x_move * resolution
            check_fwd_a.y += y_move * resolution
            
            check_fwd_b.x += x_move * resolution
            check_fwd_b.y += y_move * resolution
            
            check_plus_a.x += x_move * resolution
            check_plus_b.x += x_move * resolution
            
            check_minus_a.x += x_move * resolution
            check_minus_b.x += x_move * resolution   
            
            check_plus_a.y += y_move * resolution
            check_plus_b.y += y_move * resolution
            
            check_minus_a.y += y_move * resolution
            check_minus_b.y += y_move * resolution
        else:
            #if corridor has ended, determine if intersection at end

            found_intersection = False
            end_x = check_fwd_a.x
            end_y = check_fwd_a.y
            for i in range(15, -15, -5):
                if not found_intersection:
                    check_fwd_a.x = end_x + x_move*i*0.001
                    check_fwd_a.y = end_y + y_move*i*0.001

                    check_fwd_b.x = check_fwd_a.x + x_move*0.01
                    check_fwd_b.y = check_fwd_a.y + y_move*0.01
                    
                    check_fwd_a.theta = parallel_theta
                    check_fwd_b.theta = perpendicular_theta
                    

                    resp = check_srv(check_fwd_a, check_fwd_b)
                    if resp.valid:
                        new = Node(check_fwd_a.x, check_fwd_a.y, check_fwd_a.theta, parallel_orientation, parent, [1, 1, 1, 1])
                        new.update(goal, bonus)
                        
                        node_list.append(new)
                        
                        new2 = Node(check_fwd_b.x, check_fwd_b.y, check_fwd_b.theta, perpendicular_orientation, new, end_explored)
                        new2.update(goal, bonus)
                        
                        node_list.append(new2)
                        found_intersection = True
                
            
            last_node.explored[direction] = -1
            last_node.update(goal, bonus)
            break        
        
        if check_ortho:
            if direction == 0 or direction == 2:
                if abs(check_plus_b.y-parallel_check_goal) < 1.5*resolution:
                    check_fwd_b.y = goal.y
                    check_fwd_a.y = check_fwd_b.y - y_move * 0.006
                    
                    check_plus_a.y = goal.y
                    check_plus_b.y = goal.y
                    check_minus_a.y = goal.y
                    check_minus_b.y = goal.y
            elif direction == 1 or direction == 3:
                if abs(check_plus_b.x-parallel_check_goal) < 1.5*resolution:
                    check_fwd_b.x = goal.x
                    check_fwd_a.x = check_fwd_b.x - x_move * 0.006
                    
                    check_plus_a.x = goal.x
                    check_plus_b.x = goal.x
                    check_minus_a.x = goal.x
                    check_minus_b.x = goal.x
            check_ortho = False
            ortho_intersect = True

        
        resp_plus = check_srv(check_plus_a, check_plus_b)
        resp_minus = check_srv(check_minus_a, check_minus_b)


        
        if resp_plus.valid and resp_minus.valid:
            new = Node(check_fwd_b.x, check_fwd_b.y, check_fwd_b.theta, parallel_orientation, parent, mid_explored_both)
            new.update(goal, bonus)
            node_list.append(new)
            last_node.explored[direction] = 1
            last_node.update(goal, bonus)
            last_node = new
            last_check = True
        elif resp_plus.valid:
            new = Node(check_fwd_b.x, check_fwd_b.y, check_fwd_b.theta, parallel_orientation, parent, mid_explored_plus)
            new.update(goal, bonus)
            node_list.append(new)
            last_node.explored[direction] = 1
            last_node.update(goal, bonus)
            last_node = new
            last_check = True
        elif resp_minus.valid:
            new = Node(check_fwd_b.x, check_fwd_b.y, check_fwd_b.theta, parallel_orientation, parent, mid_explored_minus)
            new.update(goal, bonus)
            node_list.append(new)
            last_node.explored[direction] = 1
            last_node.update(goal, bonus)
            last_node = new
            last_check = True            
        elif last_check == True:
            if check_ortho:
                if direction == 0 and check_plus_a.y-goal.y > 3.0*resolution:
                    break
                if direction == 1 and check_plus_a.x-goal.x > 3.0*resolution:
                    break
                if direction == 2 and goal.y-check_plus_a.y > 3.0*resolution:
                    break
                if direction == 3 and goal.x-check_plus_a.x > 3.0*resolution:
                    break
            advance = 2.0*resolution
            check_fwd_a.x += x_move * advance
            check_fwd_a.y += y_move * advance
            check_fwd_b.x += x_move * advance
            check_fwd_b.y += y_move * advance
            
            check_plus_a.x += x_move * advance
            check_plus_b.x += x_move * advance
            check_minus_a.x += x_move * advance
            check_minus_b.x += x_move * advance  
            
            check_plus_a.y += y_move * advance
            check_plus_b.y += y_move * advance
            check_minus_a.y += y_move * advance
            check_minus_b.y += y_move * advance
            last_check = False
        else:
            if check_ortho:
                if direction == 0 and check_plus_a.y-goal.y > size*.25:
                    new = Node(check_fwd_b.x, check_fwd_b.y, check_fwd_b.theta, parallel_orientation, parent, mid_explored_stop)
                    new.update(goal, bonus)
                    last_node.explored[direction] = 1
                    last_node.update(goal, bonus)
                    node_list.append(new)
                    break
                if direction == 1 and check_plus_a.x-goal.x > size*.25:
                    new = Node(check_fwd_b.x, check_fwd_b.y, check_fwd_b.theta, parallel_orientation, parent, mid_explored_stop)
                    new.update(goal, bonus)
                    last_node.explored[direction] = 1
                    last_node.update(goal, bonus)
                    node_list.append(new)
                    break
                if direction == 2 and goal.y-check_plus_a.y > size*.25:
                    new = Node(check_fwd_b.x, check_fwd_b.y, check_fwd_b.theta, parallel_orientation, parent, mid_explored_stop)
                    new.update(goal, bonus)
                    last_node.explored[direction] = 1
                    last_node.update(goal, bonus)
                    node_list.append(new)
                    break
                if direction == 3 and goal.x-check_plus_a.x > size*.25:
                    new = Node(check_fwd_b.x, check_fwd_b.y, check_fwd_b.theta, parallel_orientation, parent, mid_explored_stop)
                    new.update(goal, bonus)
                    last_node.explored[direction] = 1
                    last_node.update(goal, bonus)
                    node_list.append(new)
                    break
            last_check = False
        

            

        
    #rospy.loginfo("stopped at: %f, %f", check_fwd_b.x, check_fwd_b.y)

                
    return None
            




def explore_perpendicular(node_list, parent, direction, goal, resolution, bonus, h_angle, v_angle, size, check_srv):
    if direction == 0:
        x_move = 0.0
        y_move = 1.0
        explored_dir = 2
        new_orientation = 1
        new_theta = v_angle
        new_explored = [0, -1, 1, -1]
    elif direction == 1:
        x_move = 1.0
        y_move = 0.0
        explored_dir = 3
        new_orientation = 0
        new_theta = h_angle
        new_explored = [-1, 0, -1, 1]
    elif direction == 2:
        x_move = 0.0
        y_move = -1.0
        explored_dir = 0
        new_orientation = 1
        new_theta = v_angle
        new_explored = [1, -1, 0,-1]
    elif direction == 3:
        x_move = -1.0
        y_move = 0.0
        explored_dir = 1 
        new_orientation = 0
        new_theta = h_angle
        new_explored = [-1, 1, -1, 0]
        
    check_a = Pose2D()
    check_b = Pose2D()

    check_a.x = parent.x    
    check_a.y = parent.y                
    check_a.theta = parent.theta    
    
    check_b.x = parent.x + 0.01*x_move   
    check_b.y = parent.y + 0.01*y_move                
    check_b.theta = new_theta
    resp = check_srv(check_a, check_b)
    if not resp.valid:
        check_b.x = parent.x + 0.04*x_move   
        check_b.y = parent.y + 0.04*y_move                
        check_b.theta = new_theta
        resp = check_srv(check_a, check_b)
        if not resp.valid:
            parent.explored[direction] = -1
            parent.update(goal, bonus)
            return None
            
    parent.explored[direction] = 1
         
    new = Node(check_b.x, check_b.y, new_theta, new_orientation, parent, new_explored)
    
    new.update(goal, bonus)
    parent.update(goal, bonus)
    
    
    for point in list(node_list):
        if parent.distance(point) < 2.1*resolution:
            if (parent.explored == point.explored and point.start_dist > 0.001) and (parent.parent == point.parent and parent.orientation == point.orientation):
                node_list.remove(point)
    
    
    
    node_list.append(new)
    
    if new.orientation == goal.orientation and new.distance(goal) < size*0.1:
            
            check_a.x = new.x    
            check_a.y = new.y                
            check_a.theta = new.theta
            
            check_b.x = goal.x    
            check_b.y = goal.y                
            check_b.theta = goal.theta
            resp = check_srv(check_a, check_b)
            #rospy.loginfo("Goal check:" + repr(resp.valid))
            if resp.valid:
                goal.parent = new
                return goal
    
        
    
    
    return None
            
        
        
    
    
def generate_path(xStart, yStart, tStart, xGoal, yGoal, tGoal, map_width, map_length, check_srv): 
    search_resolution = 0.018
    #bonus to heuristic score based on unexplored directions relative to angle to goal
    bonus = [0.75, 1.0, 3.0, 4.0, 0.4]   
    
    size = min(map_width, map_length)
    
    h_angle = 1.570796327
    
    v_angle = 0.0
    
    
    node_list = []
    if  abs(math.sin(tStart)) < .7071:
        start_direction = 1
        if math.cos(tStart) < 0.0:
            v_angle = 3.141592654
        else:
            v_angle = 0.0
    else:
        start_direction = 0
        if math.sin(tStart) < 0.0:
            h_angle = 4.71
        else:
            h_angle = 1.570796327
        
    if abs(math.sin(tGoal)) < .7071:
        goal_direction = 1
        if math.cos(tGoal) < 0.0:
            v_angle = 3.141592654
        else:
            v_angle = 0.0
    else:
        goal_direction = 0
        if math.sin(tGoal) < 0.0:
            h_angle = 4.71
        else:
            h_angle = 1.570796327
            
#    rospy.loginfo("h_angle %f,", h_angle)
#    rospy.loginfo("v_angle %f,", v_angle)
        
    start_node = Node(xStart, yStart, tStart, start_direction, None, [0, 0, 0, 0])
    
        
    node_list.append(start_node)
    
    goal_node = Node(xGoal, yGoal, tGoal, goal_direction, None, [1, 1, 1, 1])
    
    goal_node.score = 10000
        
    node_list.append(goal_node)
    
    start_node.update(goal_node, bonus)
    
    goal = None
    #for i in range(2):
    while(True):
        node_list.sort()
        
        best_node = node_list[0]
        
        explore_dir = best_node.best_direction
        if explore_dir == None:
            rospy.loginfo("Fail.")
            break
        #rospy.loginfo("point: %f, %f, %f, %f, " + repr(best_node.explored) + ", " + repr(best_node.best_direction), best_node.orientation, best_node.x, best_node.y, best_node.theta)
        if explore_dir == 0 or explore_dir == 2:
            if best_node.orientation == 1:
                #rospy.loginfo("Vertical")
                goal = explore_linear(node_list, best_node, explore_dir, goal_node, search_resolution, bonus, h_angle, v_angle, size, check_srv)
            else:
                #rospy.loginfo("Perpendicular")
                goal = explore_perpendicular(node_list, best_node, explore_dir, goal_node, search_resolution, bonus, h_angle, v_angle, size, check_srv)
        if explore_dir == 1 or explore_dir == 3:
            if best_node.orientation == 0:
                #rospy.loginfo("Horizontal")
                goal = explore_linear(node_list, best_node, explore_dir, goal_node, search_resolution, bonus, h_angle, v_angle, size, check_srv)
            else:
                #rospy.loginfo("Perpendicular")
                goal = explore_perpendicular(node_list, best_node, explore_dir, goal_node, search_resolution, bonus, h_angle, v_angle, size, check_srv)
                
        if goal != None:
            rospy.loginfo("Goal!")
            break
       


        
    if goal == None:
        for point in node_list:
            rospy.loginfo("point: %f, %f, %f, %f, " + repr(point.explored) + ", " + repr(point.best_direction), point.orientation, point.x, point.y, point.theta)
        return None
    else:
        path = [goal]
        next_node = goal.parent
        while next_node != start_node:
            path.append(next_node)
            #rospy.loginfo("results: %f, %f, %f,", next_node.x, next_node.y, next_node.theta)
            next_node = next_node.parent
            
            
        path.reverse()
    
    
    
    return path



def plan_to_goal(req):
    """ Plan a path from Start to Goal """
    pose_start = Pose2D()
    pose_goal = Pose2D()
    pose_check_start = Pose2D()
    pose_check_goal = Pose2D()
    pose_move = Pose2D()

    rospy.loginfo("Got a planning request")

    pose_start = req.start
    pose_goal = req.goal

    move_srv = rospy.ServiceProxy('move', Move)
    check_srv = rospy.ServiceProxy('check_path', CheckPath, persistent=True)

    ###############################################
    # Implement your path planning algorithm here #
    ###############################################

    # Input: map dimensions, start pose, and goal pose
    # retrieving input values  
    map_width = rospy.get_param('~map_width')
    map_length = rospy.get_param('~map_length')
    xStart, yStart, tStart = pose_start.x, pose_start.y, pose_start.theta
    xGoal, yGoal, tGoal = pose_goal.x, pose_goal.y, pose_goal.theta
    
    
    
    # printing input values
    rospy.loginfo("map dimensions: width=%1.2fm, length=%1.2fm", map_width, map_length)
    rospy.loginfo("start pose: x %f, y %f, theta %f", xStart, yStart, tStart)
    rospy.loginfo("goal pose: x %f, y %f, theta %f", xGoal, yGoal, tGoal)
    



    
    #start = time.time()

    path = generate_path(xStart, yStart, tStart, xGoal, yGoal, tGoal, map_width, map_length, check_srv)
    
    #end = time.time()

    #t = end-start

    #rospy.loginfo("time: %f", t)

    # Output: movement commands    
 
    if path != None:
        rospy.loginfo("Valid path")
        for point in path:
            #rospy.loginfo("point: %f, %f, %f,", point.x, point.y, point.theta)
            pose_move.x, pose_move.y, pose_move.theta = point.x, point.y, point.theta 
            # executing a move command towards the goal pose
            resp = move_srv(pose_move)

    else:
        rospy.loginfo("No path found")
    


        
    ###############################################
    # End of Algorithm #
    ###############################################


class PathPlanner:
    def __init__(self):
        self.server = actionlib.SimpleActionServer("plan_to_goal", PlanToGoalAction, self.execute, False)
        self.server.start()

    def execute(self, req):
        plan_to_goal(req)
        self.server.set_succeeded()


if __name__ == '__main__':
    rospy.init_node('path_planner')

    server = PathPlanner()

    rospy.spin()
