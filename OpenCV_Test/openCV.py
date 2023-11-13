import cv2

# Create a VideoCapture object to access the camera (0 is usually the default camera)
cap = cv2.VideoCapture(0)

# Check if the camera opened successfully
if not cap.isOpened():
    print("Error: Could not open the camera.")
    exit()

# Loop to capture frames from the camera
while True:
    ret, frame = cap.read()  # Read a frame from the camera

    if not ret:
        print("Error: Failed to capture a frame.")
        break

    # You can perform operations on the 'frame' here
    # For example, you can display it using imshow
    cv2.imshow('Camera', frame)

    # Exit the loop by pressing the 'q' key
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release the VideoCapture object and close all OpenCV windows
cap.release()
cv2.destroyAllWindows()