std_msgs/Header header
string timestamp              # ISO format timestamp
int32 total_messages          # Total RTCM messages processed
string message_counts         # JSON string of message type counts
string time_span              # JSON string of start/end timestamps
string critical_messages_check # JSON string of missing critical messages
string base_station_info      # JSON string of base station details
string antenna_info           # JSON string of antenna/receiver details
string signal_quality         # JSON string of signal quality per GNSS system
string satellite_info         # JSON string of satellite details per system
string glonass_biases         # JSON string of GLONASS bias data
string overall_analysis       # JSON string of RTK performance summary