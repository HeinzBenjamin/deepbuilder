"""
Copy this file to config.py and modify as needed.
"""
import os
from os.path import join

"""
`doodad.mount.MountLocal` by default ignores directories called "data"
If you're going to rename this directory and use EC2, then change
`doodad.mount.MountLocal.filter_dir`
"""
# The directory of the project, not source
LOCAL_LOG_DIR = join('/home/ros/deepbuilder/learning_ws', 'data')
