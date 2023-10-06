import tkinter as tk
import numpy as np
import math

u = [[1, 1], [1, 1], [1, 1]]
v = [[1, 1], [1, 1], [1, 1]]

# function that finds the angle between two vectors
def angle(u, v):
    ang = round(np.arccos((np.inner(u, v)) / 
                            (np.linalg.norm(u) * np.linalg.norm(v))), 4)
    return ang

# function that classifys the y position of vectors 
def error_classification(u, v):
    # the following conditions return -1, 1, or 0 based on whether the
    # components of the y components are greater or less than the 
    # expected signal output
    if u[1] > v[1]:
        return -1
    if u[1] < v[1]:
        return 1
    else:
        return 0 
            
# function that provides feedback data based on used input compared with the
# expected input
def feedback(u, v):
    # angles is a list of lists containg the angle between vectors and a 
    # number giving information about whether a signal's y component is 
    # greater than or less than the other's.
    angles = []
    
    # this while loop appends angles between vectors to the list angles
    i = 0
    while i < len(u):
        ang = angle(u[i], v[i])
        classify = error_classification(u[i], v[i])
        angles.append([ang, classify])
        i += 1
    
    # this loop gives feedback to the user based on the angle between the
    # input vector and expected as well as whether the input vector's y 
    # component is greater than, less than, or equal to the y component of
    # the expected vector
    j = 0
    while j < len(angles):
        if (angles[j][0] != 0) and (angles[j][1] == -1):
            print("You are {}% off, play a little quieter".format(100 * angles[j][0]))
        if (angles[j][0] != 0) and (angles[j][1] == 1):
            print("You are {}% off, play a little louder".format(100 * angles[j][0]))
        else:
            print("Perfect")
        j += 1
        
print(feedback(u, v))


# Experimenting with GUI commands

# window
window = tk.Tk()
window.title("Chord Voicing Feedback")
window.geometry("200x150")

def top_voicing():
    label = tk.Label(window, text = "Practice voicing to the top")
    label.pack()
    
def bottom_voicing():
    label = tk.Label(window, text = "Practice voicing to the bottom")
    label.pack()
    
def mid_voicing():
    label = tk.Label(window, text = "Practice voicing the middle note")
    label.pack()

top_button = tk.Button(window, text = "Procedures", command = top_voicing)
top_button.pack()

bottom_button = tk.Button(window, text = "Procedures", command = bottom_voicing)
bottom_button.pack()

mid_button = tk.Button(window, text = "Procedures", command = mid_voicing)
mid_button.pack()

# run 
window.mainloop()