##############################################################################
# FFMPEG CHEATSHEET (中文速查表)  -  by skywind (created on 2020/09/20)
# Version: 2, Last Modified: 2020/09/21 12:17
# https://github.com/skywind3000/awesome-cheatsheets
##############################################################################


##############################################################################
# 基础参数
##############################################################################

-codecs                                                     # 列出可用编码
-formats                                                    # 列出支持的格式
-protocols                                                  # 列出支持的协议
-i input.mp4                                                # 指定输入文件
-c:v libx264                                                # 指定视频编码
-c:a aac                                                    # 指定音频编码
-vcodec libx264                                             # 旧写法
-acodec aac                                                 # 旧写法
-fs SIZE                                                    # 指定文件大小


##############################################################################
# 音频参数
##############################################################################

-aq QUALITY                                                 # 音频质量，编码器相关
-ar 44100                                                   # 音频采样率
-ac 1                                                       # 音频声道数量
-an                                                         # 禁止音频
-vol 512                                                    # 改变音量为 200%


##############################################################################
# 视频参数
##############################################################################

-aspect RATIO                                               # 长宽比 4:3, 16:9
-r RATE                                                     # 每秒帧率
-s WIDTHxHEIGHT                                             # 视频尺寸：640x480, 1024x768
-vn                                                         # 禁用视频


##############################################################################
# 码率设置
##############################################################################

-b:v 1M                                                     # 设置视频码率 1mbps/s
-b:a 1M                                                     # 设置音频码率 1mbps/s


##############################################################################
# 视频转码
##############################################################################

ffmpeg -i input.mov output.mp4                              # 转码为 MP4
ffmpeg -i input.mp4 -vn -c:a copy output.aac                # 提取音频
ffmpeg -i input.mp4 -vn -c:a mp3 output.mp3                 # 提取音频并转码
ffmpeg -i input.mov -c:v libx264 -c:a aac -2 out.mp4        # 指定编码参数
ffmpeg -i input.mov -c:v libvpx -c:a libvorbis out.webm     # 转换 webm
ffmpeg -i input.mp4 -ab 56 -ar 44100 -b 200 -f flv out.flv  # 转换 flv
ffmpeg -i input.mp4 -an animated.gif                        # 转换 GIF


##############################################################################
# 切分视频
##############################################################################

ffmpeg -i input.mp4 -ss 0 -t 60 first-1-min.mp4             # 切割开头一分钟
ffmpeg -i input.mp4 -ss 60 -t 60 second-1-min.mp4           # 一分钟到两分钟
ffmpeg -i input.mp4 -ss 00:01:23.000 -t 60 first-1-min.mp4  # 另一种时间格式


##############################################################################
# 视频尺寸
##############################################################################

ffmpeg -i input.mp4 -vf "scale=640:320" output.mp4          # 视频尺寸缩放
ffmpeg -i input.mp4 -vf "crop=400:300:10:10" output.mp4     # 视频尺寸裁剪


##############################################################################
# 其他用法
##############################################################################

ffmpeg -i sub.srt sub.ass                                   # 字幕格式转换
ffmpeg -i input.mp4 -vf ass=sub.ass out.mp4                 # 烧录字幕进视频
ffmpeg -i "<url>" out.mp4                                   # 下载视频


##############################################################################
# 相关资源
##############################################################################

https://cheatography.com/thetartankilt/cheat-sheets/ffmpeg/
http://qwinff.github.io/



