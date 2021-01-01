# waterMon
Project for monitoring &amp; reporting on water usage at my home

The subprojects are

## showerFlow
Code that runs on the raspberry pi to count pulses from the flow sensor

## showerMonitor
Code that gets triggered from a postgres NOTIFY message. Handles notifications after a shower is complete.

## www
Website that displays recent showers.
