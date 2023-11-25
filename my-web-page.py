import subprocess

req_mem = '4096'
print("Checking Requirements to run osrm commands")
avail = subprocess.Popen("free -m | grep Mem | awk '{print $2}'", shell=True, stdout=subprocess.PIPE).stdout.read()
a = avail.decode()

if a > req_mem:
    print("You have sufficient memory of {}".format(a))
    exit(0)
else:
    print("{} is not Sufficient for Running OSRM".format(a))
    exit(1)
