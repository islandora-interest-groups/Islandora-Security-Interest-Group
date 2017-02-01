#!/bin/bash

###########################################################
# Start the file with proper shebang and a block comment
# Shebang is set to the bash environment
# Link to all things bash http://tldp.org/LDP/abs/html/
#
# Use block commenting when comments are multiple lines
# Block comments are helpful when consistent
# 60 of the '#' signs at the top for the start block
# <- One '#' to the left with a space before the text
# Also you can use apps like ShellCheck.net

# Single Line comments are like this

# Multiple line comments are a few single line comments
# together. More than 4 lines should use a block comment

# =============== SCRIPT KEYPOINT NOTES ================= #
# Keypoint is almost identical as the top block comment
# total of 60 character across
# <---- Keep the text within this 60 character limit ----->
#
# Always assume this script can be run from any directory
# and state at the top if environmental variables are
# declared like @DRUPAL_HOME
# Time to change into the default Drupal directory
# Using Shell Check it says cd  needs to be followed by
# an OR exit. If no directory exit shell script

cd /var/www/drupal || exit

# This set the site's name to Islandora
# Drush requires the command to be run within site's root
# drupal directory otherwise you have to pass it a URI
drush -y vset site_name "Islandora"

# Use double quotes around the variable names
cd "$DRUPAL_HOME"/sites || exit

# Set the settings.php permissions
# Sets the file to READ and Execute for all groups
# See Hardening_Production_Server.md for more info
sudo chmod 555 "$DRUPAL_HOME"/sites/default/settings.php
