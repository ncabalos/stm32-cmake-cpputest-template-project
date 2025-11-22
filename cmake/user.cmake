# The definition PROJECT_ROOT is available to all cmake files.
# This is useful for setting paths relative to the project root.

# Add your project specific cmake settings here
#
# Example:
# set(FOOBAR ${PROJECT_ROOT}/your/path/here)

# Add external directories here using add_subdirectory
# 
#   add_subdirectory(<path-to-external-directory> <binary-dir-name>)
#
# Example:
add_subdirectory(${PROJECT_ROOT}/Modules/Blinky Blinky)