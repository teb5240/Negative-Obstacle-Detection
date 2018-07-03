#!/usr/bin/env python

import roslib
import rosbag
import sys
import numpy as np
import argparse
import os
import glob
import tf


def main(args):
	os.chdir(".")
	for filename in sorted(glob.glob("*.bag")):
		print "Parsing " + filename
		bag = rosbag.Bag(filename)

		# Parse /pose data
		print "Parsing pose data..."
		output_file = filename.replace('.bag','-pose.txt')
		File = open(output_file,"w")
		for topic, msg, t in bag.read_messages(topics = ['/pose']):
			File.write(str(msg.header.seq))
			File.write(',')
			File.write(str(msg.header.stamp.secs))
			File.write(',')
			File.write(str(msg.header.stamp.nsecs))
			File.write(',')
			File.write(str(msg.pose.position.x))
			File.write(',')
			File.write(str(msg.pose.position.y))
			File.write(',')
			File.write(str(msg.pose.position.z))
			File.write(',')
			File.write(str(msg.pose.orientation.x))
			File.write(',')
			File.write(str(msg.pose.orientation.y))
			File.write(',')
			File.write(str(msg.pose.orientation.z))
			File.write(',')
			File.write(str(msg.pose.orientation.w))
			File.write('\n')

		# # Parse /odom_rf2o data
		# print "Parsing odom_rf2o data..."
		# output_file = filename.replace('.bag','-odom_rf2o.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics = ['/odom_rf2o']):
		# 	File.write(str(msg.header.seq))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.secs))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.nsecs))
		# 	File.write(',')
		# 	File.write(str(msg.header.frame_id))
		# 	File.write(',')
		# 	File.write(str(msg.child_frame_id))
		# 	File.write(',')
		# 	File.write(str(msg.pose.pose.position.x))
		# 	File.write(',')
		# 	File.write(str(msg.pose.pose.position.y))
		# 	File.write(',')
		# 	File.write(str(msg.pose.pose.position.z))
		# 	File.write(',')
		# 	File.write(str(msg.pose.pose.orientation.x))
		# 	File.write(',')
		# 	File.write(str(msg.pose.pose.orientation.y))
		# 	File.write(',')
		# 	File.write(str(msg.pose.pose.orientation.z))
		# 	File.write(',')
		# 	File.write(str(msg.pose.pose.orientation.w))
		# 	File.write(',')
		# 	File.write(str(msg.pose.covariance))
		# 	File.write(',')
		# 	File.write(str(msg.twist.twist.linear.x))
		# 	File.write(',')
		# 	File.write(str(msg.twist.twist.linear.y))
		# 	File.write(',')
		# 	File.write(str(msg.twist.twist.linear.z))
		# 	File.write(',')
		# 	File.write(str(msg.twist.twist.angular.x))
		# 	File.write(',')
		# 	File.write(str(msg.twist.twist.angular.y))
		# 	File.write(',')
		# 	File.write(str(msg.twist.twist.angular.z))
		# 	File.write(',')
		# 	File.write(str(msg.twist.covariance))
		# 	File.write('\n')

		# Parse /lidarlites data
		print "Parsing lidarlites data..."
		output_file = filename.replace('.bag','-lidarlites.txt')
		File = open(output_file,"w")
		for topic, msg, t in bag.read_messages(topics = ['/lidarlites']):
			File.write(str(msg.header.seq))
			File.write(',')
			File.write(str(msg.header.stamp.secs))
			File.write(',')
			File.write(str(msg.header.stamp.nsecs))
			File.write(',')
			File.write(str(msg.header.frame_id))
			File.write(',')
			File.write(str(msg.min_range))
			File.write(',')
			File.write(str(msg.max_range))
			File.write(',')
			File.write(str(msg.range))
			File.write('\n')

		# Parse /MotorData data
		print "Parsing motor data..."
		output_file = filename.replace('.bag','-motordata.txt')
		File = open(output_file,"w")
		for topic, msg, t in bag.read_messages(topics = ['/MotorData']):
			File.write(str(msg.header.seq))
			File.write(',')
			File.write(str(msg.header.stamp.secs))
			File.write(',')
			File.write(str(msg.header.stamp.nsecs))
			File.write(',')
			File.write(str(msg.array.data[0]))
			File.write(',')
			File.write(str(msg.array.data[1]))
			File.write(',')
			File.write(str(msg.array.data[2]))
			File.write(',')
			File.write(str(msg.array.data[3]))
			File.write(',')
			File.write(str(msg.array.data[4]))
			File.write(',')
			File.write(str(msg.array.data[5]))
			File.write('\n')

		# # Parse /wheel_encoder/left_wheel data
		# print "Parsing left wheel encoder data..."
		# output_file = filename.replace('.bag','-left_wheelencoder_data.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics = ['/wheel_encoder/left_wheel']):
		# 	File.write(str(msg.header.seq))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.secs))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.nsecs))
		# 	File.write(',')
		# 	File.write(str(msg.header.frame_id))
		# 	File.write(',')
		# 	File.write(str(msg.counts))
		# 	File.write(',')
		# 	File.write(str(msg.delta_counts))
		# 	File.write(',')
		# 	File.write(str(msg.angular_velocity))
		# 	File.write(',')
		# 	File.write(str(msg.indexed))
		# 	File.write('\n')

		# # Parse /wheel_encoder/right_wheel data
		# print "Parsing right wheel encoder data..."
		# output_file = filename.replace('.bag','-right_wheelencoder_data.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics = ['/wheel_encoder/right_wheel']):
		# 	File.write(str(msg.header.seq))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.secs))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.nsecs))
		# 	File.write(',')
		# 	File.write(str(msg.header.frame_id))
		# 	File.write(',')
		# 	File.write(str(msg.counts))
		# 	File.write(',')
		# 	File.write(str(msg.delta_counts))
		# 	File.write(',')
		# 	File.write(str(msg.angular_velocity))
		# 	File.write(',')
		# 	File.write(str(msg.indexed))
		# 	File.write('\n')


		# # Parse /adis_eeg data
		# print "Parsing ADIS EEG data..."
		# output_file = filename.replace('.bag','-adis_eeg_data.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics = ['/adis_eeg']):
		# 	File.write(str(msg.header.seq))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.secs))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.nsecs))
		# 	File.write(',')
		# 	File.write(str(msg.header.frame_id))
		# 	File.write(',')
		# 	File.write(str(msg.counter))
		# 	File.write(',')
		# 	File.write(str(msg.status_ADIS1))
		# 	File.write(',')
		# 	File.write(str(msg.status_ADIS2))
		# 	File.write(',')
		# 	File.write(str(msg.eeg_ADIS1[0]))
		# 	File.write(',')
		# 	File.write(str(msg.eeg_ADIS1[1]))
		# 	File.write(',')
		# 	File.write(str(msg.eeg_ADIS1[2]))
		# 	File.write(',')
		# 	File.write(str(msg.eeg_ADIS1[3]))
		# 	File.write(',')
		# 	File.write(str(msg.eeg_ADIS1[4]))
		# 	File.write(',')
		# 	File.write(str(msg.eeg_ADIS1[5]))
		# 	File.write(',')
		# 	File.write(str(msg.eeg_ADIS1[6]))
		# 	File.write(',')
		# 	File.write(str(msg.eeg_ADIS1[7]))
		# 	File.write(',')
		# 	File.write(str(msg.eeg_ADIS2[0]))
		# 	File.write(',')
		# 	File.write(str(msg.eeg_ADIS2[1]))
		# 	File.write(',')
		# 	File.write(str(msg.eeg_ADIS2[2]))
		# 	File.write(',')
		# 	File.write(str(msg.eeg_ADIS2[3]))
		# 	File.write(',')
		# 	File.write(str(msg.eeg_ADIS2[4]))
		# 	File.write(',')
		# 	File.write(str(msg.eeg_ADIS2[5]))
		# 	File.write(',')
		# 	File.write(str(msg.eeg_ADIS2[6]))
		# 	File.write(',')
		# 	File.write(str(msg.eeg_ADIS2[7]))
		# 	File.write('\n')

		# # Parse /raw_encoder_data data
		# print "Parsing raw_encoder_data data..."
		# output_file = filename.replace('.bag','-raw_encoder_data.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics = ['/encoders/raw_encoder_data']):
		# 	File.write(str(msg.x)) # Left wheel data
		# 	File.write(',')
		# 	File.write(str(msg.y)) # Right wheel data
		# 	File.write(',')
		# 	File.write(str(msg.z))
		# 	File.write('\n')

		# Parse /encoder_velocity data
		print "Parsing raw_encoder data..."
		output_file = filename.replace('.bag','-raw_encoder.txt')
		File = open(output_file,"w")
		for topic, msg, t in bag.read_messages(topics = ['/raw_encoder']):
			File.write(str(msg.header.seq))
			File.write(',')
			File.write(str(msg.header.stamp.secs))
			File.write(',')
			File.write(str(msg.header.stamp.nsecs))
			File.write(',')
			File.write(str(msg.counts))
			File.write(',')
			File.write(str(msg.angular_velocity))
			File.write(',')
			File.write(str(msg.delta_counts))
			File.write('\n')


		
		# Parse /encoder_velocity data
		print "Parsing encoder_vel data..."
		output_file = filename.replace('.bag','-encoder_vel.txt')
		File = open(output_file,"w")
		for topic, msg, t in bag.read_messages(topics = ['/encoder_vel']):
			File.write(str(msg.header.seq))
			File.write(',')
			File.write(str(msg.header.stamp.secs))
			File.write(',')
			File.write(str(msg.header.stamp.nsecs))
			File.write(',')
			File.write(str(msg.array.data[0]))
			File.write(',')
			File.write(str(msg.array.data[1]))
			File.write('\n')


		# Parse /joy data
		print "Parsing joy data..."
		output_file = filename.replace('.bag','-joy.txt')
		File = open(output_file,"w")
		for topic, msg, t in bag.read_messages(topics = ['/joy']):
			File.write(str(msg.header.seq))
			File.write(',')
			File.write(str(msg.header.stamp.secs))
			File.write(',')
			File.write(str(msg.header.stamp.nsecs))
			File.write(',')
			File.write(str(msg.axes[0]))
			File.write(',')
			File.write(str(msg.axes[1]))
			File.write('\n')

		# # Parse /amcl_pose data
		# print "Parsing amcl_pose data..."
		# output_file = filename.replace('.bag','-amcl_pose.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics= ['/amcl_pose']):
		# 	File.write(str(msg.header.seq))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.secs))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.nsecs))
		# 	File.write(',')
		# 	File.write(str(msg.pose.pose.position.x))
		# 	File.write(',')
		# 	File.write(str(msg.pose.pose.position.y))
		# 	File.write(',')
		# 	File.write(str(msg.pose.pose.position.z))
		# 	File.write(',')
		# 	File.write(str(msg.pose.pose.orientation.x))
		# 	File.write(',')
		# 	File.write(str(msg.pose.pose.orientation.y))
		# 	File.write(',')
		# 	File.write(str(msg.pose.pose.orientation.z))
		# 	File.write(',')
		# 	File.write(str(msg.pose.pose.orientation.w))
		# 	# File.write(',')
		# 	# File.write(str(msg.pose.covariance))
		# 	File.write('\n')

		
		# # Parse /hector_slam data
		# print "Parsing hector_slam data..."
		# output_file = filename.replace('.bag','-hector_slam.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics = ['/slam_out_pose']):
		# 	File.write(str(msg.header.seq))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.secs))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.nsecs))
		# 	File.write(',')
		# 	File.write(str(msg.pose.position.x))
		# 	File.write(',')
		# 	File.write(str(msg.pose.position.y))
		# 	File.write(',')
		# 	File.write(str(msg.pose.position.z))
		# 	File.write(',')
		# 	File.write(str(msg.pose.orientation.x))
		# 	File.write(',')
		# 	File.write(str(msg.pose.orientation.y))
		# 	File.write(',')
		# 	File.write(str(msg.pose.orientation.z))
		# 	File.write(',')
		# 	File.write(str(msg.pose.orientation.w))
		# 	File.write('\n')

		
		# # Parse /tf data
		# print "Parsing map to odom tf data..."
		# output_file = filename.replace('.bag','-map_to_odom_tf.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics= ['/tf']):
		# 	if msg.transforms[0].header.frame_id == 'map' and msg.transforms[0].child_frame_id == 'odom':

		# 		quat = msg.transforms[0].transform.rotation
		# 		euler = tf.transformations.euler_from_quaternion((quat.x,quat.y,quat.z,quat.w))
		# 		roll = euler[0]
		# 		pitch = euler[1]
		# 		yaw = euler[2]
				
		# 		File.write(str(msg.transforms[0].header.seq))
		# 		File.write(',')
		# 		File.write(str(msg.transforms[0].header.stamp.secs))
		# 		File.write(',')	
		# 		File.write(str(msg.transforms[0].header.stamp.nsecs))
		# 		File.write(',')
		# 		File.write(str(msg.transforms[0].transform.translation.x))
		# 		File.write(',')
		# 		File.write(str(msg.transforms[0].transform.translation.y))
		# 		File.write(',')
		# 		File.write(str(msg.transforms[0].transform.translation.z))
		# 		File.write(',')
		# 		File.write(str(roll))
		# 		File.write(',')
		# 		File.write(str(pitch))
		# 		File.write(',')
		# 		File.write(str(yaw))
		# 		File.write('\n')

		# # Parse /tf data
		# print "Parsing odom to base_link tf data..."
		# output_file = filename.replace('.bag','-odom_to_baselink_tf.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics= ['/tf']):
		# 	if msg.transforms[0].header.frame_id == 'odom' and msg.transforms[0].child_frame_id == 'base_link':

		# 		quat = msg.transforms[0].transform.rotation
		# 		euler = tf.transformations.euler_from_quaternion((quat.x,quat.y,quat.z,quat.w))
		# 		roll = euler[0]
		# 		pitch = euler[1]
		# 		yaw = euler[2]
				
		# 		File.write(str(msg.transforms[0].header.seq))
		# 		File.write(',')
		# 		File.write(str(msg.transforms[0].header.stamp.secs))
		# 		File.write(',')	
		# 		File.write(str(msg.transforms[0].header.stamp.nsecs))
		# 		File.write(',')
		# 		File.write(str(msg.transforms[0].transform.translation.x))
		# 		File.write(',')
		# 		File.write(str(msg.transforms[0].transform.translation.y))
		# 		File.write(',')
		# 		File.write(str(msg.transforms[0].transform.translation.z))
		# 		File.write(',')
		# 		File.write(str(roll))
		# 		File.write(',')
		# 		File.write(str(pitch))
		# 		File.write(',')
		# 		File.write(str(yaw))
		# 		File.write('\n')



		# # Parse /ICR_States data
		# print "Parsing ICR_States data..."
		# output_file = filename.replace('.bag','-ICR_States.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics= ['/ICR_States']):
		# 	File.write(str(msg.header.seq))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.secs))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.nsecs))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[0]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[1]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[2]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[3]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[4]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[5]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[6]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[7]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[8]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[9]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[10]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[11]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[12]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[13]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[14]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[15]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[16]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[17]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[18]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[19]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[20]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[21]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[22]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[23]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[24]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[25]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[26]))
		# 	File.write(',')
		# 	File.write(str(msg.array.data[27]))
		# 	File.write('\n')


		# # Parse /left_joystick data
		# print "Parsing /left_joystick data..."
		# output_file = filename.replace('.bag','-left_joystick.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics = ['/left_joystick/joy']):
		# 	File.write(str(msg.header.seq))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.secs))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.nsecs))
		# 	File.write(',')
		# 	File.write(str(msg.axes[0]))
		# 	File.write(',')
		# 	File.write(str(msg.axes[1]))
		# 	File.write('\n')

		# # Parse /right_joystick data
		# print "Parsing /right_joystick data..."
		# output_file = filename.replace('.bag','-right_joystick.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics = ['/right_joystick/joy']):
		# 	File.write(str(msg.header.seq))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.secs))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.nsecs))
		# 	File.write(',')
		# 	File.write(str(msg.axes[0]))
		# 	File.write(',')
		# 	File.write(str(msg.axes[1]))
		# 	File.write('\n')

		# # Parse /joystick_remote data
		# print "Parsing /joystick_remote data..."
		# output_file = filename.replace('.bag','-joystick_remote.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics = ['/joystick_remote/joy']):
		# 	File.write(str(msg.header.seq))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.secs))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.nsecs))
		# 	File.write(',')
		# 	File.write(str(msg.axes[0]))
		# 	File.write(',')
		# 	File.write(str(msg.axes[1]))
		# 	File.write(',')
		# 	File.write(str(msg.axes[2]))
		# 	File.write(',')
		# 	File.write(str(msg.axes[3]))
		# 	File.write('\n')

		# # Parse /joystick_on_wheelchair data
		# print "Parsing /joystick_on_wheelchair data..."
		# output_file = filename.replace('.bag','-joystick_on_wheelchair.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics = ['/joystick_on_wheelchair/joy']):
		# 	File.write(str(msg.header.seq))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.secs))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.nsecs))
		# 	File.write(',')
		# 	File.write(str(msg.axes[0]))
		# 	File.write(',')
		# 	File.write(str(msg.axes[1]))
		# 	File.write('\n')

		# # Parse /magnetic/magnetic_field
		# print "Parsing /magnetic/sensor_1..."
		# output_file = filename.replace('.bag','-magnetic__sensor_1.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics = ['/magnetic/sensor_1']):
		# 	File.write(str(msg.header.seq))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.secs))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.nsecs))
		# 	File.write(',')
		# 	File.write(str(msg.vector.x))
		# 	File.write(',')
		# 	File.write(str(msg.vector.y))
		# 	File.write(',')
		# 	File.write(str(msg.vector.z))
		# 	File.write(',')
		# 	File.write('\n')
		# print "Parsing /magnetic/sensor_2..."
		# output_file = filename.replace('.bag','-magnetic_sensor_2.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics = ['/magnetic/sensor_2']):
		# 	File.write(str(msg.header.seq))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.secs))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.nsecs))
		# 	File.write(',')
		# 	File.write(str(msg.vector.x))
		# 	File.write(',')
		# 	File.write(str(msg.vector.y))
		# 	File.write(',')
		# 	File.write(str(msg.vector.z))
		# 	File.write(',')
		# 	File.write('\n')
		# print "Parsing /magnetic/sensor_3..."
		# output_file = filename.replace('.bag','-magnetic_sensor_3.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics = ['/magnetic/sensor_3']):
		# 	File.write(str(msg.header.seq))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.secs))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.nsecs))
		# 	File.write(',')
		# 	File.write(str(msg.vector.x))
		# 	File.write(',')
		# 	File.write(str(msg.vector.y))
		# 	File.write(',')
		# 	File.write(str(msg.vector.z))
		# 	File.write(',')
		# 	File.write('\n')
		# print "Parsing /magnetic/sensor_4..."
		# output_file = filename.replace('.bag','-magnetic_sensor_4.txt')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics = ['/magnetic/sensor_4']):
		# 	File.write(str(msg.header.seq))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.secs))
		# 	File.write(',')
		# 	File.write(str(msg.header.stamp.nsecs))
		# 	File.write(',')
		# 	File.write(str(msg.vector.x))
		# 	File.write(',')
		# 	File.write(str(msg.vector.y))
		# 	File.write(',')
		# 	File.write(str(msg.vector.z))
		# 	File.write(',')
		# 	File.write('\n')


		# # Parse /powersys/power_sys
		# print "Parsing /power_data..."
		# output_file = filename.replace('.bag','-OCVSOC1A2')
		# File = open(output_file,"w")
		# for topic, msg, t in bag.read_messages(topics = ['/power_data']):
		# 	File.write(str(msg.data))


		print "Finished parsing " + filename

if __name__ == '__main__':
	main(sys.argv)
