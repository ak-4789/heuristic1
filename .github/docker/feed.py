with open("file.txt","w") as file:
    file.write("Writing from a python file using writing mode")
file = open("file.txt","r")
print(file.read())