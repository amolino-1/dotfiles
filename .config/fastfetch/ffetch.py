#!/usr/bin/env python3
import random, tempfile, subprocess, os, sys

# Your 24-bit Rosepine colours
rosepine_colors = [
    '\x1b[38;2;62;143;176m',   # pine
    '\x1b[38;2;156;207;216m',  # foam
    '\x1b[38;2;196;167;231m',  # iris
    '\x1b[38;2;234;154;151m',  # rose
    '\x1b[38;2;235;111;146m',  # love
]
reset = '\x1b[0m'

# Pick two different colours
first, second = random.sample(rosepine_colors, 2)

# Build the ASCII logo
logo = f"""{first}       /\\
{first}      /  \\
{first}     /\\   \\
{second}    /      \\
{second}   /   ,,   \\
{second}  /   |  |  -\\
{second} /_-''    ''-_\\
{reset}
"""

# Write to a temp file
tf = tempfile.NamedTemporaryFile(mode='w', delete=False)
tf.write(logo)
tf.close()

# Run fastfetch with that logo and your modules
cmd = [
    'fastfetch',
    '-l', tf.name,
    '-s', 'OS:Uptime:Packages:Resolution:WM:CPU:GPU:Memory:LocalIP'
]
proc = subprocess.run(cmd)
os.unlink(tf.name)
sys.exit(proc.returncode)
