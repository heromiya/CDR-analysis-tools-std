@ehco off
:: 2013-12-09 Movie creation with MobMapNative4Win ****** ::
::  - configuration specification described by H.Kanasugi ::
::                                                        ::
:: [Preparation]                                          ::
::  1) install ruby                                       ::
::  2) online environment for obtaining base map images   ::
:: ****************************************************** ::


:: [check and modify if required] *********************** ::
:: update path configuration of ruby                      ::
:: ****************************************************** ::
set PATH=%PATH%;C:\ruby\Ruby-2.0.0-x64\bin


:: set file pathes ************************************** ::
:: MDIR  : mobmap dir                                     ::
:: MOBMAP: executable file of mobmap native               ::
:: PRESET: configuration file path for mobmap             ::
:: FFMPEG: executable file of ffmpeg(movie creation)      ::
:: FRAMES: file path for frame images generated by mobmap ::
:: MOVIE : destination file of movie creation process     ::
:: ****************************************************** ::

:: run MobMapNativeWin ********************************** ::
set MDIR=MobMapNativeWin
set MOBMAP=MobmapNativeWin.exe
set PRESET=presets\sample.json

cd %MDIR%
%MOBMAP% -f %PRESET% -x yes
cd ..

:: run ffmpeg for movie creation ************************ ::
set FFMPEG=ffmpeg\bin\ffmpeg.exe
set FRAMES=MobMapNativeWin\out\frames
set MOVIE=MobMapNativeWin\out\movies\result.mp4

%FFMPEG%  -i %FRAMES%\%%04d.png ^
  -c:v libx264 ^
  -pix_fmt yuv420p ^
  %MOVIE%


pause
