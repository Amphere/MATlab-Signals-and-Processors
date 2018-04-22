
%Two plots of different wave length 
%{
time = 0:.01:1;
x=cos(time.*pi.*25);
subplot(2,1,1)
plot(time, fade(x));



subplot(2,1,2)
level = 0:.01:1;
y=cos(level.*pi.*1);
plot(level,fade(y));
%}

%Loading 'Fall' then playing the sounds
 %{
  function [out] = EE235codelab2(in,c)
  n = 5;
  for c = 1:n
      
      load('fall.mat');
      
      fs=8000;
     
      sound(fall,fs);
      
      pause(1)
      
     end 
  return 
  end
  %}

%loading 'fall' then delaying the sound signal 
%{
function [DelayOut] = EE235codelab2(in,z)

DelayOut=[zeros(1,1000), y];

y=fall.'

x= zeros(1,1000) 

z= [ x y ]

subplot(211)

plot(z)

subplot(212)

plot(fall)

end
%}

%{
equalizing two sound signals and playing them together 

 
if length(fall) > length(trumpet)
    trumpet = [trumpet;zeros(1,(length(fall)-length(trumpet)))];
    length(trumpet)
else  
        length(trumpet)>length(fall)
        fall = [fall;zeros(1,(length(trumpet)-length(fall)))'];
        length(fall)
   
end
mix=fall + trumpet 
subplot(311)
plot(fall)
subplot(312)
plot(trumpet)
subplot(313)
plot(mix)

sound(mix, fs)
%}    

%{
Simple convolution 

h = [1 zeros(1,20) .5 zeros(1,10)]
subplot(311)
plot(h)
x = [0 1:10 ones(1,5)*5 zeros(1,40)];
subplot(312)
plot(x)
y = conv(x,h);
subplot(313)
plot(y)
%}

%{
convolution of 'Fall' and a different function; 
      
      fs=8000;
      
      h = [-1 zeros(1,10000) -.25 zeros(1,1000)];%modification, making H negative
      subplot(311)
      plot(h)
      
      y = conv(fall, h); 
      subplot(312)
      plot(fall)
      subplot(313)
      plot(y)
     
      soundsc(y,fs);
%}

%{
modification of the above sound to play more fluently 
   
      Fs=8000;
      
      h = [1 zeros(1, round(Fs/4)) 0.25 zeros(1,1000)];
      subplot(311)
      plot(h)
      
      y = conv(h,fall); 
      subplot(312)
      plot(fall)
      subplot(313)
      plot(y)
     
      soundsc(y,Fs);
      
      The sound played is more in sync and complete when manipulations are
      implemented from exercise 3 to 4
 
      %}
      
      
      




