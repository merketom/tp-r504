#!/usr/bin/python3
import os
import signal as sig
from time import sleep
import sys

def signal_handler(sig_num, frame):
	print("Réception du signal :", sig.Signals(sig_num).name)
	if sig_num == sig.SIGINT:
		sys.exit(0)
	elif sig_num == sig.SIGQUIT:
		pass

sig.signal(sig.SIGINT, signal_handler)
sig.signal(sig.SIGQUIT, signal_handler)


x = 1
while True:
		print("pid=", os.getpid(), x)
		sleep(0.5)
		x += 1

