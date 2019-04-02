this is used for the AXI-LITE control registers' definitions

# sub-system declaration

this section will show some mechanism set in the sub system

## how to correct the camera to get the correct frame

during the correction of the camera, the CPU cannot control the sub system. 
1. first capture one frame and display it on the VGA
2. if the plate number isn't at the middle of the display area, press one *button* -- "gpio_capture_req" to ask the reload one frame in the buffer
3. Waiting for the ov5640_vsync signal to arrive, to synchronize the current frame
4. repeat step 1 - 3 to get the correct picture
5. pull up one *switch*-- "axil_camera_set_done" to tell CPU that the camera has been set correctly.

## how does the CPU communicates with HW

after received the signal "axil_camera_set_done", CPU will capture this frame, and will ask for capturing next frame while it process the previous frame by sending "axil_capture_req" to HW. while the frame has been captured, the HW will drive "axil_capture_done" to high

## how many BRAMs are totally need

two BRAM: one with the size of 320x240x12bit for VGA display, the other has the size of 40x30x1bit for CPU
