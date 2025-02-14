# RTK Interfaces

## Overview
ROS 2 message definitions for RTK GNSS data processing. This package provides custom message types for handling RTK (Real-Time Kinematics) GNSS data, including baseline calculations, GNSS status, and satellite information.

## Message Definitions

### BaselineStatus.msg
Message for RTK baseline information between base station and rover.
```msg
std_msgs/Header header
float64 distance_3d          # 3D distance between base and rover (meters)
float64 distance_2d          # 2D distance between base and rover (meters)
float64 height_difference    # Height difference between base and rover (meters)
sensor_msgs/NavSatFix base_position    # Base station position
sensor_msgs/NavSatFix rover_position   # Rover position
uint8 satellite_count        # Number of satellites in view
float32 average_snr         # Average signal-to-noise ratio
string rtk_status           # RTK status (NONE, FLOAT, FIXED)
```

### GNSSStatus.msg
Message for overall GNSS system status.
```msg
std_msgs/Header header
uint8 satellite_count           # Total number of satellites
float32[] snr_values           # Signal-to-noise ratios for all satellites
uint16[] rtcm_msg_ids          # Received RTCM message types
string[] satellite_systems      # Active satellite systems (GPS, GLONASS, etc.)
string coordinate_system        # Coordinate system in use (e.g., "WGS84")
```

### Satellite.msg
Message for individual satellite information.
```msg
std_msgs/Header header
string satellite_id            # Satellite identifier (e.g., "G01", "R02")
float32 carrier_phase         # Carrier phase measurement
float32 pseudorange          # Pseudorange measurement
float32 doppler              # Doppler measurement
float32 snr                  # Signal-to-noise ratio
uint8 lock_time_indicator    # Lock time indicator
bool half_cycle_valid        # Half-cycle ambiguity indicator
```

## Dependencies
- `std_msgs`
- `sensor_msgs`

## Installation

### From Source
```bash
# Create a ROS 2 workspace
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws/src

# Clone the repository
git clone https://github.com/your-username/rtk_interfaces.git

# Install dependencies
cd ~/ros2_ws
rosdep install --from-paths src --ignore-src -r -y

# Build
colcon build --packages-select rtk_interfaces
```

### Usage in Other Packages
To use these messages in your package:

1. Add dependency to your `package.xml`:
```xml
<depend>rtk_interfaces</depend>
```

2. If using CMake, add to your `CMakeLists.txt`:
```cmake
find_package(rtk_interfaces REQUIRED)
```

3. In Python:
```python
from rtk_interfaces.msg import BaselineStatus, GNSSStatus, Satellite
```

4. In C++:
```cpp
#include "rtk_interfaces/msg/baseline_status.hpp"
#include "rtk_interfaces/msg/gnss_status.hpp"
#include "rtk_interfaces/msg/satellite.hpp"
```

## Examples
View message definitions:
```bash
# Source your workspace
source ~/ros2_ws/install/setup.bash

# View message definitions
ros2 interface show rtk_interfaces/msg/BaselineStatus
ros2 interface show rtk_interfaces/msg/GNSSStatus
ros2 interface show rtk_interfaces/msg/Satellite
```
