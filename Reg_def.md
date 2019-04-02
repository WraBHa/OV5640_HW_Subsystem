# signal definition

port name | direction | definition
--------- | --------- | ----------
axil_binary_threshold | -/W | this is the binarylization threshold for hardware to binarylize the pixel
axil_capture_req | -/W | this is used to request the hardware to caputure a new frame (also identification finish)
axil_capture_done | R/- | this signal tell the master that current frame have been captured
axil_camera_set_done | R/- | changed mannually by the switch button to tell the master camera has been set correctly

