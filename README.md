# Cooperative Transportation
![](https://hackmd.io/_uploads/S142pmH-T.png =300x200)

## Prequisites
1. Able to run rotor_simulator 
2. Ubuntu version : 18.04 or 20.04 (If you are able to run rotor_simulator example, that will be fine.)
3. The version of gazebo must >9.0
4. MATLAB version : **2021b** (Haven't tested the version above)
5. Cmake version > **3.15.5** 
- How to check? 
```bash=
$ cmake --version
```

- If the cmake version is below **3.15.5**, then try to download the higher version of cmake ([Download Link](https://cmake.org/download/)), take 3.15.7 for example
```bash=
$ cd cmake-3.15.7
$ sudo ./bootstrap 
$ sudo make
$ sudo make install
```


4. Download Multiuav_ros (branch: rigid) in catkin_ws
    - Link: https://github.com/leeandy0822/Multiuavs_ros/tree/rigid 
    - This package contains customized gazebo model, ros message, and utilities for gazebo simulation

## Add customized ros message in MATLAB
1. MATLAB need to identify the ros message 
    - Delete the /matlab_msg_gen_ros1 inside the mav_comm folder if exist
    - **Go the root of this project**
    - run this command in **MATLAB Console Window** not **command window**
```bash=
$ rosgenmsg("mav_comm")
```
2. Result will be like this
![](https://hackmd.io/_uploads/Sy9uPQSWa.png =600x300)
3. follow the steps 
4. See if **mav_msgs/System_pose** exist when run **$ rosmsg list**
![](https://hackmd.io/_uploads/r1XJOQH-a.png =300x130)

## How to use
1. Initialize gazebo world (Even or Optimized)
```bash
$ roslaunch rotors_gazebo firefly_transportation.launch (Even Formation) 
$ roslaunch rotors_gazebo optimal_transportation.launch (Optimized Formation)
```
2. press the start button of the gazebo world after 15 seconds (To allow the UAV attach to the payload)
3. If you run the Even formation world, change SELECT_POSITION_MODE in the matlab main.m to MODE_NORMAL to allow better gain 
![](https://hackmd.io/_uploads/H1mEqQHZp.png =350x120)
4. run MATLAB main.c

## Trouble Shoot
1. If the UAV cannot takeoff, turn off the gazebo world and run again
2. If the MATLAB code cannot find some variables, please check the MATLAB is run at the correct workspace

## Gazebo Simulation Code 

- **main.m**
    - Choose the correct formation for transporting payload
        - even
        - optimized
- **four_optim.m**
    - The nonlinear optimization is designed here, the output will be UAV attachment positions around the boundary

- controller.m
    - The connection between translation controller and rotational controller is written here
    - The positive gain kx, kv, kR, kw can also be adjusted here

- feedforward_force_ctrl.m
    - The translation controller and mass estimator
    - The adaptive gain and CL gain can be adjusted here

- feedforward_moment_ctrl.m
    - The rotational controller and CoG estimator
    - The adaptive gain and CL gain can be adjusted here
    
- trajector.m
    - The trajectory can be designed here

- distribution.m
    - The total control force and moment can be distributed to four individual UAV here

- getPose.m
    - MATLAB will subscribe the position and orientation information of each individual UAV
- wrench_to_ros.m
    - MATLAB will publish the force and moment to each UAV
