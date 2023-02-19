import os
import time


formatted_time = lambda :time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
while 1:
    _time = formatted_time() + ".log"
    with open(_time,"w+") as f:
        f.write(_time)
    time.sleep(10)
    os.remove(_time)
    print("删除文件-->",_time)
    time.sleep(10)