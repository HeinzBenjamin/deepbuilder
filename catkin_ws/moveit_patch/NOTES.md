This allows meshes to be passed as collision objects to a moveit planning scene as Mesh() objects.
The original version only supports passing meshes by file names, which must be stored on the hard drive.

To use the patch simply replace the original file

	/opt/ros/kinetic/lib/python2.7/dist-packages/moveit_commander/planning_scene_interface.py

with the new one in this very directory.

To make use of this function check the file in this deepbuilder catkin_ws for reference:

	deepbuilder/catkin_ws/src/deepbuilder/src/path_planning.py # the function plan_path contains the relevant code


It's something like:
	
	mesh = Mesh() #this is a shape_msgs Mesh, it must be filled with Point() vertices and MeshTriangles()
	planning_scene.add_mesh_custom(name, pose, mesh)

